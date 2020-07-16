#!/bin/bash

echo "Running the C version"
rm -f a.out && gcc mergesort.c && ./a.out

echo "Running the Python version"
python3 mergesort.py

echo "Running the haskell version"
rm -f mergesort && ghc mergesort.hs && ./mergesort

echo "Running the Rust version"
rm -f mergesort && rustc mergesort.rs && ./mergesort

echo "Running the Java version"
rm -f mergesort && javac mergesort.java && java mergesort

echo "Running the Javascript version"
rhino mergesort.js

echo "Running the PHP version"
php mergesort.php

echo "Running the Scala version"
scala mergesort.scala 

echo "Running the C++ version"
rm -f mergesort && g++ -std=c++17 mergesort.cpp && ./a.out

echo "Running the Julia version"
julia mergesort.jl