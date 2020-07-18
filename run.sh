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
rm -f Mergesort && javac Mergesort.java && java Mergesort

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

echo "Running the Perl version"
perl mergesort.pl

echo "Running the Go version"
rm -f mergesort && go build mergesort.go && ./mergesort

echo "Running the OCaml version"
rm -f mergesort && ocamlc mergesort.ml -o mergesort && ./mergesort

echo "Running the Ruby version"
ruby mergesort.rb