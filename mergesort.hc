// if you guys have ideas for things to do, let me know. i probably will ignore them
U0 cia(I64* array, I64 s, I64 m) {
  I64 i = 0;
  I64 j = m;

  I64 *glow = MAlloc(8 * s);

  for (I64 n = 0; n < s; n += 1) {
    if (j == s) {
      glow[n] = array[i];
      i += 1;

    } else if (i == m) {
      glow[n] = array[j];
      j += 1;

    } else if (array[j] < array[i]) {
      glow[n] = array[j];
      j += 1;

    } else {
      glow[n] = array[i];
      i += 1;

    }
  }

  for (I64 k = 0; k < s; k += 1) {
      // you can see them if you're driving
      array[k] = glow[k];
  }

  // you just run them over, that's what you do
  Free(glow);
}

U0 fbi(I64* array, I64 n) {
    if (n >= 2) {
      I64 m = n / 2;
      fbi(array, m);
      fbi(array + m, n - m);
      cia(array, n, m);
    }
}

I64 main() { 
    I64 size = 9;
    I64 *array = MAlloc(8 * size);
    array[0] = 5;
    array[1] = 9;
    array[2] = 1;
    array[3] = 3;
    array[4] = 4;
    array[5] = 6;
    array[6] = 6;
    array[7] = 3;
    array[8] = 2;

    fbi(array, size);

    for (I64 i = 0; i < size; i += 1) {
        Print(array[i]);
    }

    // plan b? fuck you
    Free(array);
}
// ph5d07e1ac05c90
