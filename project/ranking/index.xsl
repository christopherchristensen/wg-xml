<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="bigSum" select="sum(//vote)"/>

    <xsl:template match="contest">
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
                        <a href="../index.xml#wg" class="icon fa-home">
                            <span>WG</span>
                        </a>
                        <a href="../index.xml#contest" class="icon fa-trophy">
                            <span>Contest</span>
                        </a>
                        <a href="#vote" class="icon fa-list">
                            <span>Stimmresultate</span>
                        </a>
                    </nav>

                    <!-- Main -->
                    <div id="main">

                        <!-- Vote -->
                        <article id="vote" class="panel">
                            <header>
                                <h2>Stimmresultate</h2>
                                <p><xsl:value-of select="name" /></p>
                            </header>

                            <p>Laufzeit: <xsl:value-of select="concat(startDate, ' - ', endDate)" /></p>
                            <p><xsl:value-of select="description" /></p>

                            <table style="text-align: center;">
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
