*close data
IF used("empresa")
	SELE empresa
ELSE
	SELE 0
	USE camino+"empresa"  alias empresa
ENDIF


IF used("maeprove")
	SELE maeprove
	SET order to codpro
ELSE
	SELE 0
	USE camino+"maeprove" order codpro alias maeprove
ENDIF

replace ALL saldo WITH 0
SCATTER memvar blank

IF used("cab_entrada")
	SELE cab_entrada
ELSE
	SELE 0
	USE camino+"cab_entrada"
ENDIF
SCATTER memvar blank

IF used("cab_opago")
	SELE cab_opago
ELSE
	SELE 0
	USE camino+"cab_opago"
ENDIF
SCATTER memvar blank


	SELE 0
	USE camino+"cta_cte_prove_base" exclu
*ENDIF

SELECT * from cta_cte_prove_base INTO CURSOR cta_cte_prove READWRITE 
INDEX on codpro+DTOS(fecha)tag fecha
INDEX on ALLTRIM(codpro)+ALLTRIM(STR(-1*(nro_opago)))+DTOS(fecha) TAG cod_pro
index ON ALLTRIM(nrofac_pro)+ALLTRIM(codpro)+ALLTRIM(DTOS(fecha)) tag cta_cte 
index ON nro_opago tag nro_opago 




SELECT cta_cte_prove_base
use

SELECT cta_cte_prove










SELE cab_entrada
GO top
DO while !eof()
	SCATTER memvar
	
	SELE cta_cte_prove
		APPEND blank
		GATHER memvar

	SELE cab_entrada
	Skip
ENDDO
SELE cta_cte_prove

SCATTER memvar blank
SELE cab_opago
GO top
DO while !eof()
	SCATTER memvar
	SELE cta_cte_prove
	SET order to nro_opago
	SEEK m.nro_opago
	IF !found()
		APPEND blank
		GATHER memvar
	ENDIF
	SELE cab_opago
	Skip
ENDDO


SELE cta_cte_prove
SET filter to
SET order to cod_pro
REPLACE all saldo_fac with 0
SELE cta_cte_prove

SET order to cod_pro
sal_parci=0
pagado=0
facturado=0
saldo_pro=0
GO top
DO suma_saldo
SCATTER memvar
DO while !eof()
	Skip
	IF (alltrim(m.codpro)=alltrim(codpro))
		DO suma_saldo
	ELSE
		DO actualiza_maestro
		SELE cta_cte_prove
		m.codpro=codpro
		sal_parci=0
		pagado=0
		facturado=0
		saldo_pro=0
		DO suma_saldo
	ENDIF
ENDDO
DO actualiza_maestro
SELE cta_cte_prove
SET order to fecha


* Calcula los saldos por registro
PROCEDURE suma_saldo
pagado=pagado+tot_pag
facturado=facturado+tot_final
sal_parci=(facturado-pagado)
IF  sal_parci > tot_final
	REPLACE saldo_fac with tot_final
ELSE
	IF (facturado-pagado)>0
		REPLACE saldo_fac with (facturado-pagado)
	ELSE
		REPLACE saldo_fac with 0
	ENDIF
ENDIF
saldo_pro= saldo_pro+saldo_fac


* Para actualizar el maestro de proveedores
PROCEDURE actualiza_maestro
SELE maeprove
SET order to codpro
SEEK alltrim(m.codpro)
IF found()
	REPLACE saldo with sal_parci
ENDIF





