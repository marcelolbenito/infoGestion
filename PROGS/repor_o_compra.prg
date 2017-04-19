 IF USED("item_pedidos_sal")
            SELE item_pedidos_sal
            SET ORDER TO nroped_s
        ELSE
            SELE 0
            USE camino+"item_pedidos_sal" ORDER nroped_s
        ENDIF

        IF USED("pedidos_sal")
            SELE pedidos_sal
            SET ORDER TO nroped_s
        ELSE
            SELE 0
            USE camino+"pedidos_sal" ORDER nroped_s
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

        SELECT item_pedidos_sal.nroped_s, item_pedidos_sal.codart,;
            maeart.nomart, item_pedidos_sal.cant, item_pedidos_sal.costuni;
            FROM  item_pedidos_sal inner JOIN maeart ;
            ON  item_pedidos_sal.codart = maeart.codart;
            ORDER BY item_pedidos_sal.nroped_s;
            INTO TABLE tabla_item.DBF


        SELECT pedidos_sal.nroped_s, pedidos_sal.codpro, maeprove.nompro,;
            pedidos_sal.fecha, pedidos_sal.tot,pedidos_sal.tot_final;
            FROM  pedidos_sal inner JOIN maeprove ;
            ON  alltrim(pedidos_sal.codpro) = alltrim(maeprove.codpro);
            INTO TABLE tabla2.DBF

        SELECT *;
            FROM  tabla_item inner JOIN tabla2 ;
            ON  tabla_item.nroped_s = tabla2.nroped_s;
            ORDER BY tabla_item.nroped_s;
            INTO CURSOR consulta

        SELE tabla2
        USE
        ERASE tabla2.DBF

        SELE tabla_item
        USE
        ERASE tabla_item.DBF

        SELE consulta
       * SET FILTER TO alltrim(str(nroped_s_a))=alltrim(str(m.nroped_s))

       * REPORT FORM orden_compra PREVI
    