<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes"/>
  <xsl:template match="dublin_core" >
    <dublin_core>
    <xsl:if test="identifier" >
    <dcvalue element="identifier" qualifier="none">
    <xsl:value-of select="identifier" />
    </dcvalue>
    </xsl:if>
	<xsl:if test="title" >
      <dcvalue element="title" qualifier="none">
         <xsl:value-of select="title" />
      </dcvalue>
      </xsl:if>
      <xsl:if test="contributor_author != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_01 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_01" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_02 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_02" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_03 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_03" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_04 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_04" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_05 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_05" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_06 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_06" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_07 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_07" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_08 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_08" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_09 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_09" />
      </dcvalue>
      </xsl:if>
	  <xsl:if test="contributor_author_10 != ''" > 
       <dcvalue element="contributor" qualifier="author">
         <xsl:value-of select="contributor_author_10" />
      </dcvalue>
      </xsl:if>
        <xsl:if test="subject != ''" >
        <dcvalue element="subject" qualifier="none">
        <xsl:value-of select="." />
        </dcvalue>
        </xsl:if>
        <xsl:if test="subject_01 != ''" >
        <dcvalue element="subject" qualifier="none">
        <xsl:value-of select="subject_01" />
        </dcvalue>
        </xsl:if>
        <xsl:if test="subject_02 != ''" >
        <dcvalue element="subject" qualifier="none">
        <xsl:value-of select="subject_02" />
        </dcvalue>
        </xsl:if>
        <xsl:if test="subject_03 != ''" >
        <dcvalue element="subject" qualifier="none">
        <xsl:value-of select="subject_03" />
        </dcvalue>
        </xsl:if>
        <xsl:if test="date_issued" >
        <dcvalue element="date" qualifier="issued">
         <xsl:value-of select="date_issued" />
      </dcvalue>
      </xsl:if>
        <xsl:if test="identifier_citation" >
        <dcvalue element="identifier" qualifier="citation">
        <xsl:value-of select="identifier_citation" />
        </dcvalue>
        </xsl:if>
        <xsl:if test="relation_uri" >
        <dcvalue element="relation" qualifier="uri">
        <xsl:value-of select="relation_uri" />
        </dcvalue>
        </xsl:if>
        <xsl:if test="description" >
      <dcvalue element="description" qualifier="none">
         <xsl:value-of select="description" />
      </dcvalue>
      </xsl:if>
        <xsl:if test="description_abstract" >
      <dcvalue element="description" qualifier="abstract">
         <xsl:value-of select="description_abstract" />
      </dcvalue>
      </xsl:if>
      <xsl:if test="description_sponsorship" >
      <dcvalue element="description" qualifier="sponsorship">
         <xsl:value-of select="description_sponsorship" />
      </dcvalue>
      </xsl:if>
        <xsl:if test="type" >
        <dcvalue element="type" qualifier="none">
        <xsl:value-of select="type" />
        </dcvalue>
        </xsl:if>
        <xsl:if test="rights_uri" >
        <dcvalue element="rights" qualifier="uri">
        <xsl:value-of select="rights_uri" />
        </dcvalue>
        </xsl:if>
        <xsl:if test="rights" >
        <dcvalue element="rights" qualifier="none">
        <xsl:value-of select="rights" />
        </dcvalue>
        </xsl:if>
      <xsl:if test="relation" >
         <dcvalue element="relation" qualifier="none">
         <xsl:value-of select="relation" />
      </dcvalue>
      </xsl:if>
        </dublin_core>
  </xsl:template>
</xsl:stylesheet>
