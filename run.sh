#!/bin/bash
rm -f a.out && gcc mergesort.c && ./a.out
python3 mergesort.py
rm -f mergesort && ghc mergesort.hs && ./mergesort
rm -f mergesort && rustc mergesort.rs && ./mergesort
rhino mergesort.js
rm -f MergeSort.class && javac mergesort.java && java MergeSort 
