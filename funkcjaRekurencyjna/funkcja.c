#include <stdio.h>
#include <stdlib.h>

int rek(int n, int m) {
	if(n == 0) return m+1;
	else if(n==1) return m;
	else if(n==2) return m+2;
	else return rek(n-1,m)-2*rek(n-2,m+1)-rek(n-3,m);
}

int main(int argc, char *argv[]){
	if(argc != 3) 
		printf("Poprawne wywolanie: ./funkcja n m\n");
	else {
	int n = atoi(argv[1]);
	int m = atoi(argv[2]);
	printf("%d\n", rek(n,m));
  }
}
