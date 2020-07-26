#include <stdio.h>

int* merge(int *A, int *B, int len) {
	int *array = A, *endA = A+(len/2), *endB = A+len;
	int tmp[len];
	for (int i = 0; i < len; i++)
		if ((*A <= *B && A != endA) || B == endB)
			tmp[i] = *A++;
		else
			tmp[i] = *B++;
	for (int i = 0; i < len; i++)
		array[i] = tmp[i];
	return array;
}

int* mergesort(int *A, int len) {
	if (len == 1)
		return A;
	return merge(mergesort(A, len/2), mergesort(A+len/2, len-len/2), len);
}

int main() {
	int A[] = {5,9,1,3,4,6,6,3,2};
	int len = sizeof(A)/sizeof(int);
	mergesort(A, len);
	for (int i = 0; i < len; i++)
		printf("%d ", A[i]);
	printf("\n");
	return 0;
}
