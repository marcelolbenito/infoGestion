IF USED ("maeart")
    SELE maeart
    SET ORDER TO codart
ELSE
    SELE 0
    USE camino+"maeart" ORDER codart ALIAS maeart
ENDIF

SUM (stkact*costuni) TO valstockact

IF USED ("maeprove")
    SELE maeprove
    SET ORDER TO codpro
ELSE
    SELE 0
    USE camino+"maeprove" ORDER codpro ALIAS maeprove
ENDIF


IF USED ("Stock_ini")
    SELE Stock_ini
    SET ORDER TO codart
ELSE
    SELE 0
    USE camino+"Stock_ini" ORDER codart ALIAS Stock_ini
ENDIF


SELECT Stock_ini.*,  (Stock_ini.stk_ini*Maeart.costuni)as costact;
,(Stock_ini.stk_ini*Maeart.prevta1)as vtaact;
, Maeart.nomart,;
  Maeart.costuni, Maeart.prevta1;
 FROM ;
     stock_ini ;
    INNER JOIN maeart  ;
   ON  Stock_ini.codart = Maeart.codart;
   INTO CURSOR stockinival
   
   
  SET FILTER TO VAL(codart)<70
  
   SUM costact TO m.costoact
  
   
   SUM vtaact TO m.vtaact
   
   
   DO cta_cte_prove
   SELECT maeprove
   SUM saldo TO m.saldoprove
   
  