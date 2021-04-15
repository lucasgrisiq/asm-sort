SECTION .text
    GLOBAL ordena_vetor

ordena_vetor:
    enter 0,0       
    mov ecx,dword[ebp+8]                      ; tamanho do vetor
    mov edx,dword[ebp+12]                     ; endereco do vetor

    push edx
    push ebx                             ; Guarda o valor de ebx que é usado por outras coisas no sistema

    xor eax, eax
    .bubble_sort:
        cmp ecx, 1
        jl .finish
        push ecx                         ; guarda valor de ecx
        .loop:
            mov ecx, dword[ebp+8]              ; pega valor do tamanho
            dec ecx
            cmp eax, ecx                 ; i <= n-1
            jge .recursive_call
            mov ebx, dword[edx+eax*4]      ; vetor[i]
            mov ecx, dword[edx+eax*4+4]    ; vetor[i+1]
            cmp ebx, ecx 
            jg .swap
            inc eax
            jmp .loop

            .swap:
                mov [edx+eax*4], ecx   ; vetor[i] = menor
                mov [edx+eax*4+4], ebx ; vetor[i+1] = maior
                inc eax
                jmp .loop

        .recursive_call:
            pop ecx
            mov eax, 0
            dec ecx
            jmp .bubble_sort


    .finish:
    pop ebx
    pop edx
    mov eax, edx  ; retorna o ponteiro
    leave
    ret
