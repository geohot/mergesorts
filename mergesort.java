import java.util.*;

class MergeSort{   
  
  public static ArrayList<Integer> mergeSort(ArrayList<Integer> a){

    if (a.size() == 1){
      return a;
    }
    else if (a.size() == 2){
      if (a.get(0) > a.get(1)){
        ArrayList<Integer> t = new ArrayList<Integer>();
        t.add(a.get(1));
        t.add(a.get(0));
        return t;
      }
      else{
        return a;
      }
    }

    int p = a.size()/2;
    ArrayList<Integer> m1 = new ArrayList<Integer>();
    ArrayList<Integer> m2 = new ArrayList<Integer>();
    m1 = mergeSort(new ArrayList<Integer>(a.subList(0, p)));
    m2 = mergeSort(new ArrayList<Integer>(a.subList(p, a.size())));

    ArrayList<Integer> ret = new ArrayList<Integer>();

    while(true){
      if(m1.size() > 0 && m2.size() > 0){
        if(m1.get(0) <= m2.get(0)){
          ret.add(m1.get(0));
          m1 = new ArrayList<Integer>(m1.subList(1, m1.size()));
        }
        else{
          ret.add(m2.get(0));
          m2 = new ArrayList<Integer>(m2.subList(1, m2.size()));
        }
      }
      else if(m1.size() > 0){
        ret.addAll(m1);
        m1.clear();
      }
      else if (m2.size() > 0){
        ret.addAll(m2);
        m2.clear();
      }
      else{
        break;
      }
    }
    return ret;
  }

    public static void main(String args[]){ 

      ArrayList<Integer> a = new ArrayList<>(Arrays.asList(5,9,1,3,4,6,6,3,2));
      System.out.println(mergeSort(a));
    } 
}