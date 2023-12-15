% FACTS !%

male(bob).        %bob is a male
male(bill).
male(terry).
male(jack).
male(christian).
male(mark).
male(stan).
female(helena).
female(sally).
female(joanne).
female(jane).
female(mary).
female(anna).
female(julia).
parent(bob, bill).                         %bob is a parent of bill
parent(bob,jack).
parent(bob,mary).
parent(jane,bill).
parent(jane,jack).
parent(jane,mary).
parent(bill,mark).
parent(bill,anna).
parent(bill,julia).
parent(joanne,mark).
parent(joanne,anna).
parent(joanne,julia).
parent(jack,stan).
parent(jack,helena).
parent(sally,stan).
parent(sally,helena).
parent(mary,terry).
parent(christian,terry).

% RULES %!

father(X,Y):- 
    parent(X,Y),male(X).
    
mother(X,Y):- 
    parent(X,Y),female(X).

son(X,Y):-
    male(X), parent(Y,X).

daughter(X,Y):-
    female(X), parent(Y,X).

children(X,Y):- %Will be used for married 3
    parent(Y,X).

grandfather(X,Y):-
    male(X), parent(X,Z),parent(Z,Y).
    
grandmother(X,Y):-
   female(X), parent(X,Z),parent(Z,Y).

married(X,Y):- % First rule. Incorrect because X=Y
    parent(X,Z),parent(Y,Z).

married2(X,Y):- %Solves the previous problem
    parent(X,Z),parent(Y,Z), X \= Y.

married3(X,Y):- %Final rule, with all issues solved
    children(Z,X), children(Z,Y), X \= Y,male(X),female(Y).

sibling(X,Y):-
    parent(Z,X),parent(Z,Y), X \= Y.
    
brother(X,Y):-
    male(X),parent(Z,X),parent(Z,Y).

sister(X,Y):-
    female(X),parent(Z,X),parent(Z,Y).

aunt(X,Y):-
   parent(Z,Y), sibling(X,Z),female(X).

uncle(X,Y):- 
   parent(Z,Y), sibling(X,Z),male(X).

ancestor(X,Y) :-
    parent(X,Y).   

ancestor(X,Y) :- 
    parent(X,Z), ancestor(Z,Y).     

descendant(X,Y) :-
    parent(Y,X). 

descendant(X,Y) :-
    parent(Z,X), descendant(Z,Y). 

political(X,Y):-  
  parent(Y,Z),married(Z,X), not(children(X,Y)).

political(X,Y):-
    parent(Y,Z),political(X,Z).



