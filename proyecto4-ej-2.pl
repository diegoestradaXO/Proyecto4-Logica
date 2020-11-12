edge(a, b).
edge(b, c).
edge(a, c).
edge(b, d).
edge(c, e).
edge(d, e).
edge(e, b).

pathold(S, G) :- edge(S, G).
pathold(S, G) :- edge(S, X), pathold(X, G).

path(S, G, V, [G|V], 1) :- edge(S, G).
path(S, G, V, P, D) :- edge(S, X), X\=G, not(mem(X, V)), path(X, G, [X|V], P, D1), D is D1+1.

pathfinal(S, G, V, P) :- edge(S, G), addatend(G, V, P).
pathfinal(S, G, V, P) :- edge(S, X), X\=G, not(mem(X, V)), addatend(X, V, V2), pathfinal(X, G, V2, P).

iterdeepening(S, G, L, P) :- path(S, G, [S], P2, L), rev1(P, P2) ; L1 is L + 1, L1<25, iterdeepening(S, G, L1, P).

not(P) :- P, !, fail;true.

rev1([], []).
rev1([H|T], L1) :- rev1(T, T1), addatend(H, T1, L1).

rev2([], A, A).
rev2([H|T], A, L2) :- rev2(T, [H|A], L2).

addatend(X, [], [X]).
addatend(X, [H|T], [H|T2]) :- addatend(X, T, T2).

app([], L2, L2).
app([H1|T1], L2, [H1, T3]) :- app(T1, L2, T3).

prefix(L1, L) :- app(L1, _, L).
sufix(L1, L) :- app(_, L1, L).

sub(L1, L) :- app(LY, _, L), app(_, L1, LY).

mem(X, [X | _]).
mem(X, [_ | T]) :- mem(X, T).

del(X, [X|T], T).
del(X, [H|T], [H|TA]) :- del(X, T, TA).

sum([], 0).
sum([H|T], S) :- sum(T, ST), S is ST + H.

sump([], 0).
sump([H|T], S) :- sump(T, ST), H >= 0, S is ST + H.
sump([H|T], S) :- sump(T, S), H < 0.

posl([], []).
posl([H|T], [H|T1]) :- H >= 0, posl(T, T1).
posl([H|T], L1) :- H < 0, posl(T, L1).

adds(X, S, S) :- mem(X, S), !.
adds(X, S, [X|S]).

union([], S2, S2).
union([H1|T1], S2, S) :- mem(H1, S2), !, union(T1, S2, S).
union([H1|T1], S2, [H1|T]) :- union(T1, S2, T).