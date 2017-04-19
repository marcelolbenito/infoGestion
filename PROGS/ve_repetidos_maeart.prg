close data
SELE 0
USE camino+"maeart" order codart

sele 0
use dupli exclu
zap
SELE maeart
GO top
SCATTER memvar
DO while !eof()
	skip
	IF m.codart=maeart.codart

		SELE dupli
		APPEND blank
		GATHER memvar
		SELE maeart
	ENDIF
sele maeart	
	SCATTER memvar
ENDDO
sele dupli 
brow
