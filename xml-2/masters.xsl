<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="department/@name"/></title>
				<style>
					h2 {
						font: bolder 16pt 'verdana', arial, sans-serif;
					}
					table {
						font: 10pt 'verdana', arial, sans-serif;
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
				<xsl:for-each select="department/course">
					<h2><xsl:value-of select="@name"/> - <xsl:value-of select="@number"/></h2>
					<table border="1">
						<tr>
							<th>Name</th>
							<th>Number</th>
							<th>Type</th>
							<th>Semester</th>
						</tr>
						<xsl:for-each select="compulsoryMods">
							<xsl:for-each select="module">
								<tr>
									<td><xsl:value-of select="name"/></td>
									<td><xsl:value-of select="number"/></td>
									<td>Compulsory</td>
									<td><xsl:value-of select="semester"/></td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="altCompulsoryMods">
							<xsl:for-each select="module">
								<tr>
									<td><xsl:value-of select="name"/></td>
									<td><xsl:value-of select="number"/></td>
									<td>Alternative Compulsory</td>
									<td><xsl:value-of select="semester"/></td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
						<xsl:for-each select="optionalMods">
							<xsl:for-each select="module">
								<tr>
									<td><xsl:value-of select="name"/></td>
									<td><xsl:value-of select="number"/></td>
									<td>Optional</td>
									<td><xsl:value-of select="semester"/></td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>
					</table>
					<br></br>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>