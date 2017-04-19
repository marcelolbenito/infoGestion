close data

IF USED ("ventas_costos")
    SELE ventas_costos
ELSE
    SELE 0
    USE camino+"ventas_costos"  ALIAS ventas_costos
ENDIF


SELECT *;
 FROM ventas_costos;
 WHERE Ventas_costos.costo_uni IS NULL;
 INTO TABLE camino+"nulos.dbf"
 copy to camino+"sin costo.dbf"
 
 SELECT *;
 FROM ventas_costos;
 WHERE Ventas_costos.costo_uni IS NOT NULL;
into table camino+"no_nulos.dbf"



sele nulos

replace all costo_uni with (precio/1.30)
replace all costo_vend with (costo_uni*cantidad)

replace all porc with 23.00

append from camino+"no_nulos.dbf" 

close data
use camino+"nulos.dbf"
copy to camino+"ventas_costos" 
use
erase camino+"no_nulos.dbf"
erase camino+"nulos.dbf"

use camino+"ventas_costos"
index on fecha tag fecha