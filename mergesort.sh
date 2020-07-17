#!/bin/bash

a=(5 9 1 3 4 6 6 3 2)

merge() {
	local f=2
	local s=$(( $1 + 2 ))
	for i in ${@:2}
	do
		if [[ $f -eq $(( $1 + 2 )) ]]
		then
			echo ${@:$s:1} ; ((s += 1))
		else
			if [[ $s -eq $(( ${#@} + 1 )) ]]
			then
				echo ${@:$f:1} ; ((f += 1))
			else
				if [[ ${@:$f:1} -lt ${@:$s:1} ]]
				then
					echo ${@:$f:1} ; ((f += 1))
				else
					echo ${@:$s:1} ; ((s += 1))
				fi
			fi
		fi
	done
}

mergesort() {
	if [[ $1 -ge 2 ]]
	then
		local med=$(( $1 / 2 ))
		local f=( $(mergesort $med ${@:2:$med}) )
		local s=( $(mergesort $(( $1 - $med )) ${@:$(( $med + 2 )):$(( $1 - $med ))}) )
		echo $(merge $med ${f[@]} ${s[@]})
	else
		echo $2
	fi
}

echo "->" $(mergesort 10 ${a[@]})

