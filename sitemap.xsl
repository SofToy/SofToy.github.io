<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
    xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
    xmlns:html="http://www.w3.org/TR/REC-html40">
    <xsl:output version="1.0" method="html" encoding="UTF-8" />
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Sitemap XML</title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <style type="text/css">
                    :root { --bg-color: #f8f8f8; --bg-color-secondary: #fff; --text-color: #2c3e50; --border-color: #eaecef; --brand-color: #3eaf7c; color-scheme: light dark; }
                    @media (prefers-color-scheme: dark) { :root { --bg-color: #0d1117; --bg-color-secondary: #161b22; --text-color: #ccc; --border-color: #30363d; } }
                    
                    html, body { margin: 0; padding: 0; background: var(--bg-color); font-size: 14px; }
                    body { min-height: 100vh; color: var(--text-color); text-align: center;max-width: 960px; margin: 0 auto; }

                    h1 { margin-top: 1rem; font-size: 2rem; }
                    a { color: var(--text-color); font-weight: 500; overflow-wrap: break-word; }
                    table { width: 100%; border-radius: 8px; border-collapse: collapse; text-align: center; overflow: hidden; }
                    th, td { padding: 0.6em 1em; }
                    th { min-width: 56px; background-color: var(--brand-color); color: var(--bg-color); font-weight: bold; font-size: 16px; }
                    th:first-child, td:first-child { text-align: start; }
                    tr:nth-child(odd) { background: var(--bg-color-secondary); }
                    tr:hover { background-color: #e8e8e8; }
                    @media (prefers-color-scheme: dark) { tr:hover { background-color: #333; } }
                    @media (max-width: 719px) { th, td { font-size: 14px; } td { font-size: 12px; } }
                    @media (max-width: 419px) { h1 { font-size: 1.5rem; } table { border-radius: 0; } }
                </style>
            </head>
		    <body>
                <div class="wrapper">
                    <h1 class="header">Sitemap XML</h1>

                    <div class="info">This sitemap contains <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs.</div>
                    <table class="list" border="none" cellspacing="0" cellpadding="3">
                        <thead>
                            <tr>
                                <th width="70%">URL</th>
                                <th width="10%">Images</th>
                                <th width="20%">Last Modified</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="sitemap:urlset/sitemap:url">
                            <tr>
                                <td>
                                    <xsl:variable name="url"><xsl:value-of select="sitemap:loc"/></xsl:variable>
                                    <a href="{$url}"><xsl:value-of select="sitemap:loc"/></a>
                                </td>
                                <td style="text-align: center;">
                                    <xsl:value-of select="count(image:image)"/>
                                </td>
                                <td style="text-align: center; font-family: monospace;">
                                    <xsl:value-of select="concat( substring( sitemap:lastmod, 0, 11), concat(' ', substring( sitemap:lastmod, 12, 14 ) ) )"/>
                                </td>
                            </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </body>
		</html>
    </xsl:template>
</xsl:stylesheet>