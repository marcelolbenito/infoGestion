close data
sele 0
use camino+"vta_1999" alias vta_1999
SELECT Vta_1999.codpro as Codigo,;
       Vta_1999.nompro as Nombre,;
        sum( Vta_1999.cantidad)as Cant_vend ,;
       AVG(Vta_1999.porc) as prom_uti,;
       ((sum( Vta_1999.cantidad))*(AVG(Vta_1999.porc))) as factor;
 FROM vta_1999;
 GROUP BY Vta_1999.codpro;
 ORDER BY 5 DESC;
into table camino+"ana_prov.dbf"
report form ana_prove previ