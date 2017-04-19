	cmessagetitle = 'Atencion'
		cmessagetext = 'ESTE PROCESO REPARA ERRORES DE CARGA DE DEVOLUCIONES, CONTINUA?'
		ndialogtype = 4 + 32
		nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)

		IF nanswer=6

close data
sele 0
use camino+"facturas"
sele 0
use camino+"item_factura"
sele 0
use camino+"para"
sele facturas
set filter to tipo="DC" and tot=0 and codcli="10000"

replace all tipo with "DV"
set filter to 

sele item_factura
set filter to tipo="DC" and preuni=0 AND CANT<0


replace all tipo with "DV"
replace all cant with (cant*(-1))
set filter to 
set filter to preuni=0 and cant<0
replace all cant with cant*-1
close data
	cmessagetitle = 'Atencion'
		cmessagetext = 'FIN DEL PROCESO'
		ndialogtype =16 
		nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)
ENDIF

