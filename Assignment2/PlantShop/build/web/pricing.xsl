<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : pricing.xsl
    Created on : March 10, 2018, 8:33 PM
    Author     : olliv
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/inventory">
        <html lang="en">
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <meta name="description" content=""/>
                <meta name="author" content=""/>
                <title>List of Prices</title>
                <link href="css/bootstrap.min.css" rel="stylesheet"/>
                <link href="css/pricing.css" rel="stylesheet"/>                  
            </head>
            <body>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Code#</th>
                            <th scope="col">Description</th>
                            <th scope="col">Price/Discounted Price</th>
                            <th scope="col">Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="product">
                            <xsl:sort order="ascending" select="./code"/>
                        </xsl:apply-templates>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="product">
        <tr>
            <!--<th scope="row">0</th>-->
            <td>
                <xsl:value-of select="./code"/>
            </td>
            <td>
                <xsl:variable name="var" select="code"/>
                <a href="/PlantShop/ProductDetails?code={$var}">
                    <xsl:value-of select="description"/>
                </a>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="discount &gt; 0">
                        <span style="color:red">
                            <s><xsl:value-of select="./price"/></s>
                        </span>
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="./price * (1 - (discount * 0.01))"/>
                        <xsl:text>)</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="price"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:value-of select="./quantity"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
