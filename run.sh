#!/bin/bash
rm -f a.out && gcc mergesort.c && ./a.out
python3 mergesort.py
rm -f mergesort && ghc mergesort.hs && ./mergesort
rm -f mergesort && rustc mergesort.rs && ./mergesort
rm -f mergesort && javac mergesort.java && java mergesort
rhino mergesort.js
php mergesort.php
