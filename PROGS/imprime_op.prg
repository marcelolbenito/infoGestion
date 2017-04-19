		SELECT  item_opago.*, libro_ch.codbanco, libro_ch.nro_ch,;
			libro_ch.firmante, libro_ch.fec_ch;
			FROM  item_opago LEFT OUTER JOIN libro_ch ;
			ON  item_opago.cod_ch = libro_ch.cod_ch;
			into table item1


		SELECT cab_opago.nro_opago, cab_opago.codpro, Maeprove.nompro,;
			cab_opago.fecha, cab_opago.baja, cab_opago.tot_pag;
			FROM  cab_opago LEFT OUTER JOIN Maeprove ;
			ON  cab_opago.codpro = Maeprove.codpro;
			into table cabop1

		SELECT item1.nro_opago, item1.tipo_pago, item1.cod_ch, item1.importe,;
			item1.codbanco, item1.nro_ch, item1.fec_ch, cabop1.nro_opago,;
			cabop1.codpro, cabop1.nompro, cabop1.fecha, cabop1.tot_pag;
			FROM  item1 LEFT OUTER JOIN cabop1 ;
			ON  item1.nro_opago = cabop1.nro_opago;
			order by item1.nro_opago;
			into cursor consulta_op

		SELE item1
		USE
		ERASE item1.DBF

		SELE cabop1
		USE
		ERASE cabop1.DBF
		SELE consulta_op
		SET filter to nro_opago_a=2
		REPORT form orden_pago previ
