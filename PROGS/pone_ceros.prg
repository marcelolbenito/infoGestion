SELE COSME_OK
GO top
DO while !eof()
	SCATTER memvar
	largo=len(alltrim(m.codart))
	IF largo < 5
		faltan=5-largo
		FOR i=1 to faltan
			m.codart="0"+alltrim(m.codart)
			
	ENDFOR
	replace codart with m.codart
	*	GATHER memvar
	ENDIF
	Skip
ENDDO
