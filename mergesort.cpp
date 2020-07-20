
#include <iostream>
#include <vector>
using namespace std;

void merge(int a[], int start, int mid, int end){
    vector <int> b1, b2;
    for(int i = start; i <= mid; i++){
        b1.push_back(a[i]);
    }
    for(int i = mid + 1; i <= end; i++){
        b2.push_back(a[i]);
    }
    int p1 = 0, p2 = 0, p3 = start;
    while(p1 < b1.size() && p2 <b2.size()){
        if(b1[p1] < b2[p2]){
            a[p3++] = b1[p1++];
        } else {
            a[p3++] = b2[p2++];
        }
    }
    while(p1 < b1.size()){
        a[p3++] = b1[p1++];
    }
    while(p2 < b2.size()){
        a[p3++] = b2[p2++];
    }
}

void mergesort(int a[], int start, int end){
    if (start < end){
        int mid = (start + end)/2;
        mergesort(a, start, mid);
        mergesort(a, mid + 1, end);
        merge(a, start, mid, end);
    }
}


signed main() {
    int a[] = {5,9,1,3,4,6,6,3,2};
    mergesort(a, 0, sizeof(a)/sizeof(int) - 1);
    for (int f: a){
        cout << f << " ";
    }
    cout << endl; 
}
