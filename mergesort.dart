void main(){
  List <Comparable> a = [5,9,1,3,4,6,6,3,2];
  sort(a);
  print(a);
}

void sort(List<Comparable> a){
  List<Comparable> aux = new List<Comparable>(a.length);
  sortHighLow(a, aux, 0, a.length-1);
  assert(_isSorted(a));
}

void sortHighLow(List<Comparable> a, List<Comparable> aux, int lo, int hi){
  if (hi <= lo){
    return;
  }
  int mid = lo + ((hi - lo) ~/ 2);
  sortHighLow(a, aux, lo, mid);
  sortHighLow(a, aux, mid + 1, hi);
  merge(a, aux, lo, mid, hi);
}

void merge(List<Comparable> a, List<Comparable> aux, int lo, int mid, int hi) {
  assert(_isSortedInRange(a, lo, mid));
  assert(_isSortedInRange(a, mid+1, hi));

  for (int k = lo; k <= hi; k++) {
    aux[k] = a[k];
  }

  int i = lo, j = mid+1;
  for (int k = lo; k <= hi; k++) {
    if (i > mid) {
      a[k] = aux[j++];
    } else if (j > hi) {
      a[k] = aux[i++];
    } else if (_less(aux[j], aux[i])) {
      a[k] = aux[j++];
    } else {
      a[k] = aux[i++];
    }
  }
  assert(_isSortedInRange(a, lo, hi));
}

bool _less(Comparable v, Comparable w) {
  return (v.compareTo(w) < 0);
}

bool _isSorted(List<Comparable> a) {
return _isSortedInRange(a, 0, a.length-1);
}

bool _isSortedInRange(List<Comparable> a, int lo, int hi) {
  for (int i= lo + 1; i <= hi; i++) {
    if (_less(a[i], a[i-1])) {
      return false;
    }
  }

  return true;
}