(:1. Nombre, fecha de nacimiento y fecha fallecimiento de todos los artistas:)
for $x in doc("artistas.xml")/artistas/artista
return <artista>{$x/nombreCompleto, $x/nacimiento, $x/fallecimiento}</artista>
,
(:2. El nombre (sin etiquetas) de los artistas que nacieron después de 1500.:)
for $x in doc("artistas.xml")/artistas/artista
where number($x/nacimiento) > 1500
return data($x/nombreCompleto)
,
(:3. Nombre de los artistas para los que no hay año de fallecimiento.:)
for $x in doc("artistas.xml")/artistas/artista
where not($x/fallecimiento) 
return $x/nombreCompleto
,
(:4. Una lista HTML con el nombre de los artistas nacidos en España.:)
<ul>{
for $x in doc("artistas.xml")/artistas/artista
where ($x/pais) = "España" 
return <li>{data($x/nombreCompleto)}</li>
}</ul>
,
(:5. El número de artistas nacidos antes de 1600.:)
for $x in doc("artistas.xml")/artistas
let $y := $x/artista[number(nacimiento) < 1600]
return count($y)
,
(:6. Modelo de las impresoras de tipo “matricial”.:)
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/@tipo="matricial"
return $x/modelo
,
(:7. Marca y modelo de las impresoras con más de un tamaño.:)
for $x in doc("impresoras.xml")/impresoras/impresora
where count($x/tamaño)>1
return <impresora>{$x/marca,$x/modelo}</impresora>
,
(:8. Marca y modelo de las impresoras con tamaño A3 (pueden tener otros).:)
for $x in doc("impresoras.xml")/impresoras/impresora
where ($x/tamaño) = "A3"
return <impresora>{$x/marca,$x/modelo}</impresora>
,
(:9. Marca y modelo de las impresoras con tamaño A5 como único tamaño.:)
(:No obtenemos ningún resultado pues ninguna impresora tiene como tamaño único el A5:)
for $x in doc("impresoras.xml")/impresoras/impresora
where count($x/tamaño) = 1 and $x/tamaño = 'A5'
return <impresora>{$x/marca,$x/modelo}</impresora>
,
(:10. Modelo de las impresoras en red.:)
for $x in doc("impresoras.xml")/impresoras/impresora
where $x/enred
return $x/modelo