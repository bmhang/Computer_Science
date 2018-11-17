/* Brandon Hang */

/* Question 3.1 */
entre(halloween, chocolate).
entre(thanksgiving, turkey).
side(halloween, candy).
side(thanksgiving, bread).
side(halloween, soda).
side(thanksgiving, pumpkinpie).
ingredient(candy, sugar).
ingredient(candy, foodcoloring).
ingredient(soda, water).
ingredient(soda, syrup).
ingredient(bread, egg).
ingredient(bread, flour).
ingredient(pumpkinpie, pumpkin).
ingredient(pumpkinpie, pie).

/* Question 3.2 */
meal(X, Y) :-
    entre(X, Y);
    side(X, Y).

/* Question 3.3 */
shoppinglist(X, Y) :-
    side(X, Z),
    ingredient(Z, Y).

/* Question 3.4 */
mealquestions :-
    meal(thanksgiving, turkey), /* here I test a question with a single case */
    write('turkey will be served at thanksgiving'), nl,

    shoppinglist(halloween, X), /* here I test a question with multiple answers */
    write(X), write(' is an ingredient needed for halloween.'), nl.