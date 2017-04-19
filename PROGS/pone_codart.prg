sele COSME_OK
set filter to
go top
i=2852
do while !eof()


replace COSME_OK.codart with alltrim(str(i))


i=i+1
skip
enddo