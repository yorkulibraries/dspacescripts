<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="#all">
 <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

<xsl:variable name="meta-file" select="document('RepeatingElements.xml')" />

<xsl:template match="Metadata">
  <dataroot>
    <!-- process all the original fields/tags/leader etc... -->
    <xsl:apply-templates />
    
 </dataroot>
</xsl:template>  
  
<xsl:template match="Metadata">
	<Metadata>
		<xsl:apply-templates />
		<xsl:variable name="id" select="identifier" />
		<xsl:for-each select="$meta-file//dataroot/RepeatingElements">
			<xsl:variable name="id2" select="identifier_other" />	
			<xsl:variable name = "element_name" select="element" />
			<xsl:if test="$id2=$id">
				<xsl:element name="{$element_name}">
					<xsl:value-of select="element_text"/>
				</xsl:element>
			</xsl:if>
		</xsl:for-each>
	</Metadata>
</xsl:template>

<!-- default template: copy the node/attribute as-is -->
<xsl:template match="@*|node()">
  <xsl:copy><xsl:apply-templates select="@*|node()"/></xsl:copy>
</xsl:template>

</xsl:stylesheet>