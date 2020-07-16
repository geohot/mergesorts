function mergesort(a){
  
  if (a.length == 1){
    return a;
  }
  else if (a.length == 2){
    if (a[0] > a[1]){
      return [a[1], a[0]];
    }
    else{
      return a;
    }
  }

  var p = parseInt(a.length/2);
  var m1 = mergesort(a.slice(0, p));
  var m2 = mergesort(a.slice(p));

  var ret = [];

  while(1){
    if(m1.length > 0 && m2.length > 0){
      if(m1[0] <= m2[0]){
        ret.push(m1[0]);
        m1 = m1.slice(1);
      }
      else{
        ret.push(m2[0]);
        m2 = m2.slice(1);
      }
    }
    else if(m1.length > 0){
      ret = ret.concat(m1);
      m1 = [];
    }
    else if (m2.length > 0){
      ret = ret.concat(m2);
      m2 = [];
    }
    else{
      break;
    }
  }

  return ret;
}

a = [5,9,1,3,4,6,6,3,2];
console.log(mergesort(a))
