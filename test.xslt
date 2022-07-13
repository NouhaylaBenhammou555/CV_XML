<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="//cv/me/@name"/></title>
				<link rel="stylesheet" type="text/css" href="cv.css" />
				<link rel="stylesheet" type="text/css" href="cvedit.css" />
				
			</head>
			<body>
				<div id="container">
					<div id="statement">
							<p><xsl:copy-of select="//cv/me"/></p>
						</div>
					<div id="nouha">
						<h1><xsl:value-of select="//cv/me/@name"/></h1>
						<h1><xsl:value-of select="//cv/me/@description"/></h1>
						<ul id="contactdetails">
							<li>Address: <xsl:value-of select="//cv/me/@address"/></li>
							<li>Telephone: <xsl:value-of select="//cv/me/@telephone"/></li>
							<li>Email: <xsl:value-of select="//cv/me/@email"/></li>
							<li>LinkedIn: <xsl:value-of select="//cv/me/@LinkedIn"/></li>
						</ul>
					</div>
					<div id="content">
						
						<div id="sxscontainer">
							<div id="education">
								<h2>Education</h2>
								<xsl:call-template name="showEducation"/>
							</div>
							<div id="Compétences">
									<h2>Compétences</h2>
									<xsl:call-template name="showCompétences"/>
								</div>
							<div id="employment">
								<h2>Projets professionels et académiques</h2>
								<xsl:call-template name="showEmployment"/>
							</div>
						</div>
						
						
						
					</div>
				</div>
				
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="useThisElseThat">
		<xsl:param name="this"/>
		<xsl:param name="that"/>
		<xsl:choose>
			<xsl:when test="$this!=''">
				<xsl:value-of select="$this"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$that"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="showDateRange">
		<xsl:param name="fromDate"/>
		<xsl:param name="toDate"/>
		<xsl:param name="noToDate"/>
		<xsl:value-of select="$fromDate"/> 
		<xsl:call-template name="useThisElseThat">
			<xsl:with-param name="this" select="$toDate"/>
			<xsl:with-param name="that" select="$noToDate"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="showQual">
		<xsl:param name="currentQual"/>
		<div class="qual">
			<p class="qualcontent"><xsl:copy-of select="."/></p>
			<p class="qualestablishment"><xsl:value-of select="@establishment"/>
				<xsl:call-template name="showDateRange">
					<xsl:with-param name="fromDate" select="@from"/>
					<xsl:with-param name="toDate" select="@to"/>
					
				</xsl:call-template>
			</p>
		</div>
	</xsl:template>
	
	<xsl:template name="showEducation">
		<h3 class="qualtype"><xsl:value-of select="//cv/education/qualification[1]/@type"/></h3>
		<xsl:for-each select="//cv/education/qualification">
			<xsl:if test="@type != preceding-sibling::qualification[1]/@type">
				<h3 class="qualtype"><xsl:value-of select="@type"/></h3>
			</xsl:if>
			<xsl:call-template name="showQual">
				<xsl:with-param name="currentQual" select="."/>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>


    <xsl:template name="showCompétences">
			<xsl:for-each select="//cv//Compétences/experience">
				
				
				<ul class="jobachievementlist">
					<xsl:for-each select="achievement">
						<li class="jobachievementitem"><xsl:value-of select="."/></li>
					</xsl:for-each>
				</ul>
			</xsl:for-each>
		</xsl:template>
	


	<xsl:template name="showEmployment">
		<xsl:for-each select="//cv//employment/experience">
			<h3 class="jobtitle">
				<strong><xsl:value-of select="@job_title"/></strong>, <xsl:value-of select="@establishment"/>
				
			</h3>
			<p class="jobdescription"><xsl:value-of select="./description[1]"/></p>
			<ul class="jobachievementlist">
				<xsl:for-each select="achievement">
					<li class="jobachievementitem"><xsl:value-of select="."/></li>
				</xsl:for-each>
			</ul>
		</xsl:for-each>
	</xsl:template>
	
	

	
</xsl:stylesheet>