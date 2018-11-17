/* Database for family tree. It consists of facts and rules. */
/* A portion of the family tree has been implemented for you */

/* Facts */
/* Question 2.1 */
male(kam).
male(rob).
male(dom).
male(dag).
male(jeb).
male(tio).
male(zev).
male(gio).
female(ana).
female(syd).
female(sue).
female(kat).
female(may).
female(pam).
female(fey).
female(liz).


father_of(kam, rob).
father_of(kam, syd).
father_of(jeb, tio).
father_of(jeb, pam).
father_of(rob, kat).
father_of(rob, dom).
father_of(tio, dag).
father_of(tio, fey).
father_of(zev, liz).
father_of(zev, gio).
mother_of(ana, rob).
mother_of(ana, syd).
mother_of(may, tio).
mother_of(may, pam).
mother_of(sue, kat).
mother_of(sue, dom).
mother_of(syd, dag).
mother_of(syd, fey).
mother_of(pam, liz).
mother_of(pam, gio).


/* Rules */
is_male(X) :-
    male(X);
    father_of(X, _).

/* Question 2.2 */
is_female(X) :-
    female(X);
    mother_of(X, _).

/* Question 2,3 */
parent_of(X, Y) :-
    father_of(X, Y);
    mother_of(X, Y).

/*  Question 2.4 */
sibling_of(X, Y) :-
    parent_of(Z, X),
    parent_of(Z, Y).

/* Question 2.5 */
grandmother_of(X, Z) :-
    mother_of(X, Y),
    parent_of(Y, Z).

grandfather_of(X, Z) :-
    father_of(X, Y),
    parent_of(Y, Z).

/* Question 2.6 */
descendant_of(X, Y) :-
    parent_of(Y, X).

descendant_of(X, Y) :-
    parent_of(Z, X),
    descendant_of(Z, Y).

/* Question 2.7 */
/* here I only test singular cases since there are so many combinations */
familyquestions :-
is_male(zev),
write('zev is a male.'), nl,

is_female(pam),
write('pam is a female.'), nl,

parent_of(syd, dag),
write('syd is a parent of dag.'), nl,

sibling_of(syd, rob),
write('syd is a sibling of rob'), nl,

grandmother_of(may, liz),
write('may is the grandmother of liz'), nl,

grandfather_of(jeb, dag),
write('jeb is the grandfather of dag'), nl,

descendant_of(dag, ana),
write('dag is the descendant of ana'), nl.