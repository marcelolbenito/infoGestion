&& Corte de control por tres campos
CLEAR
CLOSE DATA
SET SAFETY OFF
DO abrebase
SELE base7
ZAP
SELE base6

SCATTER MEMVAR BLANK
STORE 0 TO m.totc1,m.totc3,m.totc2
GO TOP
SCATTER MEMVAR
STORE item1 TO m.totc1,m.totc3,m.totc2
DO WHILE !EOF()
	SKIP
	IF m.c1=c1
		m.totc1=m.totc1+item1
	ELSE
		DO carga_c1
		DO actual
	ENDIF
	IF m.c2=c2
		m.totc2=m.totc2+item1
	ELSE
		DO carga_c2
		DO actual
	ENDIF
	IF m.c3=c3
		m.totc3=m.totc3+item1
	ELSE
		DO carga_c3
		DO actual
	ENDIF
ENDDO
SELE base7
BROW
&&============================
PROCEDURE carga_c3
	SELE base7
	APPEND BLANK
	REPLACE c1 WITH m.c1
	REPLACE c2 WITH m.c2
	REPLACE c3 WITH m.c3
	REPLACE item1 WITH m.totc3
	SELE base6
	m.totc3=item1
	&&============================
PROCEDURE carga_c2
	DO carga_c3
	SELE base7
	APPEND BLANK
	REPLACE c1 WITH m.c1
	REPLACE c2 WITH m.c2
	REPLACE c3 WITH 999
	REPLACE item1 WITH m.totc2
	SELE base6
	m.totc2=item1
	m.totc3=0
	&&============================
PROCEDURE carga_c1
	DO carga_c2
	SELE base7
	APPEND BLANK
	REPLACE c1 WITH m.c1
	REPLACE c2 WITH  999
	REPLACE c3 WITH 999
	REPLACE item1 WITH m.totc1
	SELE base6
	m.totc1=item1
	m.totc2=0
	m.totc3=0
	&&============================
PROCEDURE actual
	SELE base6
	m.c1=c1
	m.c2=c2
	m.c3=c3
	RETURN
	&&=============================
PROCEDURE abrebase
	IF USED ("base6")
		SELE base6
	ELSE
		SELE 0
		USE base6 ALIAS base6
	ENDIF
	IF USED ("base7")
		SELE base7
	ELSE
		SELE 0
		USE base7 ALIAS base7
	ENDIF

