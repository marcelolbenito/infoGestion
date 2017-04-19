close data

erase camino+"notas_credito.*"
erase camino+"facturacion_periodo.*"
IF used("item_recibo")
	SELE item_recibo
ELSE
	SELE 0
	USE camino+"item_recibo"
ENDIF
IF used("cab_recibo")
	SELE cab_recibo
ELSE
	SELE 0
	USE camino+"cab_recibo"
ENDIF


IF used("maecli")
	SELE maecli
ELSE
	SELE 0
	USE camino+"maecli"
ENDIF
SELECT item_recibo.letra, item_recibo.nro_recibo,;
	item_recibo.tipo_pago,  Cab_recibo.codcli,;
	Cab_recibo.fecha, item_recibo.importe;
	FROM  item_recibo INNER JOIN Cab_recibo ;
	ON  (item_recibo.letra)+alltrim (str(item_recibo.nro_recibo)) = ;
	(Cab_recibo.letra)+alltrim(str(Cab_recibo.nro_recibo));
	WHERE item_recibo.tipo_pago = "2";
	into table recibo_nc


SELECT recibo_nc.fecha, recibo_nc.letra, recibo_nc.nro_recibo as nrofac,;
	recibo_nc.codcli, Maecli.nomcli, Maecli.codiva, Maecli.codprovi,;
	Maecli.cuit, recibo_nc.importe as importe_nc;
	FROM  recibo_nc INNER JOIN Maecli ;
	ON  recibo_nc.codcli = Maecli.codcli;
	into table camino+"notas_credito"

close data
erase recibo_nc
use  camino+"notas_credito" exclu
alter table "notas_credito" add column tipo c(2)
replace all tipo with "NC"

IF used("facturas")
	SELE facturas
ELSE
	SELE 0
	USE camino+"facturas"
ENDIF

IF used("maecli")
	SELE maecli
ELSE
	SELE 0
	USE camino+"maecli"
ENDIF

SELECT Facturas.fecha, Facturas.tipo, Facturas.ctroemi, Facturas.condvta,;
  Facturas.letra, Facturas.nrofac, Facturas.codcli, Maecli.nomcli,;
  Maecli.codiva, Maecli.cuit, Maecli.codprovi, Facturas.subtot,;
  Facturas.iva1, Facturas.iva2, Facturas.tot;
 FROM  facturas LEFT OUTER JOIN maecli ;
   ON  Facturas.codcli = Maecli.codcli;
   into table camino+"facturacion_periodo"
   

alter table facturacion_periodo add column importe_nc n(10,2)

sele facturacion_periodo
append from camino+"notas_credito.dbf"
close data
use camino+"facturacion_periodo" exclu
index on letra+alltrim(str(nrofac)) tag nrofac
set order to nrofac
brow