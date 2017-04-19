CLOSE DATA

**Genero ventas de articulos
IF USED ("dif_stock")
    SELE dif_stock
    *SET ORDER TO codpro
ELSE
    SELE 0
    USE camino+"dif_stock"  ALIAS dif_stock
endif    
IF USED ("item_ventas")
    SELE item_ventas
ELSE
    SELE 0
    USE camino+"item_ventas" ALIAS item_ventas
ENDIF

IF USED ("item_entrada")
    SELE item_entrada
ELSE
    SELE 0
    USE camino+"item_entrada" ALIAS item_entrada
ENDIF

IF USED ("cab_entrada")
    SELE cab_entrada
ELSE
    SELE 0
    USE camino+"cab_entrada" ALIAS cab_entrada
ENDIF

SELECT item_ventas.numero AS fac_vta,;
    SUBSTR( item_ventas.clave,2,8)AS fecha,;
    item_ventas.codart AS codart,;
    item_ventas.cantart AS cant_vta;
    FROM item_ventas;
    WHERE item_ventas.cantart <> 0;
    ORDER BY item_ventas.codart, 2;
    INTO TABLE camino+"stock"
retur
**Genero ingreso de articulos por compra
SELECT item_entrada.nrofac_pro AS fac_compra,;
    item_entrada.codart  AS codart,;
    item_entrada.cant AS cant_comp,;
    DTOS(cab_entrada.fecha)AS fecha ;
    FROM  item_entrada inner JOIN cab_entrada ;
    ON  item_entrada.nrofac_pro = cab_entrada.nrofac_pro;
    INTO TABLE stock_compra


SELE stock
ALTER TABLE stock ADD COLUMN fac_compra c(8)
ALTER TABLE stock ADD COLUMN cant_comp N(10,3)
ALTER TABLE stock ADD COLUMN observ c(50)
ALTER TABLE stock ALTER  COLUMN codart c(5)

APPEND FROM stock_compra
APPEND FROM camino+"dif_stock.dbf"

index on (codart+fecha) tag clave_stk
set order to clave_stk
ERASE stock_compra
