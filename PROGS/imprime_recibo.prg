SELECT  item_recibo.*, libro_ch.codbanco, libro_ch.nro_ch,;
			libro_ch.firmante, libro_ch.fec_ch;
			FROM  item_recibo LEFT OUTER JOIN libro_ch ;
			ON  item_recibo.cod_ch = libro_ch.cod_ch;
			into table item1



		SELECT cab_recibo.nro_recibo, cab_recibo.codcli, Maecli.nomcli,;
			cab_recibo.fecha, cab_recibo.baja, cab_recibo.tot_pag;
			FROM  cab_recibo LEFT OUTER JOIN Maecli ;
			ON  cab_recibo.codcli = Maecli.codcli;
			into table cabrec1

		SELECT item1.nro_recibo, item1.tipo_pago, item1.cod_ch, item1.importe,;
			item1.codbanco, item1.nro_ch, item1.fec_ch,;
			cabrec1.codcli, cabrec1.nomcli, cabrec1.fecha, cabrec1.tot_pag;
			FROM  item1 LEFT OUTER JOIN cabrec1 ;
			ON  item1.nro_recibo = cabrec1.nro_recibo;
			order by item1.nro_recibo;
			into cursor consulta_recibo

		SELE item1
		USE
		ERASE item1.DBF

		SELE cabrec1
		USE
		ERASE cabrec1.DBF
		SELE consulta_recibo
		SET filter to nro_recibo=m.nro_recibo
		REPORT form recibo previ