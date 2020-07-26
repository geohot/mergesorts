#include <stdio.h>

int* merge(int *a, int *b, int s) {
	int *A=a+(s/2), *B=b+(s-s/2), v[s], *V=v+s, *i=v;
	while (i<V) *i++ = (*a <= *b && a!=A || b==B) ? *a++ : *b++;
	while (s--) *--b = *--i; // copy in reverse to original array
	return b;
}

int* mergesort(int *a, int s) {
	if (s == 1) return a;
	return merge(mergesort(a, s/2), mergesort(a+s/2, s-s/2), s);
}

void main() {
	int a[] = {5,9,1,3,4,6,6,3,2}; mergesort(a, 10);
	int i=0; while (i < 9) printf("%d ", a[i++]); printf("\n");
}
