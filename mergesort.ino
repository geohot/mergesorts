#include <stdlib.h>

void mergesort(int *arr, int len) {
  if (len == 1) 
    return;
  if (len == 2 && arr[0] > arr[1]) {
    //swap values
    int t = arr[1];
    arr[1] = arr[0];
    arr[0] = t;
  }

  int p = len/2;
  int *arr1 = arr;
  int *arr2 = arr+p;

  mergesort(arr1, p);
  mergesort(arr2, len-p);

  int *t = (int *) malloc(sizeof(int)*len);
  int *rt = t;
  
  while (1) {
    if (arr1 < arr+p && arr2 < arr+len) {
      if (*arr1 <= *arr2) {
        *t = *arr1;
        arr1++;
      } else {
        *t = *arr2;
        arr2++;
      }
    } else if(arr1 < arr+p) {
      *t = *arr1;
      arr1++;
    } else if(arr2 < arr+len) {
      *t = *arr2;
      arr2++;
    } else {
      break;
    }
    t++;
  }

  memcpy(arr, rt, sizeof(int)*len);
  free(rt);
}

void setup() {
  Serial.begin(9600);
}

void loop() {
  int a[] = {5,9,1,3,4,6,6,3,2};
  int len = sizeof(a)/sizeof(int);
  mergesort(a, sizeof(a)/sizeof(int));
  for (int i = 0; i < len; i++) {
    Serial.print(a[i]);
    Serial.print(" ");
  }
  Serial.print("\n");
  delay(1000); // Wait for 1000 millisecond(s)
}
