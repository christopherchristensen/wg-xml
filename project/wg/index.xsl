<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="wgId" select="//wg/@id"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Astral by HTML5 UP</title>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
                <link rel="stylesheet" href="../html5up-astral/assets/css/main.css"/>
                <noscript>
                    <link rel="stylesheet" href="../html5up-astral/assets/css/noscript.css"/>
                </noscript>
            </head>
            <body class="is-preload">

                <!-- Wrapper-->
                <div id="wrapper">

                    <!-- Nav -->
                    <nav id="nav">
                        <a href="#wg" class="icon fa-home">
                            <span>WG</span>
                        </a>
                        <a href="../index.xml#contest" class="icon fa-trophy">
                            <span>Contest</span>
                        </a>
                        <a href="../index.xml#vote" class="icon fa-list">
                            <span>Stimmresultate</span>
                        </a>
                    </nav>

                    <!-- Main -->
                    <div id="main">

                        <!-- WG -->
                        <article id="wg" class="panel">

                            <header>
                                <xsl:apply-templates select="//wg"/>
                            </header>

                            <xsl:apply-templates select="//contest"/>

                        </article>

                    </div>

                    <!-- Footer -->
                    <div id="footer">
                        <ul class="copyright">
                            <li>Copyright: Crowdsourced Marketing.</li>
                            <li>Design:
                                <a href="http://html5up.net">HTML5 UP</a>
                            </li>
                        </ul>
                    </div>

                </div>

                <!-- Scripts -->
                <script src="../html5up-astral/assets/js/jquery.min.js"/>
                <script src="../html5up-astral/assets/js/browser.min.js"/>
                <script src="../html5up-astral/assets/js/breakpoints.min.js"/>
                <script src="../html5up-astral/assets/js/util.js"/>
                <script src="../html5up-astral/assets/js/main.js"/>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="wg">
        <h1>
            <xsl:value-of select="name"/>
        </h1>
        <p>
            <xsl:value-of select="personen" />
            Personen | Kanton
            <xsl:value-of select="canton" />
        </p>
    </xsl:template>

    <xsl:template match="contest">
        <xsl:variable name="contestId" select="@id"/>

        <div>
            <h4><xsl:value-of select="name"/></h4>
            <p>Laufzeit: <xsl:value-of select="concat(startDate, ' - ', endDate)"/></p>
            <p>Beschreib: <xsl:value-of select="description"/></p>

            <xsl:call-template name="voteQrCode">
                <xsl:with-param name="wg" select="$wgId" />
                <xsl:with-param name="contest" select="$contestId" />
            </xsl:call-template>

            <form method="GET" action="../vote/">
                <input type="hidden" name="wg" value="{$wgId}" />
                <input type="hidden" name="contest" value="{$contestId}" />
                <button class="btn-vote mt-20" type="submit">Für diese WG stimmen</button>
            </form>
            <hr/>
        </div>
    </xsl:template>

    <xsl:template name="voteQrCode">
        <xsl:param name="contest"/>
        <xsl:param name="wg"/>

        <xsl:variable name="qrSrc" select="concat('https://api.qrserver.com/v1/create-qr-code/?size=200x200&amp;data=http%3A%2F%2Fdemo.org%2Fshow%3Fcontest%3D', $contest, '%26wg%3D', $wg)" />

        <img class="mt-20" src="{$qrSrc}" />
    </xsl:template>
</xsl:stylesheet>
