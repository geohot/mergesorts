#!/bin/bash
start=`date +%s`

printf "\nRunning the C version : \n"
rm -f a.out && gcc mergesort.c && ./a.out

printf "\nRunning the Python version : \n"
python3 mergesort.py

printf "\nRunning the Haskell version : \n"
rm -f mergesort && ghc mergesort.hs && ./mergesort

printf "\nRunning the Rust version : \n"
rm -f mergesort && rustc mergesort.rs && ./mergesort

printf "\nRunning the Java version : \n"
rm -f mergesort && javac mergesort.java && java mergesort

printf "\nRunning the Javascript version : \n"
node mergesort.js

printf "\nRunning the PHP version : \n"
php mergesort.php

printf "\nRunning the Scala version : \n"
scala mergesort.scala 

printf "\nRunning the C++ version : \n"
rm -f mergesort && g++ -std=c++17 mergesort.cpp && ./a.out

printf "\nRunning the Julia version : \n"
julia mergesort.jl

printf "\nRunning the Perl version : \n"
perl mergesort.pl

printf "\nRunning the Go version : \n"
rm -f mergesort && go build mergesort.go && ./mergesort

printf "\nRunning the OCaml version : \n"
rm -f mergesort && ocamlc mergesort.ml -o mergesort && ./mergesort

printf "\nRunning the Bash version : \n"
bash mergesort.sh

printf "\nRunning the C# version : \n"
mcs -out:mergesort.exe mergesort.cs && mono mergesort.exe

printf "\nRunning the Kotlin version : \n"
kotlin mergesort.kt -include-runtime -d mergesort.jar && java -jar mergesort

printf "\nRunning the Prolog version : \n"
rm -f mergesort && swipl -g main --stand_alone=true -o mergesort -c mergesort.pro && ./mergesort

printf "\nRunning the J version : \n" 
ijconsole mergesort.ijs

printf "\nRunning the Scheme version : \n"
scheme --script mergesort.ss

printf "\nRunning the Ruby version : \n"
ruby mergesort.rb

printf "\nRunning the R version : \n"
Rscript mergesort.r

printf "\nRunning the Elixir version : \n"
elixir mergesort.exs

printf "\nRunning the Dart Version : \n"
dart mergesort.dart

printf "\nRunning the Coq Version : \n"
coqc mergesort.v

printf "\nRunning the LUA Version : \n"
lua5.3 mergesort.lua

printf "\nRunning the Swift Version : \n"
swift mergesort.swift

end=`date +%s`
runtime=$((end-start))
echo "$runtime"
