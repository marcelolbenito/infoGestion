
WITH _SCREEN
	.CAPTION="Sistema de Gestion Comercial"
	.ICON="crdfle10.ico"
    .picture="c:\myc_gestion\Logo Sistema.jpg"
	.autocenter=.t.
	*.backcolor=16711680
	.borderstyle=0
	.windowstate=2
	.closable=.t.
	.controlbox=.f.
ENDWITH
do seteo
*do form formmenu
 do reindex
set sysmenu to
do comercial.mpr
read event
set sysmenu to defa
_screen.backcolor=16777215