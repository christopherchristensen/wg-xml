<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="page">
        <html>
            <body>
                <a href="/">Home</a>
                <xsl:apply-templates select="document(@db)/db/contests/contest"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="contest">
        <xsl:variable name="rankingLink" select="concat('/ranking/?contest=', @id)"/>
        <div>
            <h2><xsl:value-of select="name" /></h2>
            <p><xsl:value-of select="concat(startDate, ' - ', endDate)" /></p>
            <p><xsl:value-of select="description" /></p>
            <a href="{$rankingLink}">Go to ranking</a>
            <hr />
        </div>
	</xsl:template>
</xsl:stylesheet>
