#!/usr/bin/perl

use strict;
use warnings;


sub merge_sort {
    my @arr = @_;

    return @arr if @arr < 2;

    my $p = int @arr / 2;
    my @m1 = merge_sort(@arr[0 .. $p - 1]); # Ew
    my @m2 = merge_sort(@arr[$p .. $#arr]); # Casually using comment token to get the last element in the list :|
    
    for (@arr) {
        $_ =
        !@m1 ? shift @m2 : # If m1 is empty
        !@m2 ? shift @m1 : # If m2 is empty
        $m1[0] <= $m2[0] ? shift @m1 : 
        shift @m2;
    }
    @arr;
}

my @arr = (5,9,1,3,4,6,6,3,2);
@arr = merge_sort(@arr);
print "@arr\n";
