#!/bin/bash
start=`date +%s`

elapsed_time() {
	if [ "$1" -ge "$2" ]; then elapsed_ns=$(("$1"-"$2")); else elapsed_ns=$(("$2"-"$1")); fi
	echo "Time elapsed : $(($elapsed_ns/1000000000)) s $(($elapsed_ns/1000000 - ($elapsed_ns/1000000000)*1000)) ms"
}

time_format=+%s%N

printf "\nRunning the C version : \n"
version_start=`date $time_format`
rm -f a.out && gcc mergesort.c && ./a.out && rm -f a.out
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Python version : \n"
version_start=`date $time_format`
python3 mergesort.py
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Haskell version : \n"
version_start=`date $time_format`
rm -f mergesort && ghc mergesort.hs && ./mergesort
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Rust version : \n"
version_start=`date $time_format`
rm -f mergesort && rustc mergesort.rs && ./mergesort
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Java version : \n"
version_start=`date $time_format`
rm -f mergesort && javac mergesort.java && java mergesort
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Javascript version : \n"
version_start=`date $time_format`
node mergesort.js
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the PHP version : \n"
version_start=`date $time_format`
php mergesort.php
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Scala version : \n"
version_start=`date $time_format`
scala -nc mergesort.scala
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the C++ version : \n"
version_start=`date $time_format`
g++ -std=c++17 mergesort.cpp && ./a.out && rm -f a.out
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Julia version : \n"
version_start=`date $time_format`
julia mergesort.jl
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Perl version : \n"
version_start=`date $time_format`
perl mergesort.pl
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Go version : \n"
version_start=`date $time_format`
rm -f mergesort && go build mergesort.go && ./mergesort
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the OCaml version : \n"
version_start=`date $time_format`
rm -f mergesort && ocamlc mergesort.ml -o mergesort && ./mergesort
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Bash version : \n"
version_start=`date $time_format`
bash mergesort.sh
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the C# version : \n"
version_start=`date $time_format`
mcs -out:mergesort.exe mergesort.cs && mono mergesort.exe
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Kotlin version : \n"
version_start=`date $time_format`
kotlinc mergesort.kt -include-runtime -d mergesort.jar && java -jar mergesort.jar
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Prolog version : \n"
version_start=`date $time_format`
rm -f mergesort && swipl -g main --stand_alone=true -o mergesort -c mergesort.pro && ./mergesort
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the J version : \n"
version_start=`date $time_format`
ijconsole mergesort.ijs
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Scheme version : \n"
version_start=`date $time_format`
scheme --script mergesort.ss
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Ruby version : \n"
version_start=`date $time_format`
ruby mergesort.rb
version_end=`date $time_format`
printf "\n"; elapsed_time "$version_start" "$version_end"

printf "\nRunning the R version : \n"
version_start=`date $time_format`
Rscript mergesort.r
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Elixir version : \n"
version_start=`date $time_format`
elixir mergesort.exs
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Dart Version : \n"
version_start=`date $time_format`
dart mergesort.dart
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Coq Version : \n"
version_start=`date $time_format`
coqc mergesort.v
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the LUA Version : \n"
version_start=`date $time_format`
lua5.3 mergesort.lua
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the TypeScript version : \n"
version_start=`date $time_format`
tsc mergesort.ts --outDir out && node mergesort.js
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Coffeescript version : \n"
version_start=`date $time_format`
coffee mergesort.coffee
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Swift version : \n"
version_start=`date $time_format`
swift mergesort.swift
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the F# version : \n"
version_start=`date $time_format`
dotnet fsi mergesort.fsx
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the ATS version : \n"
version_start=`date $time_format`
myatscc mergesort.dats && ./mergesort_dats
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the D Lang version : \n"
version_start=`date $time_format`
rdmd mergesort.d
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Brainfuck version : \n"
version_start=`date $time_format`
bf mergesort.b
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the TCL version : \n"
version_start=`date $time_format`
tclsh mergesort.tcl
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

printf "\nRunning the Objective C version : \n"
version_start=`date $time_format`
clang -fobjc-arc -framework Foundation mergesort.m -o mergesort && ./mergesort
version_end=`date $time_format`
elapsed_time "$version_start" "$version_end"

end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
