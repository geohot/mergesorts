#!/bin/bash

printf "\n Running the C version"
rm -f a.out && gcc mergesort.c && ./a.out

printf "\n Running the Python version"
python3 mergesort.py

printf "\n Running the haskell version"
rm -f mergesort && ghc mergesort.hs && ./mergesort

printf "\n Running the Rust version"
rm -f mergesort && rustc mergesort.rs && ./mergesort

printf "\n Running the Java version"
rm -f mergesort && javac mergesort.java && java mergesort

printf "\n Running the Javascript version"
node mergesort.js

printf "\n Running the PHP version"
php mergesort.php

printf "\n Running the Scala version"
scala mergesort.scala 

printf "\n Running the C++ version"
rm -f mergesort && g++ -std=c++17 mergesort.cpp && ./a.out

printf "\n Running the Julia version"
julia mergesort.jl

printf "\n Running the Perl version"
perl mergesort.pl

printf "\n Running the Go version"
rm -f mergesort && go build mergesort.go && ./mergesort

printf "\n Running the OCaml version"
rm -f mergesort && ocamlc mergesort.ml -o mergesort && ./mergesort

printf "\n Running the Bash version"
bash mergesort.sh

printf "\n Running the C# version"
csc mergesort.cs && mergesort

printf "\n Running the Kotlin version"
kotlin mergesort.kt -include-runtime -d mergesort.jar && java -jar mergesort

printf "\n Running the Prolog version"
rm -f mergesort && swipl -g main --stand_alone=true -o mergesort -c mergesort.pro && ./mergesort

printf "\n Running the J version"
jconsole mergesort.ijs

printf "\n Running the Scheme version"
scheme --script mergesort.ss

printf "\n Running the Ruby version"
ruby mergesort.rb

printf "Running the R version"
Rscript mergesort.r
