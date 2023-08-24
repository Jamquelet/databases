--Operaciones y agregaciones 
--queries avanzadas sobre una tabla

----------------------------------------------------------------
--Limitando resultados:
--LIMIT y OFFSET son cláusulas que se utilizan en una consulta SQL para controlar el número de filas que se devuelven y desde qué posición se empieza a devolver en el conjunto de resultados.

--LIMIT. Permite limitar la cantidad de filas que se devuelven en el resultado de una consulta. Al especificar un número, se indica el límite máximo de filas que se desean obtener en el resultado.
SELECT * FROM tabla LIMIT 10;--Se devolverán solamente las primeras 10 filas de la tabla seleccionada.

/* OFFSET se utiliza para indicar la posición desde la cual se deben devolver las filas. Al especificar un número, se indica el desplazamiento o el número de filas que se deben saltar antes de comenzar a devolver los resultados. */
SELECT * FROM tabla OFFSET 20;--La consulta devolverá todas las filas de la tabla, pero comenzará a partir de la posición 21, omitiendo las primeras 20 filas.

--se puede controlar tanto el número de filas a devolver como la posición de inicio
SELECT * FROM tabla OFFSET 10 LIMIT 5;--Esta consulta devolverá 5 filas de la tabla, comenzando desde la posición 11. En otras palabras, se saltarán las primeras 10 filas y se mostrarán las siguientes 5.

----------------------------------------------------------------
--Ordenando resultados
--ORDER BY se utiliza en una consulta SQL para ordenar los resultados en función de uno o varios campos de una tabla.

SELECT col_1, col_2, ... FROM tabla
ORDER BY col_1, col_2, ... [ASC|DESC];

SELECT nombre, apellido FROM estudiantes
ORDER BY apellido;--devolverá los nombres y apellidos de los estudiantes ordenados alfabéticamente por el campo "apellido" en orden ascendente (por defecto). desde la A hasta la Z según el apellido

--en orden descendente utilizando la palabra clave DESC.
SELECT nombre, apellido FROM estudiantes
ORDER BY apellido DESC;

--ordenar los resultados por múltiples columnas
SELECT nombre, apellido, edad FROM estudiantes
ORDER BY apellido ASC, edad DESC;--se ordenarán primero por el campo "apellido" en orden ascendente, y si hay registros con el mismo apellido, se ordenarán por el campo "edad" en orden descendente.

----------------------------------------------------------------

--Agregaciones 

/* En SQL, una agregación se refiere a la operación de combinar múltiples filas de una tabla para calcular un único valor resumido o estadística sobre esos datos. Las agregaciones son utilizadas con frecuencia para obtener información como el total, el promedio, el máximo, el mínimo o la cuenta de un conjunto de valores.

Las agregaciones se realizan utilizando funciones de agregación específicas que están disponibles en SQL. Algunas de las funciones de agregación más comunes son:

- SUM: Calcula la suma de los valores en una columna numérica.
- AVG: Calcula el promedio de los valores en una columna numérica.
- MAX: Obtiene el valor máximo de una columna.
- MIN: Obtiene el valor mínimo de una columna.
- COUNT: Cuenta el número de filas en una columna.

Estas funciones de agregación se aplican a un conjunto de filas seleccionadas mediante una cláusula WHERE u otra cláusula de filtrado, y el resultado es un único valor que representa la agregación de los datos seleccionados.

Por ejemplo, supongamos que tenemos una tabla llamada "Ventas" con las columnas "Producto" y "Cantidad" que registra las ventas diarias de diferentes productos. Si queremos calcular el total de ventas de todos los productos, podríamos utilizar la función de agregación SUM de la siguiente manera: */

SELECT SUM(Cantidad) AS TotalVentas FROM Ventas;

--Esto devolvería un único valor que representa la suma de todas las cantidades de venta en la tabla "Ventas". En este caso, la columna resultante se llamaría "TotalVentas".

----------------------------------------------------------------

--Agregaciones sobre grupos
/* Cuando necesitamos agrupar filas en categorías específicas y calcular agregaciones sobre cada grupo, se utiliza la instrucción GROUP BY. Esto nos permite realizar cálculos y resúmenes de datos más específicos y segmentados.

Supongamos que tenemos una tabla llamada "Ventas" con las columnas "Cliente_ID", "Producto", "Fecha" y "Cantidad" que registra las ventas de diferentes productos en diferentes fechas.

Si queremos calcular el total de ventas por producto, podemos utilizar la instrucción GROUP BY junto con la función de agregación SUM de la siguiente manera: */

SELECT producto, SUM(cantidad) AS total_ventas
FROM ventas
GROUP BY producto; --Esto agrupará las filas de la tabla "Ventas" por cada valor único en la columna "Producto" y calculará la suma de la cantidad para cada grupo.

--Si deseamos obtener el total de ventas por producto y fecha, podemos utilizar el GROUP BY con dos columnas de la siguiente manera
SELECT producto, fecha, SUM(cantidad) AS TotalVentas
FROM ventas
GROUP BY producto, fecha;
--Esto agrupará las filas por cada combinación única de valores en las columnas "Producto" y "Fecha" y calculará la suma de la cantidad para cada grupo.
--Al utilizar el GROUP BY, es importante tener en cuenta que solo se pueden incluir en la cláusula SELECT las columnas utilizadas en el GROUP BY o funciones de agregación aplicadas a otras columnas. Esto se debe a que el GROUP BY define las categorías de agrupación y, por lo tanto, las columnas en el resultado deben ser coherentes con las columnas utilizadas para agrupar.

--Filtrando luego de una agregación
/* Si intentamos filtrar luego de agrupar con GROUP BY, tenemos que utilizar la clausula HAVING.

La cláusula WHERE se utiliza para aplicar condiciones de filtrado a las filas individuales de una tabla antes de que se realice la agrupación o agregación. Por otro lado, la cláusula HAVING se utiliza para aplicar condiciones de filtrado a los grupos formados por la cláusula GROUP BY después de que se haya realizado la agregación.

La sintaxis de la instrucción HAVING es similar a la cláusula WHERE y se utiliza de la siguiente manera: */
SELECT columnas
FROM tabla
GROUP BY columnas
HAVING condiciones;--que deben cumplir los grupos para ser incluidos en el resultado
--HAVING se aplica después de la agrupación, esto significa que se pueden utilizar funciones de agregación como COUNT, SUM o AVG en las condiciones de filtrado

--Supongamos que tenemos una tabla llamada "Ventas" con las columnas "Producto" y "Cantidad" que registra las ventas diarias de diferentes productos. Si queremos obtener los productos cuya cantidad total vendida es mayor que 100, podemos utilizar la cláusula HAVING de la siguiente manera:

SELECT producto, SUM(cantidad) AS total_ventas
FROM ventas
GROUP BY producto
HAVING SUM(cantidad) > 100;