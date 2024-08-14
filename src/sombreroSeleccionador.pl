%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parte 1 - Sombrero Seleccionador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parte 1 - Sombrero Seleccionador

% Características de los magos
caracteristica(harry, corajudo).
caracteristica(harry, amistoso).
caracteristica(harry, orgulloso).
caracteristica(harry, inteligente).
sangre(harry, mestiza).
odia(harry, slytherin).

caracteristica(draco, inteligente).
caracteristica(draco, orgulloso).
sangre(draco, pura).
odia(draco, hufflepuff).

caracteristica(hermione, inteligente).
caracteristica(hermione, orgullosa).
caracteristica(hermione, responsable).
sangre(hermione, impura).

% Características requeridas por las casas
requiere(gryffindor, corajudo).
requiere(slytherin, orgulloso).
requiere(slytherin, inteligente).
requiere(ravenclaw, inteligente).
requiere(ravenclaw, responsable).
requiere(hufflepuff, amistoso).

mago(Mago):-
    sangre(Mago, _).


casa(Casa):-
    requiere(Casa,_).

permiteEntrada(Casa,Mago) :-
    casa(Casa),
    Casa \= slytherin.
permiteEntrada(Casa,Mago) :-
    sangre(Mago,Sangre),
    Sangre \= impura.

caracterApropiado(Mago, Casa) :-
    casa(Casa),
    mago(Mago),
    forall(requiere(Casa, Caracteristica), 
        caracteristica(Mago, Caracteristica)).

puedeQuedarSeleccionado(Mago, Casa) :-
    caracterApropiado(Casa,Mago),
    permiteEntrada(Mago,Casa),
    not(odia(Mago,Casa)).

cadenaDeAmistades(Magos):-
    forAll(member(Mago,Magos),caracteristica(Mago,amistoso)),
    mismaCasa(Magos).

cadenaMismaCasa([]).
cadenaMismaCasa([_]).
cadenaMismaCasa(Mago1, Mago2 | Magos):-
    puedeQuedarSeleccionado(Mago1, Casa),
    puedeQuedarSeleccionado(Mago2, Casa),
    cadenaMismaCasa(Mago2 | Magos).