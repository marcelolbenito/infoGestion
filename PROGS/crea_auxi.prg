close data
erase camino+"auxi*.*"

IF USED ("item_opago")
    SELE item_opago
    SET ORDER TO nro_opago
ELSE
    SELE 0
    USE camino+"item_opago" ORDER nro_opago ALIAS item_opago
ENDIF

SELE item_opago
COPY STRUC  TO camino+"auxi_opago.dbf"

IF USED ("item_opago")
    SELE item_opago
    SET ORDER TO nro_opago
ELSE
    SELE 0
    USE camino+"item_opago" ORDER nro_opago ALIAS item_opago
ENDIF

SELE item_opago
COPY STRUC  TO camino+"auxi_opago.dbf"
IF USED ("item_entrada")
    SELE item_entrada
    SET ORDER TO nrofac_pro
ELSE
    SELE 0
    USE camino+"item_entrada" ORDER nrofac_pro ALIAS item_entrada
ENDIF

SELE item_entrada
COPY STRUC  TO camino+"auxi_entrada.dbf"

IF USED ("item_recibo")
    SELE item_recibo
    SET ORDER TO nro_recibo
    ELSE
    SELE 0
    USE camino+"item_recibo" ORDER nro_recibo ALIAS item_recibo
ENDIF

SELE item_recibo
COPY STRUC  TO camino+"auxi_recibo.dbf"