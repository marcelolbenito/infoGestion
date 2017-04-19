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
	maeart.nomart,maeart.couart,;
	item_factura.cant, item_factura.preuni;
	FROM  item_factura inner JOIN maeart ;
	ON  (item_factura.codart = maeart.codart) and tipo="FC";
	ORDER BY item_factura.nrofac;
	INTO TABLE tabla_item.DBF

SELECT (str(facturas.nrofac)+(facturas.letra)+(facturas.tipo))as clave_1,;
	facturas.fecha;
	FROM  facturas  ;
	INTO TABLE tabla2.DBF


SELECT *;
	FROM  tabla_item Left outer join tabla2 ;
	ON  alltrim(tabla_item.clave)=alltrim(tabla2.clave_1);
	ORDER BY tabla_item.codart;
	INTO table camino+"artivend"

SELE tabla2
USE
ERASE tabla2.DBF

SELE tabla_item
USE
ERASE tabla_item.DBF
