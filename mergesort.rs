fn mergesort(arr: &mut [i32]) {
  if arr.len() == 1 { return; }
  if arr.len() == 2 {
    if arr[0] > arr[1] {
      arr[0] ^= arr[1];
      arr[1] ^= arr[0];
      arr[0] ^= arr[1];
    }
  }
  let p = arr.len() / 2;
  mergesort(&mut arr[0 .. p]);
  mergesort(&mut arr[p ..]);

  let mut arr2 = vec![0; arr.len()];
  let mut p1 = 0;
  let mut p2 = p;
  let mut f = 0;

  loop {
    if p1 < p && p2 < arr.len() {
      if arr[p1] <= arr[p2] {
        arr2[f] = arr[p1];
        p1 += 1;
      } else {
        arr2[f] = arr[p2];
        p2 += 1;
      }
    } else if p1 < p {
      arr2[f] = arr[p1];
      p1 += 1;
    } else if p2 < arr.len() {
      arr2[f] = arr[p2];
      p2 += 1;
    } else {
      break;
    }
    f += 1;
  }

  f = 0;
  loop {
    arr[f] = arr2[f];
    f += 1;
    if f == arr.len() { break; }
  }
}

fn main() {
  let mut arr = [5,9,1,3,4,6,6,3,2];
  mergesort(&mut arr);
  println!("{:?}", arr);
}

