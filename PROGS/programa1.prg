IF USED("item_entrada")
		SELE item_entrada
		SET ORDER TO nrofac_pro
	ELSE
		SELE 0
		USE camino+"item_entrada" ORDER nrofac_pro
	ENDIF

	IF USED("cab_entrada")
		SELE cab_entrada
		SET ORDER TO nrofac_pro
	ELSE
		SELE 0
		USE camino+"cab_entrada" ORDER nrofac_pro
	ENDIF
	IF USED("empresa")
		SELE empresa

	ELSE
		SELE 0
		USE camino+"empresa" ALIAS empresa
	ENDIF

	IF USED("maeart")
		SELE maeart
		SET ORDER TO codart
	ELSE
		SELE 0
		USE camino+"maeart" ORDER codart
	ENDIF

	IF USED("maeprove")
		SELE maeprove
		SET ORDER TO codpro
	ELSE
		SELE 0
		USE camino+"maeprove" ORDER codpro
	ENDIF
	SCATTER memvar blank
	SELECT item_entrada.nrofac_pro, item_entrada.codart,;
		maeart.nomart, item_entrada.cant, item_entrada.costuni;
		FROM  item_entrada inner JOIN maeart ;
		ON  item_entrada.codart = maeart.codart;
		ORDER BY item_entrada.nrofac_pro;
		INTO TABLE tabla_item_entrada.DBF
		

	SELECT cab_entrada.nrofac_pro, cab_entrada.codpro, maeprove.nompro,;
		cab_entrada.fecha, cab_entrada.tot;
		FROM  cab_entrada inner JOIN maeprove ;
		ON  cab_entrada.codpro = maeprove.codpro;
		INTO TABLE tabla_entrada.DBF

	SELECT *;
		FROM  tabla_item_entrada inner JOIN tabla_entrada ;
		ON  tabla_item_entrada.nrofac_pro = tabla_entrada.nrofac_pro;
		ORDER BY tabla_item_entrada.nrofac_pro;
		INTO CURSOR consulta_entrada



	SELE tabla_entrada
	USE
	ERASE tabla_entrada.DBF

	SELE tabla_item_entrada
	USE
	ERASE tabla_item_entrada.DBF

	SELE consulta_entrada
	SET FILTER TO alltrim(nrofac_pro_a)=alltrim(m.nrofac_pro) and alltrim(codpro)=alltrim(m.codpro)
	
	i=1
	*FOR i=1 to 2
		REPORT FORM factura_entrada previ
		
		*to print noconsole
	*	i=i+1
	*ENDFOR
	SET FILTER TO


			
		
