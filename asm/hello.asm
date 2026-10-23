        .8086
        .model  tiny
        .code
        org     100h
start:  mov     dx,offset msg   ; DS:DX -> the string
        mov     ah,9            ; DOS "print string", ends at '$'
        int     21h
        mov     ax,4C00h
        int     21h

        .data
msg     db      'Hello, world!',13,10,'$'
        end     start
