CLOSE DATABASES ALL 
SET EXCLUSIVE ON

IF used("empresa")
	SELE empresa
ELSE
	SELE 0
	USE camino+"empresa"  alias empresa
ENDIF


IF used("maecli")
	SELE maecli
	SET order to codcli
ELSE
	SELE 0
	USE camino+"maecli" order codcli alias maecli

ENDIF
REPLACE ALL saldocli WITH 0
SCATTER memvar blank

IF used("facturas")
	SELE facturas
ELSE
	SELE 0
	USE camino+"facturas"
ENDIF
SCATTER memvar blank

SET filter to 

IF used("cab_recibo")
	SELE cab_recibo
ELSE
	SELE 0
	USE camino+"cab_recibo"
ENDIF
SCATTER memvar blank

*IF used("cta_cte_cliente")
*	SELE cta_cte_cliente
*ELSE
	SELE 0
	USE camino+"cta_cte_cliente_base" exclu
*ENDIF

SELECT * from cta_cte_cliente_base INTO CURSOR cta_cte_cliente READWRITE 

INDEX on (ALLTRIM(nrofac)+ALLTRIM(codcli)+ALLTRIM(DTOS(fecha))) TAG cta_cte
index ON (ALLTRIM(codcli)+ALLTRIM(STR(-1*(nro_recibo)))+DTOS(fecha)) tag cod_cli 
index ON nro_recibo tag nro_recibo 




SELECT cta_cte_cliente_base
use

SELECT cta_cte_cliente



*SCATTER memvar blank
*ZAP

SELE facturas

SET FILTER TO tipo="NC" OR (tipo="RE" AND condvta="2")or tipo="AD" OR (tipo="FC" AND condvta="2")
*row
*SET FILTER TO tipo<>"PR"
GO top
DO while !eof()
	SCATTER memvar
	SELE cta_cte_cliente
		SET order to cta_cte
	*	SEEK (ALLTRIM(m.nrofac)+ALLTRIM(m.codcli)+alltrim(DTOS(m.fecha)))
	*	IF !found()
	APPEND blank
	GATHER memvar
	*	ENDIF
	SELE facturas
	Skip
ENDDO
SCATTER memvar blank



SELE cab_recibo
GO top
DO while !eof()
	SCATTER memvar
	SELE cta_cte_cliente
	SET order to nro_recibo
	SEEK m.nro_recibo
	IF !found()
		APPEND blank
		GATHER memvar
	ENDIF
	SELE cab_recibo
	Skip
ENDDO
SELE cta_cte_cliente

*SET filter to
SET order to cod_cli
REPLACE all saldo_fac with 0
SELE cta_cte_cliente


sal_parci=0
pagado=0
facturado=0
saldo_pro=0
GO top
DO suma_saldo
SCATTER memvar
DO while !eof()
	Skip
	IF  alltrim(m.codcli)=alltrim(codcli)
		DO suma_saldo
	ELSE
		DO actualiza_maestro
		SELE cta_cte_cliente
		m.codcli=codcli
		sal_parci=0
		pagado=0
		facturado=0
		saldo_pro=0
		DO suma_saldo
	ENDIF

ENDDO
DO actualiza_maestro
SELE facturas
SET filter TO tipo<>"PR"
SELE cta_cte_cliente
SET order to cod_cli
GO top
DO while !eof()	
	SCATTER memvar
	SELE maecli
	SEEK m.codcli
	IF found()
	scatter memvar
	endif
	sele cta_cte_cliente
		REPLACE cta_cte_cliente.zona with m.zona
	Skip
ENDDO

SELE cta_cte_cliente

set order to 
 SELECT facturas
 SET FILTER TO 
 



* Calcula los saldos por registro
PROCEDURE suma_saldo
pagado=pagado+tot_pag
facturado=facturado+tot
sal_parci=(facturado-pagado)
IF  sal_parci > tot
	REPLACE saldo_fac with tot
ELSE
	IF (facturado-pagado)>0
		REPLACE saldo_fac with (facturado-pagado)
	ELSE

		REPLACE saldo_fac with 0
	ENDIF
ENDIF
saldo_pro= saldo_pro+saldo_fac


* Para actualizar el maestro de clientes
PROCEDURE actualiza_maestro
SELE maecli
SET order to codcli
SEEK alltrim(m.codcli)
IF found()
	REPLACE saldocli with sal_parci
	*brow
ENDIF



