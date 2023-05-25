use fmt;

fn mergesort(a: []int) void = {
	if (len(a)<=1){
		return;	
	};
	let left: []int = alloc([0...], len(a)/2);
	defer free(left);
	let right: []int = alloc([0...], len(a)-len(left));
	defer free(right);
	for (let i = 0z; i<len(left); i += 1 ) {
		left[i] = a[i];
	};
	for (let i = 0z; i<len(right); i += 1 ) {
		right[i] = a[len(a)/2+i];
	};
	mergesort(left);
	mergesort(right);
	let j = 0z;
	let k = 0z;
	for (let i = 0z; i < len(a); i += 1) {
		if (j >= len(left)) {
			a[i] = right[k];
			k += 1;
		} else if (k >= len(right)) {
			a[i] = left[j];
			j += 1;
		} else if (left[j]<right[k]){
			a[i] = left[j];
			j += 1;
		}else {
			a[i] = right[k];
			k += 1;
		};
	};
};

fn printints(a: []int) void = {
	for (let i = 0z; i < len(a); i += 1) {
		fmt::printf("{} ", a[i])!;
	};
};	

export fn main() void = {
	let a: [_]int = [5,9,1,3,4,6,6,3,2];
	mergesort(a);
	printints(a);
};
