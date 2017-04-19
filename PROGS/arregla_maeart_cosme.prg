SELE maeart
go top
do while !eof()
*e=len(alltrim(nomart))
*l=atc("X",nomart,1)
e=len(alltrim(nomart))
l=atc(" ",nomart,1)
m.codigo=substr(nomart,1,(l-1))

m.nomart=substr(nomart,l,e)

replace codigo with m.codigo
replace nomart with m.nomart
skip
enddo
