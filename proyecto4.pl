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

padre(X,Y) :- hombre(X),parent(X,Y).
madre(X,Y)	:- mujer(X),parent(X,Y).

hijo(X,Y)	:- hombre(X),parent(Y,X).
hija(X,Y)	:- mujer(X),parent(Y,X).

sibling(X,Y)	:- parent(Ningen, X), parent(Ningen, Y).

hermano(X,Y)	:- hombre(X),parent(Ningen, X), parent(Ningen, Y).
hermana(X,Y)	:- mujer(X),parent(Ningen, X), parent(Ningen, Y).

tio(X,Y)	:- hombre(X), parent(Ningen, Y), sibling(X,Ningen).
tia(X,Y)	:- mujer(X), parent(Ningen, Y), sibling(X,Ningen).

abuelo(X,Y) :- hombre(X),parent(X,Ningen),parent(Ningen,Y).
abuela(X,Y) :- mujer(X), parent(X,Ningen), parent(Ningen,Y).