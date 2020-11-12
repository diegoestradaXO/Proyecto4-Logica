edge(a, b).
edge(b, c).
edge(a, c).
edge(b, d).
edge(c, e).
edge(d, e).
edge(e, b).

pathfinal(S, G, V, P) :- edge(S, G), addatend(G, V, P).
pathfinal(S, G, V, P) :- edge(S, X), X\=G, not(mem(X, V)), addatend(X, V, V2), pathfinal(X, G, V2, P).

not(P) :- P, !, fail;true.

addatend(X, [], [X]).
addatend(X, [H|T], [H|T2]) :- addatend(X, T, T2).

mem(X, [X | _]).
mem(X, [_ | T]) :- mem(X, T).