*parameter parar
m.titulo="Lista de Precios"
IF USED ("empresa")
    SELE empresa
   
ELSE
    SELE 0
    USE camino+"empresa"  ALIAS empresa 
ENDIF

if used ("maeart")
sele maeart
set order to codart
else
sele 0
use camino+"maeart" order codart alias maeart
endif


if used ("maetipo")
sele maetipo
set order to codtipo
else
sele 0
use camino+"maetipo" order codtipo alias maetipo
endif

if used ("maelinea")
sele maelinea
set order to codlinea
else
sele 0
use camino+"maelinea" order codlinea alias maelinea
endif

SELECT *;
 FROM  maeart LEFT OUTER JOIN maetipo ;
   ON  Maeart.codtipo = Maetipo.codtipo;
 order by maeart.codtipo,maeart.codlinea,maeart.nomart;
 INTO CURSOR lista_1


SELECT *;
 FROM  lista_1 LEFT OUTER JOIN maelinea ;
   ON  lista_1.codlinea = Maelinea.codlinea;
   order by lista_1.codtipo_a,lista_1.codlinea,lista_1.nomart;
 INTO CURSOR lista_2

 set filter to codpro="00086"
 report form lista_arti previ