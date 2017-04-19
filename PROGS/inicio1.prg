*CLEAR EVENTS

CLEAR ALL
CLOSE ALL
SET DEFAULT TO c:\infogestion
PUBLIC  camino , cami1,m.mes1,m.mes2,m.año1,m.año2,ax_parametro
DO progs\seteo 
*DIMENSION pp(30)
USE data\camino
camino  =ALLTRIM(camino.ruta)
cami1=ALLTRIM(camino.ruta_act)
USE
set defa to (ALLTRIM(cami1))
*close data
WITH _SCREEN
	.CAPTION="Sistema Gestion Comercial"
	.ICON="GRAPHICS\crdfle10.ico"
	_SCREEN.ADDOBJECT("oImg", "Image") 
	.WindowType = 1
	.oImg.PICTURE = "GRAPHICS\Logo Sistema.jpg"
	.oImg.TOP = (_SCREEN.HEIGHT- _SCREEN.oImg.HEIGHT)/2 
	.oImg.LEFT = (_SCREEN.WIDTH - _SCREEN.oImg.WIDTH)/2 
	.oImg.VISIBLE = .T.
		
	.autocenter=.t.
	.backcolor=16777215
	.borderstyle=0
	.windowstate=2
	.closable=.t.
	.controlbox=.f.
ENDWITH


*do seteo
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

ax_parametro=0
camino  = " "
camino1 = " "
m.mes1="01"
m.mes2="01"
m.año1="2010"
m.año2="2010"

USE data\camino
SCATTER memvar
camino=ALLTRIM(camino.ruta)
*do reindex

*DO FORM forms\acceso WITH ax_parametro
WAIT window
do menus\comercial.mpr
READ events
*return
SET EXCLUSIVE OFF
*/DO case
*	CASE  ax_parametro=1
*		USE data\camino
*		camino  =ALLTRIM(camino.ruta)
*		cami1=ALLTRIM(camino.ruta_act)
*		USE
*		do menus\infogestion_main
		**comercial.mpr
		*DO FORM formmenu
*		READ EVENTS
 
*    CASE  ax_parametro=2
*    	USE data\camino
*		camino  =ALLTRIM(camino.ruta)
*		cami1=ALLTRIM(camino.ruta_act)
*		USE
		*DO administrador.mpr
*		READ events
		
*	OTHERWISE 	
*    	CLOSE ALL 
*    	CLEAR ALL 
*		release all
*    	CANCEL 
    	
    	
*ENDCASE 

* CLEAR EVENTS