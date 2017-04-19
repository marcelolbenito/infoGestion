COPY file camino+"facturas.*" to cami1+"facturas.*"
COPY file camino+"item_factura.*" to cami1+"item_factura.*"
COPY file camino+"cab_entrada.*" to cami1+"cab_entrada.*"
COPY file camino+"item_entrada.*" to cami1+"item_entrada.*"
COPY file camino+"movgastos.*" to cami1+"movgastos.*"
COPY file camino+"cab_recibo.*" to cami1+"cab_recibo.*"
COPY file camino+"item_recibo.*" to cami1+"item_recibo.*"

COPY file camino+"caja.*" to cami1+"caja.*"
COPY file camino+"dif_stock.*" to cami1+"dif_stock.*"
COPY file camino+"maecli.*" to cami1+"maecli.*"
COPY file camino+"stock_ini.*" to cami1+"stock_ini.*"
COPY file camino+"copiar.bat" to cami1+"copiar.bat"
SET defa to c:\myc_gestion\tablas_myc\envio_central
ERASE *.zip
RUN pkzip datos_sj.zip  *.*
SET defa to c:\myc_gestion
CLOSE data
cmessagetitle = 'Atencion'
cmessagetext = 'GRABA LOS ARCHIVOS DE ACTUALZACION?'
ndialogtype = 4 + 32
nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)

IF nanswer=6
	espacio=DISKSPACE("A")
	IF espacio=-1
		cmessagetitle = 'Atencion'
		cmessagetext = 'INSERTE DISKETE EN UNIDAD A:,E INTENTE NUEVAMENTE'
		ndialogtype = 16
		nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)
	ELSE
		COPY file cami1+"*.ZIP" to a:\*.*
	ENDIF
ENDIF
