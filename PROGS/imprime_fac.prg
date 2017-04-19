
m.tipo="FC"
m.letra="A"
m.nrofac=12
IF USED("empresa")
	SELE empresa

ELSE
	SELE 0
	USE camino+"empresa" ALIAS empresa
ENDIF

IF USED("item_factura")
	SELE item_factura
	SET ORDER TO nrofac
ELSE
	SELE 0
	USE camino+"item_factura" ORDER nrofac
ENDIF

IF USED("facturas")
	SELE facturas
	SET ORDER TO nrofac
ELSE
	SELE 0
	USE camino+"facturas" ORDER nrofac
ENDIF

IF USED("maeart")
	SELE maeart
	SET ORDER TO codart
ELSE
	SELE 0
	USE camino+"maeart" ORDER codart
ENDIF

IF USED("maecli")
	SELE maecli
	SET ORDER TO codcli
ELSE
	SELE 0
	USE camino+"maecli" ORDER codcli
ENDIF

SELECT (str(item_factura.nrofac)+(item_factura.letra)+(item_factura.tipo))as clave,;
	item_factura.nrofac,item_factura.letra,item_factura.tipo, item_factura.codart,;
	maeart.nomart,;
	item_factura.cant, item_factura.preuni,item_factura.boni_item;
	FROM  item_factura inner JOIN maeart ;
	ON  item_factura.codart = maeart.codart;
	ORDER BY item_factura.nrofac;
	INTO TABLE tabla_item.DBF

SELECT (str(facturas.nrofac)+(facturas.letra)+(facturas.tipo))as clave_1,;
	facturas.nrofac, facturas.codcli, maecli.nomcli,;
	maecli.calle,maecli.numero,maecli.piso,maecli.dto,maecli.locali,maecli.cuit,;
	facturas.fecha, facturas.subtot,facturas.tot,facturas.iva1,facturas.iva2,facturas.porbonif,;
	facturas.condvta,facturas.tipo,facturas.letra;
	FROM  facturas inner JOIN maecli ;
	ON  facturas.codcli = maecli.codcli;
	INTO TABLE tabla2.DBF

SELECT *;
	FROM  tabla_item Left outer join tabla2 ;
	ON  alltrim(tabla_item.clave)=alltrim(tabla2.clave_1);
	ORDER BY tabla_item.clave;
	INTO cursor consulta

SELE tabla2
USE
ERASE tabla2.DBF

SELE tabla_item
USE
ERASE tabla_item.DBF

SELE consulta
SET FILTER TO alltrim(clave)=alltrim((str(m.nrofac)+(m.letra)+(m.tipo)))
m.condicionvta="CDO 20%Dto-15 Dias 10%Dto-30 Dias Neto"  
	DO case
		CASE m.tipo="PR"
			REPORT FORM factura PREVI
		CASE m.tipo="DV"
			REPORT FORM factura PREVI
		CASE m.tipo="FC" and m.letra="A"
			SET printer to LPT1
			m.impresion="ORIGINAL"
			REPORT FORM factura_ab to print noconsole
			m.impresion="DUPLICADO"
			REPORT FORM factura_ab to print noconsole
		CASE m.tipo="FC" and m.letra="B"
			SET printer to LPT2
			m.impresion="ORIGINAL"
			REPORT FORM factura_ab to print noconsole
			m.impresion="DUPLICADO"
			REPORT FORM factura_ab to print noconsole
			SET printer to LPT1
		ENDCASE


*PROMPT

