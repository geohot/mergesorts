#!/bin/bash
start=`date +%s`


declare -A command_storage

elapsed_time() {
	if [ "$1" -ge "$2" ]; then elapsed_ns=$(("$1"-"$2")); else elapsed_ns=$(("$2"-"$1")); fi
	echo "Time elapsed : $(($elapsed_ns/1000000000)) s $(($elapsed_ns/1000000 - ($elapsed_ns/1000000000)*1000)) ms"
}

run_all_commands() {
	time_format=+%s%N
	local -n commands=$1
	for key in "${!commands[@]}"
	do
		printf "\nRunning the $key version : \n"
		version_start=`date $time_format`
		${commands[$key]}
		version_end=`date $time_format`
		if [ "$key" = "Ruby" ]; then printf "\n"; fi
		elapsed_time "$version_start" "$version_end"
	done
}

run_C() {
	rm -f a.out && gcc mergesort.c && ./a.out && rm -f a.out
}
command_storage[C]=run_C

run_Python() {
	python3 mergesort.py
}
command_storage[Python]=run_Python

run_Haskell() {
	rm -f mergesort && ghc mergesort.hs && ./mergesort
}
command_storage[Haskell]=run_Haskell

run_Rust() {
	rm -f mergesort && rustc mergesort.rs && ./mergesort
}
command_storage[Rust]=run_Rust

run_Java() {
	rm -f mergesort && javac mergesort.java && java mergesort
}
command_storage[Java]=run_Java

run_Javascript() {
	node mergesort.js
}
command_storage[Javascript]=run_Javascript

run_PHP() {
	php mergesort.php
}
command_storage[PHP]=run_PHP

run_Scala() {
	scala -nc mergesort.scala
}
command_storage[Scala]=run_Scala

run_C++() {
	g++ -std=c++17 mergesort.cpp && ./a.out && rm -f a.out
}
command_storage[C++]=run_C++

run_Julia() {
	julia mergesort.jl
}
command_storage[Julia]=run_Julia

run_Perl() {
	perl mergesort.pl
}
command_storage[Perl]=run_Perl

run_Go() {
	rm -f mergesort && go build mergesort.go && ./mergesort
}
command_storage[Go]=run_Go

run_OCaml() {
	rm -f mergesort && ocamlc mergesort.ml -o mergesort && ./mergesort
}
command_storage[OCaml]=run_OCaml

run_Bash() {
	bash mergesort.sh
}
command_storage[Bash]=run_Bash

run_C#() {
	mcs -out:mergesort.exe mergesort.cs && mono mergesort.exe
}
command_storage[C#]=run_C#

run_Kotlin() {
	kotlinc mergesort.kt -include-runtime -d mergesort.jar && java -jar mergesort.jar
}
command_storage[Kotlin]=run_Kotlin

run_Prolog() {
	rm -f mergesort && swipl -g main --stand_alone=true -o mergesort -c mergesort.pro && ./mergesort
}
command_storage[Prolog]=run_Prolog

run_J() {
	ijconsole mergesort.ijs
}
command_storage[J]=run_J

run_Scheme() {
	scheme --script mergesort.ss
}
command_storage[Scheme]=run_Scheme

run_Ruby() {
	ruby mergesort.rb
}
command_storage[Ruby]=run_Ruby

run_R() {
	Rscript mergesort.r
}
command_storage[R]=run_R

run_Elixir() {
	elixir mergesort.exs
}
command_storage[Elixir]=run_Elixir

run_Dart() {
	dart mergesort.dart
}
command_storage[Dart]=run_Dart

run_Coq() {
	coqc mergesort.v
}
command_storage[Coq]=run_Coq

run_LUA() {
	lua5.3 mergesort.lua
}
command_storage[LUA]=run_LUA

run_TypeScript() {
	tsc mergesort.ts --outDir out && node mergesort.js
}
command_storage[TypeScript]=run_TypeScript

run_Coffeescript() {
	coffee mergesort.coffee
}
command_storage[Coffeescript]=run_Coffeescript

run_Swift() {
	swift mergesort.swift
}
command_storage[Swift]=run_Swift

run_F#() {
	dotnet fsi mergesort.fsx
}
command_storage[F#]=run_F#

run_ATS() {
	myatscc mergesort.dats && ./mergesort_dats
}
command_storage[ATS]=run_ATS

run_D() {
	rdmd mergesort.d
}
command_storage[D]=run_D

run_Brainfuck() {
	bf mergesort.b
}
command_storage[Brainfuck]=run_Brainfuck

run_TCL() {
	tclsh mergesort.tcl
}
command_storage[TCL]=run_TCL

run_Objective-C() {
	clang -fobjc-arc -framework Foundation mergesort.m -o mergesort && ./mergesort
}
command_storage[Objective-C]=run_Objective-C

run_all_commands command_storage


end=`date +%s`
runtime=$((end-start))
printf "\n"
echo "Script ran in $runtime seconds"
