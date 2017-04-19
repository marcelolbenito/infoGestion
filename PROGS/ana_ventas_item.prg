IF USED ("item_ventas")
	SELE item_ventas
	SET ORDER TO clave
ELSE
	SELE 0
	USE camino+"item_ventas" ORDER clave
ENDIF




SELECT DISTINCT substr( Item_ventas.clave,2,6),;
  sum( Item_ventas.cantart* Item_ventas.preart);
 FROM  item_ventas INNER JOIN cab_ventas ;
   ON  Item_ventas.clave = Cab_ventas.clave;
 WHERE substr( Item_ventas.clave,2,6) >= "199901";
   AND substr( Item_ventas.clave,2,6) <= "199912";
   AND (cab_ventas.tipo_doc=1 OR cab_ventas.tipo_doc=3);
   AND (cab_ventas.cond_venta <> 3);
 GROUP BY 1;
 ORDER BY 1






