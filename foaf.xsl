<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    version="1.0">

    <!-- Modèle pour la racine du document -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Profil FOAF</title>
            </head>
            <body>
                <h1>Profil de <xsl:value-of select="//foaf:name" /></h1>
                <p>
                    <strong>Titre :</strong>
                    <xsl:value-of select="//foaf:title" />
                </p>
                <p>
                    <strong>Prénom :</strong>
                    <xsl:value-of select="//foaf:givenname" />
                </p>
                <p>
                    <strong>Nom de famille :</strong>
                    <xsl:value-of select="//foaf:family_name" />
                </p>
                <p>
                    <strong>Email :</strong>
                    <a href="{//foaf:mbox/@rdf:resource}">
                        <xsl:value-of select="//foaf:mbox/@rdf:resource" />
                    </a>
                </p>
                <p>
                    <strong>Page d'accueil :</strong>
                    <a href="{//foaf:homepage/@rdf:resource}">
                        <xsl:value-of select="//foaf:homepage/@rdf:resource" />
                    </a>
                </p>
                <p>
                    <strong>Université :</strong>
                    <a href="{//foaf:schoolHomepage/@rdf:resource}">
                        <xsl:value-of select="//foaf:schoolHomepage/@rdf:resource" />
                    </a>
                </p>

                <h2>Centres d'intérêt</h2>
                <ul>
                    <xsl:for-each select="//foaf:interest/rdf:Description/rdfs:label">
                        <li>
                            <xsl:value-of select="." />
                        </li>
                    </xsl:for-each>
                </ul>

                <h2>Comptes en ligne</h2>
                <ul>
                    <xsl:for-each select="//foaf:OnlineAccount">
                        <li>
                            <a href="{foaf:accountServiceHomepage/@rdf:resource}">
                                <xsl:value-of select="foaf:accountName" />
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>

                <h2>Présentation</h2>
                <p>
                    <xsl:value-of select="//foaf:plan" />
                </p>

                <!-- Ajout de la section pour les connaissances (foaf:knows) -->
                <h2>Connaissances</h2>
                <ul>
                    <xsl:for-each select="//foaf:knows/foaf:Person">
                        <li>
                            <xsl:value-of select="foaf:name" /> - <a
                                href="{foaf:homepage/@rdf:resource}">
                                <xsl:value-of select="foaf:homepage/@rdf:resource" />
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>