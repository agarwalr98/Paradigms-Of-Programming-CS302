member(X, [X | _]).
member(X, [_ | Y]) :- member(X, Y).
notmember(X,Y):- not(member(X,Y)),!.
append([], X, X).
append([Head | Tail], Y, [Head | Z]) :- append(Tail, Y, Z).
add(L,M):- append(L,M,Z),append(Z,[],L).
suffix(Y, Z) :- append(_, Y, Z).

path(K,A,F,CList):- invoke(K, L),member(A,L);copy(B,A), notmember(B,CList),path(K,B,F,[B|CList]);notmember([A,F],CList),store(X,Y,A),invoke(K,L),member(X,L);notmember([A,F],CList),store(X,Y,A),path(K,X,Y,[[A,F]|CList]);notmember([A,F],CList),load(X,A,F),invoke(K,L),member(X,L);notmember([A,F],CList),load(X,A,F),path(K,X,[],CList),!.
escapes(O):- alloc(X,O),invoke(_,[X]),!.
escapes(O):- alloc(Y,O),path(_,Y,[],[]),!.
escapesthrough(O,M):- alloc(Y,O),path(M,Y,[],[]),!.
allescapeshelper(M,O):- alloc(Y,O),path(M,Y,[],[]).
function(M,L):- alloc(_,O),escapesthrough(O,M),append([],O,L).
allescapes(M,L):- bagof(A, function(M,A), X), sort(X,L),!.
allescapes(_,L):- sort([],L).

