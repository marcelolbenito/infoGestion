CLOSE data
cmessagetitle = 'Atencion'
cmessagetext = 'GRABA LOS ARCHIVOS DE ARTICULOS?'
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
		USE camino+"maeart" exclu
		*** Obtiene el tama�o del encabezado de la tabla. ***
		gnTableHead = HEADER( )
		*** Calcula el tama�o de la tabla. ***
		gnFileSize = gnTableHead + (RECSIZE( ) * RECCOUNT( ) + 1)
		actual=curdir()
		USE
		espacio=DISKSPACE("A")

		IF espacio > gnFileSize
			COPY file camino+"maeart.dbf" to a:\maeart.dbf
			COPY file camino+"maeart.cdx" to a:\maeart.cdx
		ELSE
			cmessagetitle = 'Atencion'
			cmessagetext = 'DISCO LLENO,INSERTE UNO VACIO E INTENTE NUEVAMENTE'
			ndialogtype = 16
			nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)

		ENDIF


	
	ENDIF
ENDIF
*copy file camino+"maeart.*" to a:\maeart.*
