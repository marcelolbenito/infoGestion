** Busca en una tabla y muestra los valores en una grid
** para elegirlos
PARAMETERS m.busco

IF used("tabconsu")
	SELE tabconsu
	SET order to clave
ELSE
	SELE 0
	USE camino+"tabconsu" order clave
ENDIF

SELE tabconsu
SEEK alltrim(m.busco)
IF found()
	SCATTER memvar
	Base=alltrim(m.tabla)
	indi=alltrim(m.orden)
	abro= "use"+" "+m.tabla+" "+"order"+" "+m.orden
	IF used("&base")
		SELE &base
		SET order to &indi
	ELSE
		SELE 0
		&abro
	ENDIF
	DO FORM consulta with "D"
ELSE
    CTEXTO = "NO EXISTE AYUDA PARA ESTE CAMPO"
	NTIPO = 48
	CTEXTOBARRA = "Error"
	MESSAGEBOX(CTEXTO, NTIPO, CTEXTOBARRA)
	
ENDIF
