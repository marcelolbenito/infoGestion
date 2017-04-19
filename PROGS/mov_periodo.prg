*Genera archivo con los movimientos del periodo
SELECT Vta_1999.codigo, Vta_1999.nombre, Vta_1999.costo_uni,;
  Vta_1999.precio, sum( Vta_1999.cantidad);
 FROM vta_1999;
 GROUP BY Vta_1999.codigo
