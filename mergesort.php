<?php

function mergesort(array $a) {
    $countA = count($a);

    if ($countA === 1) {
        return $a;
    }

    if ($countA === 2) {
        if ($a[0] > $a[1]) {
            return [$a[1], $a[0]];
        }
        return $a;
    }

    $p = (int) (count($a) / 2);
    $m1 = mergesort(array_slice($a, 0, $p));
    $m2 = mergesort(array_slice($a, $p));

    $ret = [];
    while (1) {
        $countM1 = count($m1);
        $countM2 = count($m2);

        if ($countM1 && $countM2) {
            if ($m1[0] <= $m2[0]) {
                $ret[] = $m1[0];
                $m1 = array_slice($m1, 1);
            } else {
                $ret[] = $m2[0];
                $m2 = array_slice($m2, 1);
            }
        } else if ($countM1) {
            $ret = array_merge($ret, $m1);
            $m1 = [];
        } else if ($countM2) {
            $ret = array_merge($ret, $m2);
            $m2 = [];
        } else {
            break;
        }
    }
    return $ret;
}

$a = [5,9,1,3,4,6,6,3,2];
$r = mergesort($a);

echo sprintf("%s\n", json_encode($r));
