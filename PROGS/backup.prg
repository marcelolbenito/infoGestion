CLOSE ALL


SET DEFAULT TO c:\infogestion\data
unipen=" "

*CLEAR
SET SAFETY ON 
SET TALK ON  


          
		cmessagetitle = 'Atencion'
		cmessagetext = 'GRABA LOS ARCHIVOS EN EL DISCO?'
		ndialogtype = 4 + 32
		nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)
	
		IF nanswer=6
		
        qrar="c:\infogestion\data\"+"rar.exe a "+"c:\infogestion\bak_tablas\"+"backup_"+DTOS(DATE())+"_"+alltrim(STR((hour(DATETIME()))))+alltrim(STR((MINUTE(DATETIME()))))+".rar  *.*"	
		?qrar
		run/N7 &qrar	
		ENDIF 	