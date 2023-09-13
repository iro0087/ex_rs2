<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="item">
        
Title:
<xsl:value-of select="title"/> 


PubDate:
<xsl:value-of select="pubDate"/> 


Link:
<xsl:value-of select="guid"/> 


Content

<xsl:value-of select="description"/> 

**********************************************
</xsl:template>
</xsl:stylesheet>
