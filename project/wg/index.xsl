<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="page">
        <html>
            <body>
                <ul>
                    <xsl:apply-templates select="document(@db)/db/wgs/wg"/>
                </ul>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="wg">
        <li>
            <xsl:value-of select="concat('[', @id, ']: ', name, '-', personen, '-', canton)"/>
        </li>
	</xsl:template>
</xsl:stylesheet>
