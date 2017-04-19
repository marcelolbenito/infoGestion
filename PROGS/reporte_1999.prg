if used("ventas_costos")
sele ventas_costos
set order to fecha
else 
sele 0
use  camino+"ventas_costos" order fecha
endif

IF USED ("ventas_costos")
    SELE ventas_costos
ELSE
    SELE 0
    USE camino+"ventas_costos"  ALIAS ventas_costos
ENDIF


set filter to fecha>="199901" and fecha<="199912"
copy to camino+"vta_99"


SELECT Vta_99.*, Maeprove.codpro, Maeprove.nompro;
 FROM  vta_99 INNER JOIN item_costos;
    INNER JOIN maeprove ;
   ON  Item_costos.codprov = Maeprove.codpro ;
   ON  Vta_99.codigo = Item_costos.codart;
   into table camino+"vta_1999.dbf"
   
close data   
   erase camino+"vta_99.dbf" 

use camino+"vta_1999.dbf" alias vta_1999
index on fecha tag fecha
index on codpro tag codpro