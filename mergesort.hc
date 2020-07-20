// if you guys have ideas for things to do, let me know. i probably will ignore them
U0 cia(I64 *array, I64 s, I64 m) {
  I64 i, j, n;
  I64 *glow = MAlloc(s * (sizeof I64));

  for (i = 0, j = m, n = 0; n < s; n++) {
    if (j == s) {
      glow[n] = array[i++];

    } else if (i == m) {
      glow[n] = array[j++];

    } else if (array[j] < array[i]) {
      glow[n] = array[j++];

    } else {
      glow[n] = array[i++];
    };
  };

  for (i = 0; i < s; i++) {
    array[i] = glow[i];
  };

  Free(glow);
};

U0 fbi(I64 *array, I64 n) {
  if (n < 2) {
    return;
  };

  I64 m = n / 2;
  fbi(array, m);
  fbi(array + m, n - m);
  cia(array, n, m);
};

I64 array[9] = 5, 9, 1, 3, 4, 6, 6, 3, 2;
I64 len = (sizeof array) / (sizeof I64);
fbi(array, len);

I64 i = 0;
for (; i < len; i++) {
  Print("%d ", array[i]);
};
Print("\n");
