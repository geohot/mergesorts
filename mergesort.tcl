proc mergesort arr {
    set len [llength $arr]
    if {$len == 1} { return $arr }
    set p [expr {$len / 2}]
    set arr1 [lrange $arr 0 [expr {$p - 1}]]
    set arr2 [lrange $arr $p end]
    set res {} 
    set arr1 [mergesort $arr1]
    set arr2 [mergesort $arr2]
    while {[set larr1 [llength $arr1]] > 0 && [set larr2 [llength $arr2]] > 0} {
        if {[lindex $arr1 0] <= [lindex $arr2 0]} {
          set arr1 [lassign $arr1 val]
          lappend res $val
        } else {
          set arr2 [lassign $arr2 val]
          lappend res $val
        }
    }
    if {$larr1 > 0} { lappend res {*}$arr1 }
    if {$larr2 > 0} { set res [concat $res $arr2] }
    return $res
}

puts [mergesort { 5 9 1 3 4 6 6 3 2 }]
