//This could have been simplified as a tailrec more readable version, but let's save some call stacks and bleed the two seqs
// The simplified recursive sort + tailrec is at https://medium.com/analytics-vidhya/playing-with-scala-merge-sort-d382fb1a32ff
def merge(left: Seq[Int], right: Seq[Int]): Seq[Int] = {
  var leftReduce = left
  var rightReduce = right
  var result = Seq[Int]()
  while (leftReduce.nonEmpty && rightReduce.nonEmpty) {
    result = result :+ ((leftReduce.head, rightReduce.head) match {
      case (l, r) if (l > r) => {
        rightReduce = rightReduce.tail
        r
      }
      case (l, _) => {
        leftReduce = leftReduce.tail
        l
      }
    })
  }

  result ++ leftReduce ++ rightReduce
}

def mergeSort(input: Seq[Int]): Seq[Int] = {
  if (input.size <= 2) {
    return input match {
      case x :: y :: Nil if (y < x) => Seq(y, x)
      case _ => input
    }
  }

  val split = input.splitAt(input.size/2)
  val left = mergeSort(split._1)
  val right = mergeSort(split._2)

  merge(left, right)
}

val input = Seq(5,9,1,3,4,6,6,3,2)

println(s"${mergeSort(input)}")