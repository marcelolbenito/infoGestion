IF USED ("stock")
    SELE stock
ELSE
    SELE 0
    USE camino+"stock" ALIAS stock
ENDIF

IF USED ("maeart")
    SELE maeart
    SET ORDER TO codart
ELSE
    SELE 0
    USE camino+"maeart" ORDER codart ALIAS maeart
ENDIF


SELECT stock.codart,;
    SUM( stock.cant_vta),;
    SUM( stock.cant_comp),;
    SUM( stock.cant_comp)-SUM( stock.cant_vta) AS stk_act;
    FROM stock;
    GROUP BY stock.codart;
    INTO CURSOR actu_maeart
sele maeart
*replace all stk_act with 0
SELE actu_maeart
GO TOP
DO WHILE !EOF()
    SCATTER MEMVAR
    SELE maeart
    SEEK m.codart
    IF FOUND()
        REPLACE maeart.stk_act WITH m.stk_act
    ELSE
        REPLACE maeart.stk_act WITH 0
    ENDIF
    SELE actu_maeart
    SKIP
ENDDO


