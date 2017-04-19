CLOSE data
cmessagetitle = 'Atencion'
cmessagetext = 'GRABA LOS ARCHIVOS DE ARTICULOS EN ZIP?'
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
		USE camino+"maeart" exclu
		*** Obtiene el tamaño del encabezado de la tabla. ***
		gnTableHead = HEADER( )
		*** Calcula el tamaño de la tabla. ***
		gnFileSize = gnTableHead + (RECSIZE( ) * RECCOUNT( ) + 1)
		actual=curdir()
		USE
		espacio=DISKSPACE("E")

		IF espacio > gnFileSize
			COPY file camino+"maeart.dbf" to e:\maeart.dbf
			COPY file camino+"maeart.cdx" to e:\maeart.cdx
			COPY file camino+"maeprove.dbf" to e:\maeprove.dbf
			COPY file camino+"maeprove.cdx" to e:\maeprove.cdx

		ELSE
			cmessagetitle = 'Atencion'
			cmessagetext = 'DISCO LLENO,INSERTE UNO VACIO E INTENTE NUEVAMENTE'
			ndialogtype = 16
			nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)

		ENDIF


	
	ENDIF
ENDIF
*copy file camino+"maeart.*" to a:\maeart.*
