PUBLIC valsotoctot
STORE 0 TO valsotoctot
**Genero ventas de articulos
IF USED ("dif_stock")
	SELE dif_stock
ELSE
	SELE 0
	USE camino+"dif_stock"  ALIAS dif_stock
ENDIF
IF USED ("item_factura")
	SELE item_factura
ELSE
	SELE 0
	USE camino+"item_factura" ALIAS item_factura
ENDIF

IF USED ("stock_ini")
	SELE stock_ini
ELSE
	SELE 0
	USE camino+"stock_ini" ALIAS stock_ini
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

IF USED ("facturas")
	SELE facturas
ELSE
	SELE 0
	USE camino+"facturas" ALIAS facturas
ENDIF

IF USED ("maeart")
	SELE maeart
	SET order to codart
ELSE
	SELE 0
	USE camino+"maeart" order codart ALIAS maeart
ENDIF
REPLACE ALL stkact with 0
replace valstock with (m.stkact*m.prevta1)

SELECT item_factura.tipo AS tipo,;
	facturas.fecha AS fecha,;
	item_factura.letra AS letra,;
	item_factura.nrofac AS nrofac,;
	item_factura.codart AS codart,;
	item_factura.cant   AS cant_vta;
	FROM  item_factura INNER JOIN facturas ;
	ON  str(item_factura.nrofac)+item_factura.letra+item_factura.tipo = str(facturas.nrofac)+facturas.letra+facturas.tipo;
	ORDER BY item_factura.codart, 2;
	INTO TABLE camino+"stock"
	*and item_factura.tipo="FC" OR item_factura.tipo="PR" 

**Genero ingreso de articulos por compra
SELECT item_entrada.nrofac_pro AS fac_compra,;
	item_entrada.codart  AS codart,;
	item_entrada.cant    AS cant_comp,;
	item_entrada.codpro  AS codpro,;
	cab_entrada.fecha    AS fecha ;
	FROM item_entrada,cab_entrada;
	WHERE (ALLTRIM(item_entrada.nrofac_pro)+ALLTRIM(item_entrada.codpro))=;
	(ALLTRIM(cab_entrada.nrofac_pro)+ALLTRIM(cab_entrada.codpro));
	ORDER BY item_entrada.codart, 2;
	INTO TABLE stock_compra



SELE stock
ALTER TABLE stock ADD COLUMN codpro c(5)
ALTER TABLE stock ADD COLUMN fac_compra c(8)
ALTER TABLE stock ADD COLUMN cant_comp N(10,3)
ALTER TABLE stock ADD COLUMN observ c(50)
ALTER TABLE stock ALTER  COLUMN codart c(13)
ALTER TABLE stock ADD  COLUMN stk_ini n(8,2)

APPEND FROM stock_compra

APPEND FROM camino+"dif_stock.dbf"

APPEND FROM camino+"stock_ini.dbf"

INDEX on (alltrim(codart)+dtos(fecha)) tag clave_stk
SET order to clave_stk
ERASE stock_compra

SELE stock




GO top
STORE 0 to m.stkact,valstock
m.stkact=m.stkact+(cant_comp+stk_ini-cant_vta)

SCATTER memvar
DO while !eof()
	Skip
	IF m.codart=codart
		m.stkact=m.stkact+(cant_comp+stk_ini-cant_vta)
	ELSE
		SELE maeart
		SEEK m.codart
		IF found()
		    m.prevta1=maeart.prevta1
			REPLACE stkact with m.stkact
			replace ultmov WITH DATE()
			** esto es valorizar a precio de venta
			replace valstock with (m.stkact*m.prevta1)
			
		ENDIF
		SUM valstock TO valsotoctot
		SELE stock
		m.codart=codart
		STORE 0 to m.stkact
		m.stkact=m.stkact+(cant_comp+stk_ini-cant_vta)
	ENDIF
ENDDO
SELE maeart
SEEK m.codart
IF found()
	REPLACE stkact with m.stkact
*	WAIT WINDOW DATE()
	
ENDIF

RETUR
