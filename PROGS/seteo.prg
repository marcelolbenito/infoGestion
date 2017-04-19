SET DATE TO FRENCH
SET CENTURY ON
SET CENTURY TO 20 rollover 10
SET DELE ON
SET EXCLUSIVE OFF
SET ESCAPE OFF
SET SAFETY OFF
SET TALK OFF
CLOSE DATA
**===============================
** Abro la tabla camino, donde esta el path de las tablas del sistema
PUBLIC  camino , cami1,m.mes1,m.mes2,m.año1,m.año2,desdeform
camino  = " "
camino1 = " "
USE camino
camino  =ALLTRIM(camino.ruta)
cami1=ALLTRIM(camino.ruta_act)
OPEN DATABASE camino+"mycdata" SHARED

USE
desdeform=.f.
m.mes1="01"
m.mes2="01"
m.año1="2010"
m.año2="2010"

