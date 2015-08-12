<?xml version="1.0"?>
 <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                 version="1.0"
                 xmlns:redirect="http://xml.apache.org/xalan/redirect"
                 extension-element-prefixes="redirect">

<xsl:template match="dublin_core" >
     <xsl:variable name="outfile" select="concat('record.', translate(identifier,' ','_'),'/Metadata.xml')"/>
     <redirect:write select="$outfile">
        <xsl:copy-of select="."/>
        </redirect:write>
  </xsl:template>
</xsl:stylesheet>
