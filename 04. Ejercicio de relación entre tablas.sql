
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
select "Name" as "nombre_pista", "Title" as "nombre_álbum"
from "Track" as t
inner join "Album" as a
on t."AlbumId" = a."AlbumId" ;

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
select "Name" as "nombre_artista", "Title" as "título_álbum"
from "Artist" as a
inner join "Album" as al
on al."ArtistId" = a."ArtistId" 
order by "Name" ;

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
select "FirstName" as "nombre_cliente", "Total" as "total_factura"
from "Invoice" as i
inner join "Customer" as c
on i."CustomerId" = c."CustomerId" 
order by "Total" desc 
limit 5

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select 	concat(e."FirstName",' ', e."LastName") as "nombre_emplieado",
		concat(c."FirstName",' ',c."LastName") as "nombre_cliente"
from "Employee" as e
inner join "Customer" as c
on e."EmployeeId" = c."SupportRepId" 

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select "InvoiceId" as "id_fra", "Name" as "nombre_pista"
from "InvoiceLine" as il
inner join "Track" as t
on il."TrackId" =t."TrackId" 


-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
select concat(a."Name") as "nombre_album",
		concat(g."Name") as "nombre_genero"
from "Artist" as a
inner join "Album" as al 
on a."ArtistId" = al."ArtistId" 
inner join "Track" as t
on t."AlbumId" = al."AlbumId" 
inner join "Genre" as g
on g."GenreId" = t."GenreId" 

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
-- Uso let join para que también puedan salir posibles nulos 
select concat(mt."Name") as "nombre_media", concat(t."Name") as "nombre pista" 
from "Track" as t
left join "MediaType" as mt
on mt."MediaTypeId" =t."MediaTypeId" 


-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
select concat(t."Name") as "track_name", concat(g."Name") as "nombre_gen"
from "Track" as t
left join "Genre"  as g
on g."GenreId" =t."GenreId" 


-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
-- no hay clientes que no tengas facturas, si lo hubiese usando el left join saldría algún cliente con conteo 0

 select concat(C."FirstName",' ', C."LastName"), COUNT (i."Total")
 from	"Customer" as c
 left join "Invoice" as i
 on c."CustomerId" = i."CustomerId" 
group by concat(C."FirstName",' ', C."LastName")

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
select a."Title" as "album", art."Name" as "artista"
from "Album" as a
left join "Artist" as art 
ON art."ArtistId" =a."ArtistId" 

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
select g."Name" as "género", count(t."TrackId") 
from "Genre" as g 
left join "Track" as t
on g."GenreId" = t."GenreId" 
group by g."Name"
order by count(t."TrackId") desc;


--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
-- lo pasaré a minutos dividiendo los milisegundos entre 60000 para que se vea mejor y uso left joi por si hubiera algún album sin duración para incluirlo también

select a."Title" as "album", sum(t."Milliseconds")/60000
from "Album" as a
left join "Track" as t
on a."AlbumId" = t."AlbumId" 
group by a."Title" 
order by sum(t."Milliseconds" ) desc ;

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
select concat(c."FirstName",' ',c."LastName") as "cliente", sum(i."Total") 
from "Customer" as c
left join "Invoice" as i
on c."CustomerId" = i."CustomerId" 
group by concat(c."FirstName",' ',c."LastName")



-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
select concat(e."FirstName",' ',e."LastName") as "empleado", concat(c."FirstName",' ',c."LastName") as "nombre_cliente" 
from "Employee" as e
left join "Customer" as c
on e."EmployeeId" = c."SupportRepId" 


