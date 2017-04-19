CLOSE data
cmessagetitle = 'Atencion'
cmessagetext = 'ACTUALIZA LOS ARCHIVOS ?'
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
			COPY file A:\*.dbf to CAMINO+"*.dbf"	
			COPY file A:\*.cdx to CAMINO+"*.cdx"	
	ENDIF
ENDIF
