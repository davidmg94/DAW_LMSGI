<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
  <xsl:template match="artistas">
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title>Tabla de artistas</title>
      </head>
      <body>
        <table>
          <tr>
            <th>Código</th>
            <th>Nombre</th>
            <th>Año de nacimiento</th>
            <th>Movimiento</th>
            <th>Género</th>
            <th>País</th>
            <th>Página web</th>
          </tr>
          <xsl:for-each select="artista[pais='España']">
            <xsl:sort select="movimiento"/>
            <tr>
              <td><xsl:value-of select="@cod"/></td>
              <td><xsl:value-of select="nombreCompleto"/></td>
              <td><xsl:value-of select="nacimiento"/></td>
              <td><xsl:value-of select="movimiento"/></td>
              <td><xsl:choose>
                    <xsl:when test="genero">
                      <xsl:value-of select="genero"/>
                    </xsl:when>
                    <xsl:otherwise>Varios</xsl:otherwise>
                  </xsl:choose>
              </td>
              <td><xsl:value-of select="pais"/></td>
              <td><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="fichaCompleta"/></xsl:attribute>Saber más</a></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>