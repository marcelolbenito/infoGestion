SELECT movbanco.*,maebanco.descbanco;
	FROM  movbanco inner JOIN maebanco ;
	ON  movbanco.codbanco= maebanco.codbanco;
	INTO cursor mov1
	
	
SELECT mov1.*,ctasbanco.tipocta,ctasbanco.nrocta;
from mov1 INNER JOIN ctasbanco;
on mov1.codcuenta=ctasbanco.codcuenta;
ORDER BY mov1.codbanco,mov1.codcuenta;
INTO CURSOR mov2

brow	