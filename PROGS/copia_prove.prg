CLOSE data
cmessagetitle = 'Atencion'
cmessagetext = 'GRABA LOS ARCHIVOS DE PROVEEDORES?'
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
		USE camino+"maeprove" exclu
		*** Obtiene el tamaño del encabezado de la tabla. ***
		gnTableHead = HEADER( )
		*** Calcula el tamaño de la tabla. ***
		gnFileSize = gnTableHead + (RECSIZE( ) * RECCOUNT( ) + 1)
		actual=curdir()
		USE
		espacio=DISKSPACE("A")

		IF espacio > gnFileSize
			COPY file camino+"maeprove.dbf" to a:\maeprove.dbf
			COPY file camino+"maeprove.cdx" to a:\maeprove.cdx
		ELSE
			cmessagetitle = 'Atencion'
			cmessagetext = 'DISCO LLENO,INSERTE UNO VACIO E INTENTE NUEVAMENTE'
			ndialogtype = 16
			nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)

		ENDIF


	
	ENDIF
ENDIF
*copy file camino+"maeart.*" to a:\maeart.*
