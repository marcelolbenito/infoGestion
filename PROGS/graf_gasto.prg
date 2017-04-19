SELECT Movgastos.codgasto as Codigo,;
       Maegastos.desgasto as Nombre,;
       sum( Movgastos.imp_gasto)as Importe;
 FROM  movgastos INNER JOIN maegastos ;
   ON  Movgastos.codgasto = Maegastos.codgasto;
 GROUP BY Movgastos.codgasto
 
 DO (_GENGRAPH) WITH 'QUERY'