<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="page">
        <html>
            <body>
                <a href="/">Home</a>
                <form method="POST" action="create.php">
                    <div>
                        <label>Name:</label>
                        <input type="text" name="name" required="true" />
                    </div>
                    <div>
                        <label>Personen:</label>
                        <input type="text" name="personen" required="true" />
                    </div>
                    <div>
                        <label>Kanton:</label>
                        <input type="text" name="canton" required="true" />
                    </div>
                    <div>
                        <button type="submit">Speichern</button>
                    </div>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
