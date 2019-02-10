<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="bigSum" select="sum(//vote)"/>

    <xsl:template match="contest">
        <html>
            <head>
                <title></title>
            </head>
            <body>
                <a href="/">Home</a>
                <h2><xsl:value-of select="name" /></h2>
                <p><xsl:value-of select="concat(startDate, ' - ', endDate)" /></p>
                <p><xsl:value-of select="description" /></p>

                <table>
                    <thead>
                        <tr>
                            <th>WG</th>
                            <th>Stimmen</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="//vote"/>
                    </tbody>
                </table>
            </body>
        </html>
	</xsl:template>

    <xsl:template match="vote">
        <tr>
            <th><xsl:value-of select="@wg" /></th>
            <td>
                <xsl:value-of select="concat(text(), ' / ', round(text() div $bigSum * 100), '%')" />
            </td>
            <td>
                <svg width="200" height="10" xmlns="http://www.w3.org/2000/svg">
                    <xsl:variable name="val" select="text()"/>
                    <rect x="0" y="0" height="10" width="200" style="fill:gray;"/>
                    <rect x="0" y="0" height="10" width="{$val div $bigSum * 200}" style="fill:green;"/>
                </svg>
            </td>
        </tr>
	</xsl:template>
</xsl:stylesheet>
