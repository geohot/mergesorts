#!/bin/bash
start=`date +%s`


declare -a command_storage

elapsed_time() {
	if [ "$1" -ge "$2" ]; then elapsed_ns=$(("$1"-"$2")); else elapsed_ns=$(("$2"-"$1")); fi
	echo "Time elapsed : $(($elapsed_ns/1000000000)) s $(($elapsed_ns/1000000 - ($elapsed_ns/1000000000)*1000)) ms"
}

run_all_commands() {
	time_format=+%s%N
	local -n commands=$1
	for command in "${commands[@]}"
	do
		language_name=$(echo $command | cut -d '_' -f 2)
		printf "\nRunning the $language_name version : \n"
		version_start=`date $time_format`
		${command}
		version_end=`date $time_format`
		if [ "$language_name" = "Ruby" ]; then printf "\n"; fi
		elapsed_time "$version_start" "$version_end"
	done
}

run_C() {
	rm -f a.out && gcc mergesort.c && ./a.out && rm -f a.out
}; command_storage+=(run_C)

run_Python() {
	python3 mergesort.py
}; command_storage+=(run_Python)

run_Haskell() {
	rm -f mergesort && ghc mergesort.hs && ./mergesort
}; command_storage+=(run_Haskell)

run_Rust() {
	rm -f mergesort && rustc mergesort.rs && ./mergesort
}; command_storage+=(run_Rust)

run_Java() {
	rm -f mergesort && javac mergesort.java && java mergesort
}; command_storage+=(run_Java)

run_Javascript() {
	node mergesort.js
}; command_storage+=(run_Javascript)

run_PHP() {
	php mergesort.php
}; command_storage+=(run_PHP)

run_Scala() {
	scala -nc mergesort.scala
}; command_storage+=(run_Scala)

run_C++() {
	g++ -std=c++17 mergesort.cpp && ./a.out && rm -f a.out
}; command_storage+=(run_C++)

run_Julia() {
	julia mergesort.jl
}; command_storage+=(run_Julia)

run_Perl() {
	perl mergesort.pl
}; command_storage+=(run_Perl)

run_Go() {
	rm -f mergesort && go build mergesort.go && ./mergesort
}; command_storage+=(run_Go)

run_OCaml() {
	rm -f mergesort && ocamlc mergesort.ml -o mergesort && ./mergesort
}; command_storage+=(run_OCaml)

run_Bash() {
	bash mergesort.sh
}; command_storage+=(run_Bash)

run_C#() {
	mcs -out:mergesort.exe mergesort.cs && mono mergesort.exe
}; command_storage+=(run_C#)

run_Kotlin() {
	kotlinc mergesort.kt -include-runtime -d mergesort.jar && java -jar mergesort.jar
}; command_storage+=(run_Kotlin)

run_Prolog() {
	rm -f mergesort && swipl -g main --stand_alone=true -o mergesort -c mergesort.pro && ./mergesort
}; command_storage+=(run_Prolog)

run_J() {
	ijconsole mergesort.ijs
}; command_storage+=(run_J)

run_Scheme() {
	scheme --script mergesort.ss
}; command_storage+=(run_Scheme)

run_Ruby() {
	ruby mergesort.rb
}; command_storage+=(run_Ruby)

run_R() {
	Rscript mergesort.r
}; command_storage+=(run_R)

run_Elixir() {
	elixir mergesort.exs
}; command_storage+=(run_Elixir)

run_Dart() {
	dart mergesort.dart
}; command_storage+=(run_Dart)

run_Coq() {
	coqc mergesort.v
}; command_storage+=(run_Coq)

run_LUA() {
	lua5.3 mergesort.lua
}; command_storage+=(run_LUA)

run_TypeScript() {
	tsc mergesort.ts --outDir out && node mergesort.js
}; command_storage+=(run_TypeScript)

run_Coffeescript() {
	coffee mergesort.coffee
}; command_storage+=(run_Coffeescript)

run_Swift() {
	swift mergesort.swift
}; command_storage+=(run_Swift)

run_F#() {
	dotnet fsi mergesort.fsx
}; command_storage+=(run_F#)

run_ATS() {
	myatscc mergesort.dats && ./mergesort_dats
}; command_storage+=(run_ATS)

run_D() {
	rdmd mergesort.d
}; command_storage+=(run_D)

run_Brainfuck() {
	bf mergesort.b
}; command_storage+=(run_Brainfuck)

run_TCL() {
	tclsh mergesort.tcl
}; command_storage+=(run_TCL)

run_Objective-C() {
	clang -fobjc-arc -framework Foundation mergesort.m -o mergesort && ./mergesort
}; command_storage+=(run_Objective-C)

run_all_commands command_storage


end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
