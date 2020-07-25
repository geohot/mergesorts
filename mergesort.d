import std.stdio : writeln, write;

void merge(int[] a, int start, int mid, int end) {
    int size1 = mid-start+1;
    int size2 = end - mid;
    int[] temp1 = new int[size1];
    int[] temp2 = new int[size2];
   
    for (int i=0; i<size1; i++) {
        temp1[i] = a[start+i];
    }
   
    for (int i=0; i<size2; i++) {
        temp2[i] = a[mid+i+1];
    }
   
    int p1=0, p2=0, p3=start;
    while(p1 < temp1.length && p2 <temp2.length){
        if(temp1[p1] < temp2[p2]){
            a[p3++] = temp1[p1++];
        } else {
            a[p3++] = temp2[p2++];
        }
    }
    while(p1 < temp1.length){
        a[p3++] = temp1[p1++];
    }
    while(p2 < temp2.length){
        a[p3++] = temp2[p2++];
    }
}

void mergesort(int[] a, int start, int end) {
    if (start < end) {
        int mid = (start+end)/2;
        mergesort(a, start, mid);
        mergesort(a, mid+1, end);
        merge(a, start, mid, end);
    }
}

void main()
{
    int[] a = [5,9,1,3,4,6,6,3,2];
    mergesort(a, 0, cast(int)a.length-1);
    for (auto i = 0; i < a.length; i++) {
        write(a[i], ' ');
    }
    writeln();
}