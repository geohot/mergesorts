object MergeSort 
{

	// recursive merge of 2 sorted lists
	def merge(left: List[Int], right: List[Int]): List[Int] =(left, right) match {
	        case(left, Nil) => left
	        case(Nil, right) => right
	        case(leftHead :: leftTail, rightHead :: rightTail) =>
	          if (leftHead < rightHead) leftHead::merge(leftTail, right)
	          else rightHead :: merge(left, rightTail)
    }     

    def mergeSort(list: List[Int]): List[Int] = {
	  val n = list.length / 2
	  if (n == 0) list // i.e. if list is empty or single value, no sorting needed
	  else {
	    val (left, right) = list.splitAt(n)
	    merge(mergeSort(left), mergeSort(right))
	  }
	}       

	mergeSort(List(33,44,22,-10,99))                 //> res0: List[Int] = List(-10, 22, 33, 44, 99)


	mergeSort(List())                                //> res1: List[Int] = List()
}