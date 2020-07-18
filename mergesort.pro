split([],_,_,_,_).
split([X|L], C, HALF, [X|FIRST], SECOND):-
	C =< HALF,
	C2 is C + 1,
	split(L, C2, HALF, FIRST, SECOND).
split([X|L],C, HALF, FIRST,[X|SECOND]):-
	C > HALF,
	C2 is C + 1,
	split(L,C2, HALF,FIRST,SECOND).


merge([],L1,L1).
merge(L1,[],L1).
merge([X|L1],[Y|L2],[X|R]):-
	X =< Y,
	merge(L1,[Y|L2],R).
merge([X|L1],[Y|L2],[Y|R]):-
	merge([X|L1],L2,R).

merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(L,R):-
	length(L,N),
	HALF is div(N,2),
	split(L, 1, HALF, FIRST, SECOND),
	merge_sort(FIRST, FIRST_RESULT),
	merge_sort(SECOND, SECOND_RESULT),
	merge(FIRST_RESULT, SECOND_RESULT, R).	

main:-
	merge_sort([5,9,1,3,4,6,6,3,2], ListSorted),
	write(ListSorted), nl.
