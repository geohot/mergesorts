#!/bin/bash

echo "\n Running the C version"
rm -f a.out && gcc mergesort.c && ./a.out

echo "\n Running the Python version"
python3 mergesort.py

echo "\n Running the haskell version"
rm -f mergesort && ghc mergesort.hs && ./mergesort

echo "\n Running the Rust version"
rm -f mergesort && rustc mergesort.rs && ./mergesort

echo "\n Running the Java version"
rm -f mergesort && javac mergesort.java && java mergesort

echo "\n Running the Javascript version"
node mergesort.js

echo "\n Running the PHP version"
php mergesort.php

echo "\n Running the Scala version"
scala mergesort.scala 

echo "\n Running the C++ version"
rm -f mergesort && g++ -std=c++17 mergesort.cpp && ./a.out

echo "\n Running the Julia version"
julia mergesort.jl

echo "\n Running the Perl version"
perl mergesort.pl

echo "\n Running the Go version"
rm -f mergesort && go build mergesort.go && ./mergesort

echo "\n Running the OCaml version"
rm -f mergesort && ocamlc mergesort.ml -o mergesort && ./mergesort

echo "\n Running the Bash version"
bash mergesort.sh

echo "\n Running the C# version"
csc mergesort.cs && mergesort

echo "\n Running the Kotlin version"
kotlin mergesort.kt -include-runtime -d mergesort.jar && java -jar mergesort

echo "\n Running the Prolog version"
rm -f mergesort && swipl -g main --stand_alone=true -o mergesort -c mergesort.pro && ./mergesort

echo "\n Running the J version"
jconsole mergesort.ijs

echo "\n Running the Scheme version"
scheme --script mergesort.ss

echo "\n Running the Ruby version"
ruby mergesort.rb
