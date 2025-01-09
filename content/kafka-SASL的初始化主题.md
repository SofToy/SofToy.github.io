+++
title = "kafka在SASL配置下初始化主题遇到的问题"
+++

## 问题描述
由于部署方面要求变化，需要采用SASL_SSL对kafka的连接进行保护。

在迁移配置过程中遇到了几种报错


<details>
    <summary>证书校验错误（自签名需跳过证书验证）</summary>

```
[2025-01-09 10:36:52,997] WARN [AdminClient clientId=adminclient-1] Metadata update failed due to authentication error (org.apache.kafka.clients.admin.internals.AdminMetadataManager)
org.apache.kafka.common.errors.SslAuthenticationException: SSL handshake failed
Caused by: javax.net.ssl.SSLHandshakeException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```
</details>
<details>
    <summary>kafka-topics.sh超时错误</summary>

```
Error while executing topic command : Timed out waiting for a node assignment. Call: createTopics
[2025-01-09 11:12:41,523] ERROR org.apache.kafka.common.errors.TimeoutException: Timed out waiting for a node assignment. Call: createTopics
 (kafka.admin.TopicCommand$)
```
</details>
<details>
    <summary>kafka-topics.sh错误</summary>

```
[2025-01-09 10:31:41,739] WARN [AdminClient clientId=adminclient-1] Connection to node -1 (kafka1/172.18.0.2:9092) terminated during authentication. This may happen due to any of the following reasons: (1) Authentication failed due to invalid credentials with brokers older than 1.0.0, (2) Firewall blocking Kafka TLS traffic (eg it may only allow HTTPS traffic), (3) Transient network issue. (org.apache.kafka.clients.NetworkClient)
```
</details>
<details>
    <summary>KafkaAdminClient错误（sasl.jaas.config=设置问题）</summary>

```
Exception in thread "main" org.apache.kafka.common.KafkaException: Failed to create new KafkaAdminClient
        at org.apache.kafka.clients.admin.KafkaAdminClient.createInternal(KafkaAdminClient.java:551)
        at org.apache.kafka.clients.admin.KafkaAdminClient.createInternal(KafkaAdminClient.java:488)
        at org.apache.kafka.clients.admin.Admin.create(Admin.java:134)
        at kafka.admin.TopicCommand$TopicService$.createAdminClient(TopicCommand.scala:203)
        at kafka.admin.TopicCommand$TopicService$.apply(TopicCommand.scala:207)
        at kafka.admin.TopicCommand$.main(TopicCommand.scala:51)
        at kafka.admin.TopicCommand.main(TopicCommand.scala)
Caused by: java.lang.IllegalArgumentException: Could not find a 'KafkaClient' entry in the JAAS configuration. System property 'java.security.auth.login.config' is not set
```
</details>

### 原配置问题分析
bitnami/kafka的compose
```
version: '3.3'
services:
  kafka1:
    restart: always
    image: 'bitnami/kafka:3.5.2'
    container_name: kafka
    volumes:
      - ./certs/:/bitnami/kafka/config/certs/
    ports:
      - 9092:9092
    environment:
      - KAFKA_ENABLE_KRAFT=yes
      - KAFKA_KRAFT_CLUSTER_ID=r1zt_1234RuT7W2NJsB_GA
      - KAFKA_CFG_PROCESS_ROLES=broker,controller
      - KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER
      - KAFKA_INTER_BROKER_LISTENER_NAME=SASL_SSL
      - KAFKA_CFG_LISTENERS=SASL_SSL://:9092,CONTROLLER://:9093
      - KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:SASL_PLAINTEXT,SASL_SSL:SASL_SSL
      - KAFKA_CFG_ADVERTISED_LISTENERS=SASL_SSL://kafka1:9092
      - KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@kafka1:9093
      - KAFKA_CFG_BROKER_ID=0
      - KAFKA_CFG_NODE_ID=0
      - KAFKA_CERTIFICATE_PASSWORD=mySuperPassword
      - KAFKA_CFG_SASL_MECHANISM_CONTROLLER_PROTOCOL=PLAIN
      - KAFKA_CFG_SASL_MECHANISM_INTER_BROKER_PROTOCOL=PLAIN
      - KAFKA_CLIENT_USERS=foo,bar
      - KAFKA_CLIENT_PASSWORDS=UserFooPass,UserBarPass
      - DISABLE_WELCOME_MESSAGE=1
```
使用`docker exec -it kafka kafka-topics.sh --create --bootstrap-server kafka1:9092 --replication-factor 1 --partitions 1 --topic mySuperTopic`
会出现上述kafka-topics.sh超时错误

在网上查询了资料后，在试错了各种配置问题后
### 最终解决方案
在原kafka基础上挂载一个initKafka.sh脚本，用于初始化topic
```bash
#!/usr/bin/bash

echo "security.protocol=SASL_SSL" > /tmp/client.properties
echo "sasl.mechanism=PLAIN" >> /tmp/client.properties
echo 'sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required username="foo" password="UserFooPass";' >> /tmp/client.properties
echo "ssl.truststore.location=/bitnami/kafka/config/certs/kafka.truststore.jks" >> /tmp/client.properties
echo "ssl.truststore.password=mySuperPassword" >> /tmp/client.properties
echo "ssl.endpoint.identification.algorithm=" >> /tmp/client.properties

/opt/bitnami/kafka/bin/kafka-topics.sh --create --bootstrap-server kafka1:9092 --replication-factor 1 --partitions 1 --topic mySuperTopic --command-config /tmp/client.properties
```

docker compose up -d后，使用`docker exec -it kafka /bin/bash /initKafka.sh`初始化topic即可


## 参考
- <https://stackoverflow.com/questions/50684956/kafka-could-not-find-a-kafkaclient-entry-in-the-jaas-configuration-java>
- <https://github.com/bitnami/charts/issues/19827>