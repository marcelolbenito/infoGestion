sele maeart
go top
do while !eof()
if costuni <> 0
replace  ut_prevta1 with round((((prevta1/(costuni*1.21))-1)*100),2)
replace  ut_prevta2 with round((((prevta2/(costuni*1.21))-1)*100),2)
replace  ut_prevta3 with round((((prevta3/(costuni*1.21))-1)*100),2)
else
replace ut_prevta1 with 0
replace ut_prevta2 with 0
replace ut_prevta3 with 0
endif
skip
enddo