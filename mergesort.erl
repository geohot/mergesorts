-module(mergesort).

-export([sort/1]).

sort([]) -> [];
sort([X]) -> [X];
sort([X,Y]) when X > Y -> [Y, X];
sort([X,Y]) -> [X, Y];
sort(List) ->
  Middle = length(List) div 2,
  {Left, Right} = lists:split(Middle, List),
  merge(sort(Left), sort(Right)).

merge(X, []) -> X;
merge([], Y) -> Y;
merge([X|XT], [Y|YT]) when X > Y -> [Y | merge([X|XT], YT)];
merge([X|XT], [Y|YT]) -> [X | merge(XT, [Y|YT])].
