%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parte 1 - Sombrero Seleccionador
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

casa(gryffindor).
casa(slytherin).
casa(hufflepuff).
casa(ravenclaw).

sangre(harry, mestiza).
sangre(draco, pura).
sangre(hermione, impura).

mago(Mago):-
  sangre(Mago, _).

% permiteEntrar(Casa, Mago)
permiteEntrar(Casa, Mago):-
  casa(Casa),
  mago(Mago),
  Casa \= slytherin.
permiteEntrar(slytherin, Mago):-
  sangre(Mago, TipoDeSangre),
  TipoDeSangre \= impura.

% caracteristicas(Mago, Caracteristicas)
caracteristicas(harry, [coraje, amistad, orgullo, inteligencia]).
caracteristicas(draco, [inteligencia, orgullo]).
caracteristicas(hermione, [inteligencia, orgullo, responsabilidad]).

caracteristicaBuscada(gryffindor, coraje).
caracteristicaBuscada(slytherin, orgullo).
caracteristicaBuscada(slytherin, inteligencia).
caracteristicaBuscada(ravenclaw, inteligencia).
caracteristicaBuscada(ravenclaw, responsabilidad).
caracteristicaBuscada(hufflepuff, amistad).

/*
tieneCaracterApropiado(Mago, Casa):-
  % todas las caracteristicas buscadas por la casa
  % las tiene ese mago
  caracteristicas(Mago, Caracteristicas),
  casa(Casa),
  forall(caracteristicaBuscada(Casa, Caracteristica),
        member(Caracteristica, Caracteristicas)).
*/
tieneCaracteristica(Mago, Caracteristica):-
  caracteristicas(Mago, Caracteristicas),
  member(Caracteristica, Caracteristicas).

tieneCaracterApropiado(Mago, Casa):-
  casa(Casa), mago(Mago),
  forall(caracteristicaBuscada(Casa, Caracteristica),
         tieneCaracteristica(Mago, Caracteristica)).