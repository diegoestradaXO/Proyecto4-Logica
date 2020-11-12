node(a).
node(b).
node(c).
node(d).


edge(a, b).
edge(a, c).
edge(a, d).
edge(c, d).

node(X) :- edge(X,_).
node(Y) :- edge(X,_).

se_mueve(X,X,[]).
se_mueve(X,Y,[Z|Ps]) :- edge(X,Z), se_mueve(Z,Y,Ps).