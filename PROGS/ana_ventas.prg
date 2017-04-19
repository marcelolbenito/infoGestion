**Facturacion por mes , solo facturas o ND

IF USED ("cab_ventas")
	SELE cab_ventas
	SET ORDER TO clave_cab
ELSE
	SELE 0
	USE camino+"cab_ventas" ORDER clave_cab
ENDIF



fec1="199901"
fec2="199912"



SELECT DISTINCT SUBSTR( cab_ventas.clave,2,6)as Fecha,;
    SUM( cab_ventas.TOTAL)as Total_Fac;
    FROM cab_ventas;
    WHERE  between (SUBSTR( cab_ventas.clave,2,6),fec1,fec2);
    and(tipo_doc=1 OR tipo_doc=3);
            AND cond_venta <> 3;
    GROUP BY 1;
    into table res_ventas.dbf


SELECT SUBSTR(DTOS( Movgastos.fecmov),1,6),;
  SUM( Movgastos.imp_gasto);
 FROM movgastos;
 where codgasto <> "017";
 GROUP BY 1;
 into table res_gastos.dbf

*SELECT *;
 *FROM  res_gastos INNER JOIN res_ventas ;
  * ON  Res_gastos.exp_1 = Res_ventas.fecha

SELECT Vta_1999.fecha as Periodo,;
       sum( Vta_1999.vendido) as Facturado,;      
       sum( Vta_1999.costo_vend) as Costo,;       
       Res_gastos.sum_imp_ga as Gastos;
 FROM  vta_1999 INNER JOIN res_gastos ;
   ON  Vta_1999.fecha = Res_gastos.exp_1;
 GROUP BY Vta_1999.fecha;
 into table camino+"ana_vtas_gastos.dbf"

close data 
 erase res_ventas.dbf
 erase res_gastos.dbf

sele 0
use camino+"ana_vtas_gastos.dbf" alias ana_vtas_gastos
*DO (_GENGRAPH) WITH 'QUERY'