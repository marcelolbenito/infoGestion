CLOSE data
cmessagetitle = 'Atencion'
cmessagetext = 'ACTUALIZA LOS ARCHIVOS DE ARTICULOS Y PROVEEDORES DESDE ZIP ?'
ndialogtype = 4 + 32
nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)

IF nanswer=6
	espacio=DISKSPACE("E")
	IF espacio=-1
		cmessagetitle = 'Atencion'
		cmessagetext = 'INSERTE DISCO ZIP EN UNIDAD E:, INTENTE NUEVAMENTE'
		ndialogtype = 16
		nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)
	ELSE
			COPY file E:\maeart.dbf to CAMINO+"maeart.dbf"	
			COPY file E:\maeart.cdx to CAMINO+"maeart.cdx"	
        	COPY file E:\maeprove.dbf to CAMINO+"maeprove.dbf"	
			COPY file E:\maeprove.cdx to CAMINO+"maeprove.cdx"	

	ENDIF
ENDIF
