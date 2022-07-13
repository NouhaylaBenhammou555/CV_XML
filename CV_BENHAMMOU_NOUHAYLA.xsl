<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
	<xsl:template match="cv">
		<html>
			<head>
				<title>Mon CV: <xsl:value-of select="nom"/> <xsl:value-of select="prenom"/> </title>
				
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
</xsl:template>

<xsl:template match="nom">
<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template match="prenom">
<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template match="CONTACT">
	<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template match="centre_d_interet">
	<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template match="donnees_formation">
	<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template match="experience">
	<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template match="projet">
	<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template match="competences">
	<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template match="activité">
	<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

<xsl:template match="langues">
	<p><i><xsl:value-of select="."/></i></p>
</xsl:template>

</xsl:stylesheet>