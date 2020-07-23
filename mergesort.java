import java.util.Arrays;

public class mergesort {
	
	private static void mergeSort(int[] v, int min, int max) {
		if(min == max) {
			return;
		}
		int mid = (max + min)/2;
		mergeSort(v, min, mid);
		mergeSort(v, mid+1, max);
		merge(v, min, mid, max);
	}
	
	private static void merge(int[] v, int min, int mid, int max) {
		int[] temp = new int[max - min + 1];
		int sx = min;
		int dx = mid + 1;
		for(int i = 0; i < temp.length; i++) {
			if(dx > max || (v[sx] < v[dx] && sx <= mid)) {
				temp[i] = v[sx];
				sx++;
			} else {
				temp[i] = v[dx];
				dx++;
			}
		}
		for(int i=0; i < temp.length; i++) {
			v[i+min] = temp[i];
		}
	}
	
	public static void main(String[] args) {
		int[] v = {5, 9, 1, 3, 4, 6, 6, 3, 2};
		mergeSort(v, 0, v.length - 1);
		System.out.println(Arrays.toString(v));
	}
}
