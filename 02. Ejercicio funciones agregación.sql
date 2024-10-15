
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.
SELECT min("Milliseconds") as	"Duración_mínima"
FROM "Track"


-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
SELECT max("Milliseconds")  as	"Duración_maxima"
FROM "Track";

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
SELECT min("UnitPrice") as	"precio_mínimo"
FROM "Track"  ; 

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
   select max("UnitPrice") as "precio_máximo" 
   from "Track";

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
   select min("InvoiceDate") as "fecha_minima"
   from "Invoice";

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
   select max("InvoiceDate") as "fecha_máxima" 
   from "Invoice";

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
  select count("Name") as "total_pistas"
  from "Track";
   

-- Ejercicio 8: Contar el número de clientes en Brasil.
 
   select count("FirstName") 
   from "Customer"
   where "Country" ='Brazil';
   

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
   select sum("Milliseconds") as "Duración_total"
   from "Track";
   

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
   
   select count("Title") as "Sales_Support_Employee"
   from "Employee"
   where "Title" = 'Sales Support Agent';
    

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
  select sum("Total") as "total_facturado" 
   from "Invoice";
   
    

/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
   select avg("Milliseconds") as "media_duración" 
   from "Track";
    

-- Ejercicio 13: Calcular el precio medio de las pistas.
   select avg("UnitPrice") as "precio_medio" 
   from "Track";
    

-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
   
   select stddev("Milliseconds") as "Desviación_estandar_duración"
   from "Track" ;
    

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
select variance("Milliseconds") 
   from "Track";

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
  select stddev("UnitPrice") as "desviación_estandar_precio" 
   from "Track";


/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.
  select concat("FirstName", ' ', "LastName") as Nombre_Completo 
   from "Customer"


