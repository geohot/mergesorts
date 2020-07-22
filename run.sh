#!/bin/bash
start=`date +%s`

echo -e "\e[90mRunning the C version : "
rm -f a.out && gcc mergesort.c && ./a.out && rm -f a.out

echo -e "\e[34mRunning the Python version : "
python3 mergesort.py

echo -e "\e[37mRunning the Haskell version : "
rm -f mergesort && ghc mergesort.hs && ./mergesort

echo -e "\e[91mRunning the Rust version : "
rm -f mergesort && rustc mergesort.rs && ./mergesort

echo -e "\e[31mRunning the Java version : "
rm -f mergesort && javac mergesort.java && java mergesort

echo -e "\e[33mRunning the JavaScript version : "
node mergesort.js

echo -e "\e[35mRunning the PHP version : "
php mergesort.php

echo -e "\e[91mRunning the Scala version : "
scala -nc mergesort.scala

echo -e "\e[95mRunning the C++ version : "
g++ -std=c++17 mergesort.cpp && ./a.out && rm -f a.out

echo -e "\e[34mRunning the Julia version : "
julia mergesort.jl

echo -e "\e[35mRunning the Perl version : "
perl mergesort.pl

echo -e "\e[94mRunning the Go version : "
rm -f mergesort && go build mergesort.go && ./mergesort

echo -e "\e[37mRunning the OCaml version : "
rm -f mergesort && ocamlc mergesort.ml -o mergesort && ./mergesort

echo -e "\e[34mRunning the Bash version : "
bash mergesort.sh

echo -e "\e[92mRunning the C# version : "
mcs -out:mergesort.exe mergesort.cs && mono mergesort.exe

echo -e "\e[93mRunning the Kotlin version : "
kotlinc mergesort.kt -include-runtime -d mergesort.jar && java -jar mergesort.jar

echo -e "\e[37mRunning the Prolog version : "
rm -f mergesort && swipl -g main --stand_alone=true -o mergesort -c mergesort.pro && ./mergesort

echo -e "\e[37mRunning the J version : "
ijconsole mergesort.ijs

echo -e "\e[93mRunning the Scheme version : "
scheme --script mergesort.ss

echo -e "\e[91mRunning the Ruby version : "
ruby mergesort.rb

echo -e "\e[34mRunning the R version : "
Rscript mergesort.r 

echo -e "\e[95mRunning the Elixir version : "
elixir mergesort.exs

echo -e "\e[96mRunning the Dart version : "
dart mergesort.dart

echo -e "\e[37mRunning the Coq version : "
coqc mergesort.v

echo -e "\e[95mRunning the LUA version : "
lua5.3 mergesort.lua

echo -e "\e[36mRunning the TypeScript version : "
tsc mergesort.ts --outDir out && node mergesort.js

echo -e "\e[91mRunning the CoffeeScript version : "
coffee mergesort.coffee

echo -e "\e[93mRunning the Swift version : "
swift mergesort.swift

echo -e "\e[32mRunning the F# version : "
dotnet fsi mergesort.fsx

echo -e "\e[37mRunning the ATS version : "
myatscc mergesort.dats && ./mergesort_dats

echo -e "\e[36mRunning the D Lang version : "
rdmd mergesort.d

echo -e "\e[90mRunning the Brainfuck version : "
bf mergesort.b

echo -e "\e[94mRunning the TCL version : "
tclsh mergesort.tcl

echo -e "\e[32mRunning the Objective C version : "
clang -fobjc-arc -framework Foundation mergesort.m -o mergesort && ./mergesort

echo -e "\e[34mRunning the Ada version : "
rm -f mergesort.ali mergesort.o mergesort && gnatmake mergesort.adb && ./mergesort && rm -f mergesort.ali mergesort.o mergesort

end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
