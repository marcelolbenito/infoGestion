SELECT maecli
GO top
j=1
DO WHILE !EOF()

m.codcli=STR(j)
*WAIT WINDOW m.codcli

	largo=len(alltrim(m.codcli))
	IF largo < 5
		faltan=5-largo
		FOR i=1 to faltan
			m.codcli="0"+ALLTRIM(m.codcli)
		ENDFOR
	ENDIF
replace maecli.codcli WITH m.codcli	
*WAIT WINDOW m.codcli

SKIP
j=j+1
*cancel
enddo
	