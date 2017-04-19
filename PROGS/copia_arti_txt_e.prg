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
		USE camino+"maeart" exclu
		*** Obtiene el tamaño del encabezado de la tabla. ***
		gnTableHead = HEADER( )
		*** Calcula el tamaño de la tabla. ***
		gnFileSize = gnTableHead + (RECSIZE( ) * RECCOUNT( ) + 1)
		actual=curdir()
		USE
		espacio=DISKSPACE("E")

		IF espacio > gnFileSize
		USE camino+"maeart" exclu
		    COPY to maeart.txt sdf
			COPY file "maeart.txt" to e:\maeart.txt
		
		ELSE
			cmessagetitle = 'Atencion'
			cmessagetext = 'DISCO LLENO,INSERTE UNO VACIO E INTENTE NUEVAMENTE'
			ndialogtype = 16
			nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)

		ENDIF


	
	ENDIF
ENDIF
*copy file camino+"maeart.*" to a:\maeart.*
