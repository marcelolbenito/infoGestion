replace all prevta1 with (prevta3*0.7)*1.21*1.2
replace all prevta1 with round(prevta1,2)
replace all prevta1 with round(prevta1,1)
replace all prevta2 with (prevta1*1.11)
replace all costuni with lista_pro*1.04
replace all ut_prevta1 with round((((prevta1/(costuni*1.21))-1)*100),2)
 replace all ut_prevta2 with round((((prevta2/(costuni*1.21))-1)*100),2)
 replace all ut_prevta3 with round((((prevta3/(costuni*1.21))-1)*100),2)
