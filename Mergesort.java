import java.util.Arrays;

public class Mergesort {
    
    public static int[] sort(int arr[]) {
        int n = arr.length;
        if (n == 1) {
            return arr;
        }

        int[] left = Arrays.copyOfRange(arr, 0, n / 2);
        int[] right = Arrays.copyOfRange(arr, n / 2, n);
        left = sort(left);
        right = sort(right);
        return merge(left, right);
    }

    public static int[] merge(int[] left, int[] right) {
        int[] arr = new int[left.length + right.length];
        int l = 0, r = 0, i = 0;
        
        while (l < left.length && r < right.length) {
            if (left[l] <= right[r]) {
                arr[i++] = left[l++];
            } else {
                arr[i++] = right[r++];
            }
        }

        while (l < left.length) {
            arr[i++] = left[l++];
        }
        
        while (r < right.length) {
            arr[i++] = right[r++];
        }

        return arr;
    }

    public static void main(String[] args) {
        int[] arr = {5,9,1,3,4,6,6,3,2};
        System.out.println(Arrays.toString(sort(arr)));
    }
}