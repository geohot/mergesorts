#!/bin/bash
rm -f a.out && gcc mergesort.c && ./a.out
python3 mergesort.py
rm -f mergesort && ghc mergesort.hs && ./mergesort
rm -f mergesort && rustc mergesort.rs && ./mergesort
rm -f Mergesort && javac Mergesort.java && java Mergesort
rhino mergesort.js
php mergesort.php
rm -f mergesort && g++ -std=c++17 mergesort.cpp && ./a.out
