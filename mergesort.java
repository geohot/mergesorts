import java.util.Arrays;

public class mergesort {
    
    public static int[] my_mergesort(int a[]) {
        int n = a.length;
        if (n == 1) {
            return a;
        }

        int[] left = Arrays.copyOfRange(a, 0, n / 2);
        int[] right = Arrays.copyOfRange(a, n / 2, n);
        left = my_mergesort(left);
        right = my_mergesort(right); 
	
        int[] arr = new int[left.length + right.length];
        int l = 0, r = 0, i = 0;
       	
	while (true){ 
		if (l < left.length && r < right.length) {
		    if (left[l] <= right[r]) {
			arr[i++] = left[l++];
		    } else {
			arr[i++] = right[r++];
		    }
		}
		else if (l < left.length)
		    arr[i++] = left[l++];	
		else if (r < right.length)
		    arr[i++] = right[r++];
		else
		    break;
	}
        return arr;
    }

    public static void main(String[] args) {
        int[] arr = {5,9,1,3,4,6,6,3,2};
        System.out.println(Arrays.toString(my_mergesort(arr)));
    }
}
