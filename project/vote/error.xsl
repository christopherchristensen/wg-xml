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
            <body>

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
                            <p>Upps, etwas ist schief gelaufen</p>
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


</xsl:stylesheet>
