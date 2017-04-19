CLOSE data
cmessagetitle = 'Atencion'
cmessagetext = 'ACTUALIZA LOS ARCHIVOS DE SUCURSAL ?'
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
	ERASE CAMINO+"DATOS_SJ.ZIP"
			COPY file A:\DATOS_SJ.ZIP to CAMINO+"DATOS_SJ.ZIP"	
			
	ENDIF
ENDIF
set defa to c:\myc_gestion\tablas_myc
run pkunzip -o datos_sj.zip
set defa to c:\myc_gestion
