do stock
IF USED ("maeart")
    SELE maeart
    SET ORDER TO codart
ELSE
    SELE 0
    USE camino+"maeart" ORDER codart ALIAS maeart
ENDIF

SELECT Maeart.codart, Maeart.nomart, Maeart.stkact, Maeart.stkmin,Maeart.codpro,;
  Maeart.stkact- Maeart.stkmin as diferencia;
 FROM maeart;
 order by maeart.codpro,maeart.codart;
 into cursor sin_stock
 
 set filter to diferencia<0
 count to bajo_stock
if bajo_stock>0
 cmessagetitle = 'Atencion'
	cmessagetext = 'EXISTEN'+"  "+ALLTRIM(STR(bajo_stock))+"  "+'ARTICULOS BAJOS DE STOCK,CONSULTE EL LISTADO'
	ndialogtype = 16
	nanswer = MESSAGEBOX(cmessagetext, ndialogtype, cmessagetitle)
endif	
 
