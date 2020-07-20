#include "share/atspre_staload.hats"

(* ats noob. see Introduction to Programming in ATS by Hongwei Xi for
   fancier-typed and better-implemented mergesorts *)

fun {a:t@ype} merge {m,n:nat}
( xs:list(a,m), ys:list(a,n), cmp:(a,a)->bool ) : list(a,m+n) =
case xs of
| nil () => ys
| cons (x,xt) => case ys of
  | nil () => xs
  | cons (y,yt) =>
    if cmp (x,y)
      then cons (x, merge (xt, ys, cmp))
      else cons (y, merge (xs, yt, cmp))

fun {a:t@ype} chop {n:nat}
( xs:list(a,n), n:int n ) : (list(a,n/2), list(a,n-n/2)) =
let val (ys,zs) = list_split_at<a> (xs,n/2) in (list_vt2t(ys),zs) end

fun {a:t@ype} mergesort {n:nat}
( xs:list(a,n), n:int n, cmp:(a,a)->bool ) : list(a,n) =
if n < 2 then xs
  else let val (xs,ys) = chop(xs,n)
           val sx = mergesort (xs,n/2,cmp)
           val sy = mergesort (ys,n-n/2,cmp)
        in merge(sx,sy,cmp) end

val it = $list{int}(5, 9, 1, 3, 4, 6, 6, 3, 2)
val () = println! (mergesort<int>(it,length(it),lam(x,y) => (x <= y)))

implement main0 () = ()
