<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="course/name"/></title>
				<style>
					h1 {
					}
					table {
						border-collapse: collapse;
					}
					th, td {
						text-align: left;
						padding: 8px;
					}
					tr:nth-child(even){background-color:#f2f2f2}
					th {
						background-color: #89bfee;
						color: white;
					}
				</style>
			</head>
			<body>
				<h2><xsl:value-of select="course/name"/> - <xsl:value-of select="course/number"/></h2>
				<h3>Semester 1:</h3>
				<table border="1">
					<tr>
						<th>Name</th>
						<th>Number</th>
						<th>compulsoryFor</th>
					</tr>
					<xsl:for-each select="course/module">
						<xsl:if test="semester = 1">
							<tr>
								<td><xsl:value-of select="name"/></td>
								<td><xsl:value-of select="number"/></td>
								<td><xsl:value-of select="compulsoryFor"/></td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</table>
				<h3>Semester 2:</h3>
				<table border="1">
					<tr>
						<th>Name</th>
						<th>Number</th>
						<th>compulsoryFor</th>
					</tr>
					<xsl:for-each select="course/module">
						<xsl:if test="semester = 2">
							<tr>
								<td><xsl:value-of select="name"/></td>
								<td><xsl:value-of select="number"/></td>
								<td><xsl:value-of select="compulsoryFor"/></td>
							</tr>
						</xsl:if>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>