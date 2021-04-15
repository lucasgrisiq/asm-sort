#include <stdio.h>

extern int* ordena_vetor(int, int*);

int main(){
    int vetor[10];
    int *vetor_ordenado;
    int size = 0;

    while(size < 1 || size > 10){
        printf("Digite o tamanho do vetor (1 a 10): ");
        scanf("%d", &size);
    }

    for(int i=0; i<size; i++){
        printf("[%d] = ", i+1);
        scanf("%d", &vetor[i]);
    }

    vetor_ordenado = ordena_vetor(size, vetor);
    printf("Ordenando vetor...\n\n");

    printf("Vetor ordenado:\n");
    for(int i=0; i<size; i++){
        printf("[%d] = %d \n", i, vetor_ordenado[i]);
    }

    return 0;
}
