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
sangre(neville, pura).
sangre(luna, pura).

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

% tieneCaracteristica(Mago, Caracteristica)
tieneCaracteristica(harry, coraje).
tieneCaracteristica(harry, orgullo).
tieneCaracteristica(harry, amistad).
tieneCaracteristica(harry, inteligencia).

tieneCaracteristica(draco, inteligencia).
tieneCaracteristica(draco, orgullo).

tieneCaracteristica(hermione, inteligencia).
tieneCaracteristica(hermione, orgullo).
tieneCaracteristica(hermione, responsabilidad).

tieneCaracteristica(neville, responsabilidad).
tieneCaracteristica(neville, coraje).
tieneCaracteristica(neville, amistad).

tieneCaracteristica(luna, amistad).
tieneCaracteristica(luna, inteligencia).
tieneCaracteristica(luna, responsabilidad).

caracteristicaBuscada(gryffindor, coraje).
caracteristicaBuscada(slytherin, orgullo).
caracteristicaBuscada(slytherin, inteligencia).
caracteristicaBuscada(ravenclaw, inteligencia).
caracteristicaBuscada(ravenclaw, responsabilidad).
caracteristicaBuscada(hufflepuff, amistad).

tieneCaracterApropiado(Mago, Casa):-
  % todas las caracteristicas buscadas por la casa
  % las tiene ese mago
  casa(Casa),
  mago(Mago),
  forall(caracteristicaBuscada(Casa, Caracteristica),
         tieneCaracteristica(Mago, Caracteristica)).

odiariaEntrar(harry, slytherin).
odiariaEntrar(draco, hufflepuff).

puedeQuedarSeleccionadoPara(Mago, Casa):-
  tieneCaracterApropiado(Mago, Casa),
  permiteEntrar(Casa, Mago),
  not(odiariaEntrar(Mago, Casa)).
puedeQuedarSeleccionadoPara(hermione, gryffindor).

cadenaDeAmistades(Magos):-
  todosAmistosos(Magos),
  cadenaDeCasas(Magos).

todosAmistosos(Magos):-
  forall(member(Mago, Magos), amistoso(Mago)).

amistoso(Mago):-
  tieneCaracteristica(Mago, amistad).

% cadenaDeCasas(Magos)
/*
cadenaDeCasas([Mago1, Mago2 | MagosSiguientes]):-
  puedeQuedarSeleccionadoPara(Mago1, Casa),
  puedeQuedarSeleccionadoPara(Mago2, Casa),
  cadenaDeCasas([Mago2 | MagosSiguientes]).
cadenaDeCasas([_]).
cadenaDeCasas([]).
*/

cadenaDeCasas(Magos):-
  forall(consecutivos(Mago1, Mago2, Magos),
         puedenQuedarEnLaMismaCasa(Mago1, Mago2, _)).

consecutivos(Anterior, Siguiente, Lista):-
  nth1(IndiceAnterior, Lista, Anterior),
  IndiceSiguiente is IndiceAnterior + 1,
  nth1(IndiceSiguiente, Lista, Siguiente).

puedenQuedarEnLaMismaCasa(Mago1, Mago2, Casa):-
  puedeQuedarSeleccionadoPara(Mago1, Casa),
  puedeQuedarSeleccionadoPara(Mago2, Casa),
  Mago1 \= Mago2.