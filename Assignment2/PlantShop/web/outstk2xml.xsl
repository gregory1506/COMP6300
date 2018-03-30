<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : pricing.xsl
    Created on : March 10, 2018, 8:33 PM
    Author     : olliv
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <orders>
            <xsl:apply-templates select="/inventory/product"/>
        </orders> 
    </xsl:template>
    <xsl:template match="product">
        <xsl:if test="quantity &lt;= reorder-level">
            <order>
                <xsl:attribute name="reorder-quantity">
                    <xsl:value-of  select="reorder-quantity"/>
                </xsl:attribute>
                <code>
                    <xsl:value-of select="./code"/>
                </code>
                <supplier>
                    <xsl:value-of select="./suppliers/supplier"/>
                </supplier>
            </order>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>