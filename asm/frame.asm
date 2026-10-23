        .8086
        .model  tiny
        .code
        org     100h

; int x = 5; x += 37; exit(x);

start:
; ENTER                 build the frame: one variable, x at [bp-2]
        push    bp
        mov     bp,sp
        sub     sp,2

; PUSH 5
        mov     ax,5            ; the 8086 has no push immediate
        push    ax

; POP x
        pop     word ptr [bp-2]

; PUSH x
        push    word ptr [bp-2]

; PUSH 37
        mov     ax,37
        push    ax

; ADD                   a b -> a+b
        pop     bx              ; b
        pop     ax              ; a
        add     ax,bx
        push    ax

; POP x
        pop     word ptr [bp-2]

; PUSH x
        push    word ptr [bp-2]

; EXIT                  pop the exit code, tear down, back to DOS
        pop     ax
        mov     sp,bp
        pop     bp
        mov     ah,4Ch          ; AL = exit code
        int     21h

        end     start
