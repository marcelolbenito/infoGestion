close DATABASES ALL 
set exclusive on

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

IF USED ("item_pedidos_sal")
    SELE item_pedidos_sal
    SET ORDER TO nroped_s
ELSE
    SELE 0
    USE camino+"item_pedidos_sal" ORDER nroped_s ALIAS item_pedidos_sal
ENDIF

SELE item_pedidos_sal
COPY STRUC  TO camino+"auxi1.dbf"

IF USED ("item_factura")
    SELE item_factura
    SET ORDER TO nrofac
ELSE
    SELE 0
    USE camino+"item_factura" ORDER nrofac ALIAS item_factura
ENDIF

SELE item_factura
COPY STRUC  TO camino+"auxi_fac.dbf"


IF USED ("item_tarjeta")
    SELE item_tarjeta
    SET ORDER TO nro_tarjeta
ELSE
    SELE 0
    USE camino+"item_tarjeta" ORDER nro_sobre ALIAS item_tarjeta
ENDIF

SELE item_tarjeta
COPY STRUC  TO camino+"auxi_tarjeta.dbf"


close data
use camino+"auxi1"
reindex
use

use camino+"auxi_opago" IN 0
reindex
use
use camino+"auxi_entrada"
reindex
use

sele camino+"item_entrada" 
reindex
*use
sele camino+"item_factura"
reindex
*use
sele camino+"item_opago"
reindex
*use
sele camino+"item_pedidos_sal"
reindex
*use
sele camino+"item_tarjeta"
reindex
*use
sele camino+"cab_entrada"
reindex
*use
sele camino+"cab_opago"

reindex
*use

sele camino+"cab_tarjeta"

REINDEX

CLOSE DATABASES all

*use

