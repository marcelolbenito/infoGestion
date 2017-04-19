do stock
IF USED ("maeart")
    SELE maeart
    SET ORDER TO codart
ELSE
    SELE 0
    USE camino+"maeart" ORDER codart ALIAS maeart
ENDIF
IF USED ("maeprove")
    SELE maeprove
    SET ORDER TO codpro
ELSE
    SELE 0
    USE camino+"maeprove" ORDER codpro ALIAS maeprove
ENDIF

SELECT Maeart.codart, Maeart.nomart, Maeart.stkact, Maeart.stkmin,Maeart.codpro,maeprove.nompro,;
  maeart.pack,maeart.couart,;
  Maeart.stkact- Maeart.stkmin as diferencia;
 FROM maeart,maeprove;
 where maeart.codpro=maeprove.codpro;
 order by maeart.codpro,maeart.codart;
 into cursor sin_stock
 
 set filter to diferencia<0
report form stock_minimo previ
 
	
 
