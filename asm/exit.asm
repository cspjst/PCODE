        .8086
        .model  tiny
        .code
        org     100h
start:  mov     ax,4C00h        ; AH = 4Ch: DOS "exit", AL = 0: exit code
        int     21h
        end     start
