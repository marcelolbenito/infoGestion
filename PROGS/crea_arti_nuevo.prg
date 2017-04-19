SELECT Item_costos.codart, Articulos_a.nomart, Articulos_a.couart,;
  Item_costos.codprov, Item_costos.premay;
 FROM  item_costos INNER JOIN articulos Articulos_a ;
   ON  Item_costos.codart = Articulos_a.codart;
 ORDER BY Item_costos.codart;
 INTO TABLE tablas_myc\back\arti_nuevo.dbf
