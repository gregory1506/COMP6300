<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : productdetails.xsl
    Created on : March 10, 2018, 10:15 PM
    Author     : olliv
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:param name="code"/>
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
                <meta name="description" content=""/>
                <meta name="author" content=""/>
                <title>Product Details</title>
                <link href="css/bootstrap.min.css" rel="stylesheet"/>
                <link href="css/pricing.css" rel="stylesheet"/>                  
            </head>
            <body>
                <h1>Product Details</h1>
                <xsl:apply-templates select="/inventory/product[code=$code]">
                    <xsl:sort order="ascending" select="./code"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="/inventory/product[code=$code]">
        <xsl:variable name="category">
            <xsl:value-of select="./category"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$category = 'herb'">
                <img src="images/dec_{$category}.jpg"></img>
            </xsl:when>
            <xsl:when test="$category = 'flowering'">
                <img src="images/dec_{$category}.jpg"></img>
            </xsl:when>
            <xsl:when test="$category = 'fruit'">
                <img src="images/dec_{$category}.jpg"></img>
            </xsl:when>
            <xsl:when test="$category = 'chemical'">
                <img src="images/dec_{$category}.jpg"></img>
            </xsl:when>
            <xsl:when test="$category = 'pots'">
                <img src="images/dec_{$category}.jpg"></img>
            </xsl:when>
            <xsl:when test="$category = 'tools'">
                <img src="images/dec_{$category}.jpg"></img>
            </xsl:when>
            <xsl:when test="$category = 'decor'">
                <img src="images/dec_{$category}.jpg"></img>
            </xsl:when>
            <xsl:otherwise>
                <h2>Not a valid option</h2>
            </xsl:otherwise>
        </xsl:choose>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Code#</th>
                    <th scope="col">Description</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Category</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <!--<th scope="row">0</th>-->
                    <td>
                        <xsl:value-of select="./code"/>
                    </td>
                    <td>
                        <xsl:value-of select="./description"/>
                    </td>
                    <td>
                        <xsl:value-of select="./price"/>
                    </td>
                    <td>
                        <xsl:value-of select="./quantity"/>
                    </td>
                    <td>
                        <xsl:value-of select="./category"/>
                    </td>
                </tr>
                <tr>
                    <xsl:for-each select="./images/image">
                        <xsl:variable name="imgname">
                            <xsl:value-of select="."/>
                        </xsl:variable>
                        <td>
                            <img width="500" height="500" src="images/{$imgname}"></img>
                        </td>
                    </xsl:for-each>
                </tr>            
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>
