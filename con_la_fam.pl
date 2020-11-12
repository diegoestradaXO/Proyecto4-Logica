hombre(david). 
hombre(angel). 
hombre(carlos).
hombre(abinadi). 
hombre(horacio). 
hombre(alejandro). 
hombre(rivaldo). 
hombre(pablo). 
hombre(francisco). 
hombre(ernesto).
hombre(david).
hombre(roberto). 
mujer(sofia). 
mujer(valeria).
mujer(susana). 
mujer(samantha). 
mujer(karla). 
mujer(darla). 
mujer(ligia). 

parent(david, sofia). 
parent(sofia, angel). 
parent(sofia, carlos). 
parent(sofia, horacio). 
parent(sofia, alejandro). 
parent(abinadi, angel). 
parent(abinadi, carlos). 
parent(abinadi, horacio). 
parent(abinadi, alejandro). 
parent(carlos, rivaldo).  
parent(carlos, pablo). 
parent(carlos, francisco). 
parent(valeria, rivaldo). 
parent(valeria, pablo). 
parent(valeria, francisco). 
parent(horacio, susana). 
parent(karla, susana). 
parent(susana, david). 
parent(susana, ligia). 
parent(francisco, david). 
parent(francisco, ligia). 
parent(alejandro, roberto). 
parent(darla, roberto). 
parent(samantha, ernesto). 
parent(francisco, ernesto). 
 

padre_de(X,Y):- hombre(X),
    parent(X,Y).
 
madre_de(X,Y):- mujer(X),
    parent(X,Y).
 
abuelo_de(X,Y):- hombre(X),
    parent(X,Z),
    parent(Z,Y).

abuela_de(X,Y):- mujer(X),
    parent(X,Z),
    parent(Z,Y).
 
hermana_de(X,Y):- %(X,Y or Y,X)%
    mujer(X),
    padre_de(F, Y), padre_de(F,X),X \= Y.
 
hermana_de(X,Y):- mujer(X),
    madre_de(M, Y), madre_de(M,X),X \= Y.


	
tia_de(X,Y):- mujer(X),
    parent(Z,Y), hermana_de(Z,X),!.
 
hermano_de(X,Y):- %(X,Y or Y,X)%
    hombre(X),
    padre_de(F, Y), padre_de(F,X),X \= Y.


    
hermano_de(X,Y):- hombre(X),
    madre_de(M, Y), madre_de(M,X),X \= Y.
 
tio_de(X,Y):-
    parent(Z,Y), hermano_de(Z,X).

antecesor_de(X,Y):- parent(X,Y).
antecesor_de(X,Y):- parent(X,Z),
    antecesor_de(Z,Y).
esTio_de(X,Y):-
	tio_de(X,Y); tia_de(X,Y).

primo_de(X,Y):-
	hombre(X),
	parent(Z,Y), esTio_de(Z,X). 
prima_de(X,Y):-
	mujer(X),
	parent(Z,Y), esTio_de(Z,X).