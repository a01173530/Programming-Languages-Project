% A01173530
% Adrián Torres Hernández

road(soriano, bernal).
road(bernal, soriano).
road(soriano, queretaro).
road(queretaro, soriano).
road(bernal, queretaro).
road(queretaro, bernal).
road(queretaro, jauregui).
road(jauregui, queretaro).
road(bernal, cadereyta).
road(cadereyta, bernal).
road(cadereyta, ezequiel).
road(ezequiel, cadereyta).
road(ezequiel, tequisquiapan).
road(tequisquiapan, ezequiel).
road(tequisquiapan, san_juan).
road(san_juan, tequisquiapan).
road(san_juan, amealco).
road(amealco, san_juan).
road(san_juan, mexico).
road(mexico, san_juan).

% Stack of visited tourist places

empty_stack([]).

% Determine whether the top is in the stack

member_stack(Top, Body):-
    member(Top, Body).

% Stack structure

stack(Top, Body, [Top|Body]).

% Start the travel from the origin to destination

travel(Origin, Destination, R) :-
	empty_stack(Empty_list),
	stack(Origin, Empty_list, Visited_List),
	path(Origin, Destination, Visited_List, R).

% Determine whether you have reached the destination

path(Destination, Destination, R, R):-
	reverse_print_stack(R).

% Determine whether you have visited the adjacent tourist places
% If not visited, add to the list of visited tourist places
% Continue iterating over the roads

path(Actual, Destination, Visited_List, R) :-
	road(Actual, Next),
	not(member_stack(Next, Visited_List)),
	stack(Next, Visited_List, Updated_list),
	path(Next, Destination, Updated_list, R), !.


reverse_print_stack(S) :-
	empty_stack(S).

reverse_print_stack(S) :-
	stack(E, Rest, S), %pop
	reverse_print_stack(Rest),
	write(E), nl.


% testTravel that runs 3 cases

testTravel(X,Y,Z):-
    travel(bernal, mexico, X),	% X = [mexico, san_juan, tequisquiapan, ezequiel, cadereyta, bernal],
    travel(soriano, jauregui, Y),		% Y = [jauregui, queretaro, bernal, soriano],
    travel(mexico , ezequiel, Z).		% Z = [ezequiel, tequisquiapan, san_juan, mexico]
