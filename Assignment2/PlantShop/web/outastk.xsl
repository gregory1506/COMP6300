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
                <title>List of Products</title>
                <link href="css/bootstrap.min.css" rel="stylesheet"/>
                <link href="css/pricing.css" rel="stylesheet"/>                  
            </head>
            <body>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Code#</th>
                            <th scope="col">Description</th>
                            <th scope="col">Quantity in stock</th>
                            <th scope="col">Reorder Level</th>
                            <th scope="col">Reorder Amt</th>
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
        <xsl:if test="quantity &lt;= reorder-level">
            <tr>
            <!--<th scope="row">0</th>-->
            <td><xsl:value-of select="./code"/></td>
            <td><xsl:value-of select="./description"/></td>
            <td><xsl:value-of select="./quantity"/></td>
            <td><xsl:value-of select="./reorder-level"/></td>
            <td><xsl:value-of select="./reorder-quantity"/></td>
        </tr>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>