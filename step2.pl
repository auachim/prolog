user:- use_rendering(table,
	[header(h('Owner', 'Pet', 'Cigarette', 'Drink', 'Color'))]).

fish_owner(Owner) :-
houses(Hs),
member(h(Owner,fish,_,_,_), Hs).

water_drinker(Drinker) :-
houses(Hs),
member(h(Drinker,_,_,water,_), Hs).


houses(Hs) :-
% each house in the list Hs of houses is represented as:
%      h(Nationality, Pet, Cigarette, Drink, Color)
length(Hs, 5),                                            %  1
member(h(english,_,_,_,red), Hs),                         %  2
member(h(swedish,dog,_,_,_), Hs),                         %  3
member(h(_,_,_,coffee,green), Hs),                        %  4
member(h(danish,_,_,tea,_), Hs),                       %  5
next(h(_,_,_,_,green), h(_,_,_,_,white), Hs),             %  6
member(h(_,birds,pall_mall,_,_), Hs),                       %  7
member(h(_,_,dunhill,_,yellow), Hs),                         %  8
Hs = [_,_,h(_,_,_,milk,_),_,_],                           %  9
Hs = [h(norwegian,_,_,_,_)|_],                            % 10
next(h(_,cat,_,_,_), h(_,_,blend,_,_), Hs),        % 11
next(h(_,_,dunhill,_,_), h(_,horse,_,_,_), Hs),              % 12
member(h(_,_,blue_master,beer,_), Hs),                         % 13
member(h(german,_,prince,_,_), Hs),                       % 14
next(h(norwegian,_,_,_,_), h(_,_,_,_,blue), Hs),          % 15
member(h(_,_,_,water,_), Hs),		% one of them drinks water
member(h(_,fish,_,_,_), Hs).		% one of them owns a zebra

next(A, B, Ls) :- append(_, [A,B|_], Ls).
next(A, B, Ls) :- append(_, [B,A|_], Ls).

