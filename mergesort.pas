program merge_sort;

const
    dim = 9;

var
    v: array [1..dim] of integer = (5, 9, 1, 3, 4, 6, 6, 3, 2);
    i: integer;

procedure MergeSort(min, max: integer);
var
    mid, j, i, n1, n2: integer;
    res: array[1..dim] of integer;
begin
    if max <= min then 
        exit 
    else 
    begin
        mid := (min + max) div 2;
        MergeSort(min, mid);
        MergeSort(mid + 1, max);
        n1 := min;
        n2 := mid + 1;
        for i := min to max do 
        begin
            if (n1 < mid + 1) and ((n2 > max) or (v[n1] < v[n2])) then
            begin
                res[i] := v[n1];
                inc(n1);
            end 
            else 
            begin
                res[i] := v[n2];
                inc(n2);
            end;
        end;
        for j := min to max do
            v[j] := res[j];
    end; 
end;

begin
    MergeSort(1, dim);
    for i := 1 to dim do
        write(v[i], ' ');
end.