<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="page">

        <!--
    Astral by HTML5 UP
    html5up.net | @ajlkn
    Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
        <html>
            <head>
                <title>Astral by HTML5 UP</title>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
                <link rel="stylesheet" href="html5up-astral/assets/css/main.css"/>
                <noscript>
                    <link rel="stylesheet" href="html5up-astral/assets/css/noscript.css"/>
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
                        <a href="#contest" class="icon fa-trophy">
                            <span>Contest</span>
                        </a>
                        <a href="#vote" class="icon fa-list">
                            <span>Vote</span>
                        </a>
                    </nav>

                    <!-- Main -->
                    <div id="main">

                        <!-- WG -->
                        <article id="wg" class="panel">
                            <header>
                                <h1>Wohngemeinschaften</h1>
                                <p class="subtitle">Neue WG erfassen</p>
                            </header>


                            <form method="POST" action="wg/create.php">
                                <div>
                                    <div class="col-12">
                                        <label class="mt-20">Name:</label>
                                        <input type="text" name="name" required="true"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="mt-20">Personen:</label>
                                        <input type="text" name="personen" required="true"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="mt-20">Kanton:</label>
                                        <input type="text" name="canton" required="true"/>
                                    </div>
                                    <div class="col-12">
                                        <br />
                                        <input type="submit" value="Speichern"/>
                                    </div>
                                </div>
                            </form>

                            <header class="mt-100">
                                <h1>Wohngemeinschaften</h1>
                                <p class="subtitle">Bereits erfasste WGs:</p>
                            </header>


                            <xsl:apply-templates select="document(@db)/db/wgs/wg"/>

                        </article>

                        <!-- Contest -->
                        <article id="contest" class="panel">
                            <header>
                                <h1>Wettbewerbe</h1>
                                <p class="subtitle">Neuer Wettbewerb erfassen</p>
                            </header>


                            <form method="POST" action="contest/create.php">

                                <div>
                                    <div class="col-12">
                                        <label class="mt-20">Name:</label>
                                        <input type="text" name="name" required="true"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="mt-20">Beschreibung:</label>
                                        <textarea rows="5" name="description" required="true"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="mt-20">Firma:</label>
                                        <input type="text" name="company" required="true"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="mt-20">Startdatum:</label>
                                        <input type="date" name="startDate" required="true"/>
                                    </div>
                                    <div class="col-12">
                                        <label class="mt-20">Enddatum:</label>
                                        <input type="date" name="endDate" required="true"/>
                                    </div>
                                    <div class="col-12">
                                        <br />
                                        <input type="submit" value="Speichern"/>
                                    </div>
                                </div>
                            </form>

                            <header class="mt-100">
                                <h1>Wettbewerbe</h1>
                                <p class="subtitle">Bereits erfasste Wettbewerbe:</p>
                            </header>

                            <xsl:apply-templates select="document(@db)/db/contests/contest"/>
                        </article>

                        <!-- Vote -->
                        <article id="vote" class="panel">
                            <header>
                                <h2>Stimmresultate</h2>
                            </header>

                            Please select contest

                            <xsl:apply-templates select="document(@db)/db/contests/contest"/>
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
                <script src="html5up-astral/assets/js/jquery.min.js"/>
                <script src="html5up-astral/assets/js/browser.min.js"/>
                <script src="html5up-astral/assets/js/breakpoints.min.js"/>
                <script src="html5up-astral/assets/js/util.js"/>
                <script src="html5up-astral/assets/js/main.js"/>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="wg">

        <xsl:variable name="detailLink" select="concat('wg/?wg=', @id)"/>
        <li class="wg">
            <a href="{$detailLink}#wg" style="color:#363636;text-decoration:none">
                <h2><xsl:value-of select="name"/></h2>
                <p class="mt-20">Kanton: <xsl:value-of select="canton"/></p>
                <p>Anzahl Personen: <xsl:value-of select="personen"/></p>
            </a>
        </li>

    </xsl:template>


    <xsl:template match="contest">
        <xsl:variable name="rankingLink" select="concat('ranking/?contest=', @id)"/>
        <div class="contest">
            <h2>
                <xsl:value-of select="name"/>
            </h2>
            <p>
                <xsl:value-of select="concat(startDate, ' - ', endDate)"/>
            </p>
            <p>
                <xsl:value-of select="description"/>
            </p>
            <a href="{$rankingLink}#vote">Go to ranking</a>
            <hr/>
        </div>
    </xsl:template>

</xsl:stylesheet>
