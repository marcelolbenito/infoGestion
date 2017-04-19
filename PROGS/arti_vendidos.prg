SELECT Stock.codart, sum( Stock.cant_vta);
 FROM stock;
 GROUP BY Stock.codart
