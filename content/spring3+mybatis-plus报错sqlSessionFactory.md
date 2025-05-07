+++
title = "spring3+mybatis-plus报错sqlSessionFactory"
date = 2025-05-07
+++

开了一个新项目用spring boot 3，用了mybatis-plus配置数据库报错如下
```
org.springframework.beans.factory.UnsatisfiedDependencyException: Error creating bean with name 'inputLogService': Unsatisfied dependency expressed through field 'baseMapper': Error creating bean with name 'inputLogMapper' defined in file [C:\WorkSpace\Demo-server\target\classes\com\Demo\mapper\InputLogMapper.class]: Property 'sqlSessionFactory' or 'sqlSessionTemplate' are required
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:788) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.inject(AutowiredAnnotationBeanPostProcessor.java:768) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.annotation.InjectionMetadata.inject(InjectionMetadata.java:146) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor.postProcessProperties(AutowiredAnnotationBeanPostProcessor.java:509) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.populateBean(AbstractAutowireCapableBeanFactory.java:1451) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:606) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:529) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:339) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:371) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:337) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:202) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.instantiateSingleton(DefaultListableBeanFactory.java:1221) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingleton(DefaultListableBeanFactory.java:1187) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:1122) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:987) ~[spring-context-6.2.6.jar:6.2.6]
	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:627) ~[spring-context-6.2.6.jar:6.2.6]
	at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:146) ~[spring-boot-3.4.5.jar:3.4.5]
	at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:753) ~[spring-boot-3.4.5.jar:3.4.5]
	at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:439) ~[spring-boot-3.4.5.jar:3.4.5]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:318) ~[spring-boot-3.4.5.jar:3.4.5]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1362) ~[spring-boot-3.4.5.jar:3.4.5]
	at org.springframework.boot.SpringApplication.run(SpringApplication.java:1351) ~[spring-boot-3.4.5.jar:3.4.5]
	at com.Demo.DemoServerApplicationKt.main(DemoServerApplication.kt:15) ~[classes/:na]
Caused by: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'inputLogMapper' defined in file [C:\WorkSpace\Demo-server\target\classes\com\Demo\mapper\InputLogMapper.class]: Property 'sqlSessionFactory' or 'sqlSessionTemplate' are required
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1818) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:607) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:529) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:339) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:371) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:337) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:202) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.config.DependencyDescriptor.resolveCandidate(DependencyDescriptor.java:254) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.doResolveDependency(DefaultListableBeanFactory.java:1739) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.DefaultListableBeanFactory.resolveDependency(DefaultListableBeanFactory.java:1627) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor$AutowiredFieldElement.resolveFieldValue(AutowiredAnnotationBeanPostProcessor.java:785) ~[spring-beans-6.2.6.jar:6.2.6]
	... 22 common frames omitted
Caused by: java.lang.IllegalArgumentException: Property 'sqlSessionFactory' or 'sqlSessionTemplate' are required
	at org.springframework.util.Assert.notNull(Assert.java:181) ~[spring-core-6.2.6.jar:6.2.6]
	at org.mybatis.spring.support.SqlSessionDaoSupport.checkDaoConfig(SqlSessionDaoSupport.java:122) ~[mybatis-spring-3.0.4.jar:3.0.4]
	at org.mybatis.spring.mapper.MapperFactoryBean.checkDaoConfig(MapperFactoryBean.java:69) ~[mybatis-spring-3.0.4.jar:3.0.4]
	at org.springframework.dao.support.DaoSupport.afterPropertiesSet(DaoSupport.java:44) ~[spring-tx-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.invokeInitMethods(AbstractAutowireCapableBeanFactory.java:1865) ~[spring-beans-6.2.6.jar:6.2.6]
	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.initializeBean(AbstractAutowireCapableBeanFactory.java:1814) ~[spring-beans-6.2.6.jar:6.2.6]
	... 32 common frames omitted
```

### pom
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>3.4.5</version>
		<relativePath/> <!-- lookup parent from repository -->
	</parent>
	<groupId>com.behavior.server</groupId>
	<artifactId>behavior-server</artifactId>
	<version>1.0.0</version>
	<name>Demo-server</name>
	<description>Foo</description>
	<properties>
		<java.version>17</java.version>
		<kotlin.version>1.9.25</kotlin.version>
		<spring-cloud.version>2024.0.1</spring-cloud.version>
	</properties>
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-actuator</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>spring-cloud-stream</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>spring-cloud-starter-stream-kafka</artifactId>
		</dependency>
		<dependency>
			<groupId>org.jetbrains.kotlin</groupId>
			<artifactId>kotlin-reflect</artifactId>
		</dependency>
		<dependency>
			<groupId>org.jetbrains.kotlin</groupId>
			<artifactId>kotlin-stdlib</artifactId>
		</dependency>
		<dependency>
			<groupId>org.jetbrains.kotlinx</groupId>
			<artifactId>kotlinx-serialization-json</artifactId>
		</dependency>

		<dependency>
			<groupId>org.codehaus.groovy</groupId>
			<artifactId>groovy</artifactId>
			<version>3.0.24</version>
		</dependency>
		<dependency>
			<groupId>cn.hutool</groupId>
			<artifactId>hutool-all</artifactId>
			<version>5.8.37</version>
		</dependency>

		<dependency>
			<groupId>com.baomidou</groupId>
			<artifactId>mybatis-plus-spring-boot3-starter</artifactId>
			<version>3.5.9</version>
		</dependency>

		<dependency>
			<groupId>com.mysql</groupId>
			<artifactId>mysql-connector-j</artifactId>
			<scope>runtime</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-test</artifactId>
			<scope>test</scope>
		</dependency>
		<dependency>
			<groupId>org.jetbrains.kotlin</groupId>
			<artifactId>kotlin-test-junit5</artifactId>
			<scope>test</scope>
		</dependency>
		<dependency>
			<groupId>org.springframework.kafka</groupId>
			<artifactId>spring-kafka-test</artifactId>
			<scope>test</scope>
		</dependency>
	</dependencies>

	<dependencyManagement>
		<dependencies>
			<dependency>
				<groupId>org.springframework.cloud</groupId>
				<artifactId>spring-cloud-dependencies</artifactId>
				<version>${spring-cloud.version}</version>
				<type>pom</type>
				<scope>import</scope>
			</dependency>
		</dependencies>
	</dependencyManagement>

	<build>
		<sourceDirectory>${project.basedir}/src/main/kotlin</sourceDirectory>
		<testSourceDirectory>${project.basedir}/src/test/kotlin</testSourceDirectory>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
			<plugin>
				<groupId>org.jetbrains.kotlin</groupId>
				<artifactId>kotlin-maven-plugin</artifactId>
				<version>${kotlin.version}</version>
				<configuration>
					<compilerPlugins>
						<plugin>kotlinx-serialization</plugin>
						<plugin>spring</plugin>
						<plugin>all-open</plugin>
					</compilerPlugins>
				</configuration>
				<dependencies>
					<dependency>
						<groupId>org.jetbrains.kotlin</groupId>
						<artifactId>kotlin-maven-allopen</artifactId>
						<version>${kotlin.version}</version>
					</dependency>
					<dependency>
						<groupId>org.jetbrains.kotlin</groupId>
						<artifactId>kotlin-maven-serialization</artifactId>
						<version>${kotlin.version}</version>
					</dependency>
				</dependencies>
			</plugin>
		</plugins>
	</build>
</project>

```

### 解决方案：
大概和springboot2.x不同，datasource的字段不再是约定俗成了
![Image](https://github.com/user-attachments/assets/905a937c-4b10-4dfe-9ed5-a4a56f33718a)

看到了有HikariCP，那就按HikariCP的方式配置，因为没多数据源需求，就不配置DruidDataSource了
```
spring:
  datasource:
    driverClassName: com.mysql.cj.jdbc.Driver
    jdbcUrl: jdbc:mysql://someMachine:3306/behavior?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: foo
```

另外，注意mybatis plus和springboot对应比较严格。比如springBoot 3.4.5 + mybatis-plus 3.5.4-3.5.9。 再往上就依赖冲突了