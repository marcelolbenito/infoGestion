
SELECT stockdeposito18072011
GO top
DO WHILE !EOF()
SCATTER memvar

            largo=len(alltrim(m.codart))
			IF largo < 5
				faltan=5-largo
				FOR i=1 to faltan
					m.codart="0"+alltrim(m.codart)
				ENDFOR
			ENDIF
	replace codart WITH m.codart		
SKIP
ENDDO
			
			