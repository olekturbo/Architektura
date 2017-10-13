#include <stdio.h>

int main(void){
 
 // SPRAWDZENIE
 
 
   // (101)1 (101)0 0001 0011 - 2
   // int x=0xBA13;
   
   //(101)0 0(101) (101)(1 01)11 -4
   int x=0xA5B7;
    int y;
 
  asm volatile (
        ".intel_syntax noprefix;"
        
        
        "mov eax,%1;" //przypisuje x do eax
        "xor ebx,ebx;" //zeruje ebx
        "xor ecx,ecx;" //zeruje ecx
       
"petla:"
        "mov ecx,eax;" //przypisuje eax do ecx
        "and ecx,7;" //koniunkcja na odpowiadajacych sobie bitach (w tym przypadku trzech)
        "cmp ecx,5;" //porownuje ze soba ecx i 101
        "jnz skok;" //skok, jesli sa rozne
        "inc ebx;" //inkrementacja ebx jesli ecx == 101
"skok:"
        "shr eax,1;" //przesuniecie eax o 1 bit w prawo 
        "jnz petla;"
     
        "mov %0,ebx;"      
        
                
        ".att_syntax prefix;"          
        :"=r" (y)              
        :"r" (x)               
        :"eax","ebx","ecx"
 
  );
 
  printf("\nx = %X\ny = %d\n\n",x,y); //wydruk
 
  return 0;
}
