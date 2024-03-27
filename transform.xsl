<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes"/>

<xsl:template match="/microblog">
  <html>
    <head>
      <title>Microblog Post</title>
      <style type="text/css">
        body { font-family: Merriweather,Loboto, sans-serif; }
        .post { margin-bottom: 14px; padding-bottom: 10px; border-bottom: 1px solid #ccc; }
        .post h2 { margin: 0; }
        .post img { max-width: 500px; height: auto; }
        .post .author { font-weight: bold; }
        .post .timestamp { color: #888; }
        .comments { margin-top: 10px; }
        .comments div { margin-top: 5px; }
        .comments .author { font-weight: semi-bold; }
      </style>
    </head>
    <body>
      <xsl:apply-templates select="post"/>
    </body>
  </html>
</xsl:template>

<xsl:template match="post">
  <div class="post">
    <h2>Microblog Post by <xsl:value-of select="author/username"/></h2>
    <p class="author"><xsl:value-of select="author/name"/></p>
    <div>
      <xsl:value-of select="content/text"/>
    </div>
    <div>
      <img>
        <xsl:attribute name="src"><xsl:value-of select="content/image/url"/></xsl:attribute>
        <xsl:attribute name="alt"><xsl:value-of select="content/image/caption"/></xsl:attribute>
      </img>
    </div>
    <div>
      <p><xsl:value-of select="content/image/caption"/></p>
    </div>
    <div class="timestamp">
      Posted on <xsl:value-of select="timestamp"/>
    </div>
    <div>
      <p><xsl:value-of select="likes"/> likes</p>
    </div>
    <div class="tags">
      <p>Tags: 
        <xsl:for-each select="content/tags/tag">
          <xsl:value-of select="."/>
          <xsl:text> </xsl:text>
        </xsl:for-each>
      </p>
    </div>
    <div class="comments">
      <p>Comments:</p>
      <xsl:for-each select="comments/comment">
        <div class="comment">
          <span class="author"><xsl:value-of select="author"/></span>: <xsl:value-of select="text"/>
        </div>
      </xsl:for-each>
    </div>
  </div>
</xsl:template>

</xsl:stylesheet>
