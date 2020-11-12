hombre(david).
hombre(horacio).
hombre(diego).
hombre(francisco).
hombre(juan).
hombre(fernando).
hombre(andree).
hombre(edgar).
hombre(jose).
hombre(victor).
hombre(pablo).
hombre(jared).
hombre(sam).
hombre(daniel).

mujer(paulina).
mujer(mariel).
mujer(susy).
mujer(nancy).
mujer(dayanne).
mujer(clara).
mujer(susan).
mujer(valeria).

% bidireccional

casado_con(david, paulina).
casado_con(horacio, mariel).
casado_con(fernando, clara).
casado_con(jose, dayanne).
casado_con(jared, susan).

casado_con(paulina, david).
casado_con(mariel, horacio).
casado_con(clara, fernando).
casado_con(dayanne, jose).
casado_con(susan, jared).

parent(david, horacio).
parent(david, diego).
parent(david, francisco).
parent(david, clara).
parent(david, susan).
parent(paulina, horacio).
parent(paulina, diego).
parent(paulina, francisco).

parent(horacio, jose).
parent(horacio, victor).
parent(horacio, pablo).
parent(horacio, jared).
parent(horacio, sam).
parent(horacio, fernando).
parent(horacio, juan).
parent(mariel, jose).
parent(mariel, victor).
parent(mariel, pablo).
parent(mariel, jared).
parent(mariel, sam).
parent(susy, fernando).
parent(nancy, juan).
parent(horacio,susy).


parent(diego,dayanne).
parent(diego, valeria).

parent(jose, daniel).
parent(dayanne, daniel).
parent(fernando, andree).
parent(fernando, edgar).
parent(clara, andree).
parent(clara, edgar).

% padres
padre(X, Y) :- parent(X, Y), hombre(X).
madre(X, Y) :- parent(X, Y), mujer(X).

% hermanos
sibling(X, Y) :- madre(M, X), madre(M, Y), padre(F, X), padre(F, Y), X \= Y.
hermano(X, Y) :- hombre(X), sibling(X, Y).
hermana(X,Y):- mujer(X),parent(Ningen, X), parent(Ningen, Y).

% sobrinos
sobrino(X, Y) :- hombre(X), parent(P, X), sibling(P, Y).
sobrina(X, Y) :- mujer(X), parent(P, X), sibling(P, Y).

% hijos
child(X,Y) :- parent(Y,X).
hija(X,Y) :- mujer(X), parent(Y,X).
hijo(X,Y) :- hombre(X), child(X,Y).


% tio/tia
tio(X, Y) :- hombre(X), parent(P, Y), sibling(P, X).
tia(X, Y) :- mujer(X), parent(P, Y), sibling(P, X).

% abuelo/abuela
abuelo(X,Y) :- hombre(X),parent(X,Ningen),parent(Ningen,Y).
abuela(X,Y) :- mujer(X), parent(X,Ningen), parent(Ningen,Y).

