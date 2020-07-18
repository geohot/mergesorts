#!/bin/bash

MergeSort (){
  local a=("$@")
  if [ ${#a[@]} -eq "1" ]
  then
    r=("${a[@]}")
    echo "${r[@]}"
  elif [[ "${#a[@]}" -eq "2" ]]
  then
    if [[ "${a[0]}" -gt "${a[1]}" ]]
    then
      local t=("${a[1]}" "${a[0]}")
      echo "${t[@]}"
    else
      r=("${a[@]}")
      echo "${r[@]}"
    fi
  else

    local p=$(( ${#a[@]} / 2 ))
    local m1=()
    m1=($(MergeSort "${a[@]::p}"))
    local m2=()
    m2=($(MergeSort "${a[@]:p}"))
    local ret=()

    while true
    do
      if [ ${#m1[@]} -gt 0 ] && [ ${#m2[@]} -gt 0 ]
      then
        if [ "${m1[0]}" -le "${m2[0]}" ]
        then
          ret=("${ret[@]}" "${m1[0]}")
          m1=("${m1[@]:1}")
        else
          ret=("${ret[@]}" "${m2[0]}")
          m2=("${m2[@]:1}")
        fi
      elif [ "${#m1[@]}" -gt 0 ]
      then
        ret=("${ret[@]}" "${m1[@]}")
        unset m1
      elif [ "${#m2[@]}" -gt 0 ]
      then
        ret=("${ret[@]}" "${m2[@]}")
        unset m2
      else
        break
      fi
    done
    echo "${ret[@]}"
  fi
}

a=(5 9 1 3 4 6 6 3 2)
MergeSort "${a[@]}"