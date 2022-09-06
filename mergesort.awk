function merge(arr, begin , mid, end,               left, right, tmp, i,j){
    left = begin; 
    right = mid;
    i = 0;
    while(left < mid && right < end)
        tmp[i++] = arr[arr[left] < arr[right] ? left++ : right++];
    while(left < mid)
        tmp[i++] = arr[left++];
    while(right < end)
        tmp[i++] = arr[right++];
    for(j=0 ; j<i ; ++j)
        arr[begin + j] = tmp[j];
}

function merge_sort(arr, begin, end,                mid){
    if((end - begin) <= 1) return;

    mid = begin + sprintf("%d",(end - begin)/2); #cast float to int

    merge_sort(arr, begin, mid);
    merge_sort(arr, mid, end);
    merge(arr, begin, mid, end);
}

function main(          arr,i){
    split("5,9,1,3,4,6,6,3,2", arr, ",");
    merge_sort(arr, 1, length(arr)+1);   #split for some reason creates 1-based array
    for(i = 1 ; i <= length(arr);++i)
        printf("%s ",arr[i]);
    printf("\n");
}

BEGIN{
    main(); #put all code inside functions so that i don't have to use global variables and it's easier to debug 
    exit;
}