CLOSE data
cmessagetitle = 'Atencion'
cmessagetext = 'GRABA LOS ARCHIVOS DE ARTICULOS PARA SISTEMA COBOL EN ZIP?'
ndialogtype = 4 + 32
nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)

IF nanswer=6
	espacio=DISKSPACE("E")
	IF espacio=-1
		cmessagetitle = 'Atencion'
		cmessagetext = 'INSERTE DISCO ZIP EN UNIDAD E:, E INTENTE NUEVAMENTE'
		ndialogtype = 16
		nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)
	ELSE
		COPY file c:\myc_gestion\tablas_myc\*.* to e:\*.*


	ENDIF
ENDIF
*copy file camino+"maeart.*" to a:\maeart.*
