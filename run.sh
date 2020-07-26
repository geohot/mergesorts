#!/bin/bash
start=`date +%s`


elapsed_time() {
	if [ "$1" -ge "$2" ]; then elapsed_ns=$(("$1"-"$2")); else elapsed_ns=$(("$2"-"$1")); fi
	echo "Time elapsed : $(($elapsed_ns/1000000000)) s $(($elapsed_ns/1000000 - ($elapsed_ns/1000000000)*1000)) ms"
}

run_lang() {
	time_format=+%s%N
	if [ "$1" = "" ]; then language="UNSPECIFIED"; else language="$1"; fi
	printf "\nRunning the $language version : \n"
	version_start=`date $time_format`
	eval " $2 "
	version_end=`date $time_format`
	elapsed_time "$version_start" "$version_end"
}


#run_lang "language name" "command to execute"

run_lang C "rm -f a.out && gcc mergesort.c && ./a.out && rm -f a.out"

run_lang Python "python3 mergesort.py"

run_lang Haskell "rm -f mergesort && ghc mergesort.hs && ./mergesort"

run_lang Rust "rm -f mergesort && rustc mergesort.rs && ./mergesort"

run_lang Java "rm -f mergesort && javac mergesort.java && java mergesort"

run_lang Javascript "node mergesort.js"

run_lang PHP "php mergesort.php"

run_lang Scala "scala -nc mergesort.scala"

run_lang C++ "g++ -std=c++17 mergesort.cpp && ./a.out && rm -f a.out"

run_lang Julia "julia mergesort.jl"

run_lang Perl "perl mergesort.pl"

run_lang Go "rm -f mergesort && go build mergesort.go && ./mergesort"

run_lang OCaml "rm -f mergesort && ocamlc mergesort.ml -o mergesort && ./mergesort"

run_lang Bash "bash mergesort.sh"

run_lang C# "mcs -out:mergesort.exe mergesort.cs && mono mergesort.exe"

run_lang Kotlin "kotlinc mergesort.kt -include-runtime -d mergesort.jar && java -jar mergesort.jar"

run_lang Prolog "rm -f mergesort && swipl -g main --stand_alone=true -o mergesort -c mergesort.pro && ./mergesort"

run_lang J "ijconsole mergesort.ijs"

run_lang Scheme "scheme --script mergesort.ss"

run_lang Ruby "ruby mergesort.rb"

run_lang R "Rscript mergesort.r"

run_lang Elixir "elixir mergesort.exs"

run_lang Dart "dart mergesort.dart"

run_lang HolyC "~/.cargo/bin/hcc mergesort.hc -o glow && ./glow"

run_lang Swift "swift mergesort.swift"

run_lang Coq "coqc mergesort.v"

run_lang LUA "lua5.3 mergesort.lua"

run_lang TypeScript "tsc mergesort.ts --outDir out && node mergesort.js"

run_lang Coffeescript "coffee mergesort.coffee"

run_lang Swift "swift mergesort.swift"

run_lang F# "dotnet fsi mergesort.fsx"

run_lang ATS "myatscc mergesort.dats && ./mergesort_dats"

run_lang D "rdmd mergesort.d"

run_lang Brainfuck "bf mergesort.b"

run_lang TCL "tclsh mergesort.tcl"

run_lang Objective-C  "clang -fobjc-arc -framework Foundation mergesort.m -o mergesort && ./mergesort"

run_lang Ada "rm -f mergesort.ali mergesort.o mergesort && gnatmake mergesort.adb && ./mergesort && rm -f mergesort.ali mergesort.o mergesort"

run_lang Pascal "rm -f mergesort mergesort.o && fpc mergesort.pas &> /dev/null && ./mergesort && rm -f mergesort.o mergesort"

end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
