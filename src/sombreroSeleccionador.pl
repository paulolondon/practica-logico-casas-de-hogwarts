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

corajudo(harry).
amistoso(harry).
orgulloso(harry).
inteligente(harry).

inteligente(hermione).
orgulloso(hermione).
responsable(hermione).

inteligente(draco).
orgulloso(draco).


%tieneCaracterApropiado(Mago, Casa):-
  % todas las caracteristicas buscadas por la casa
  % las tiene ese mago

tieneCaracterApropiado(Mago, gryffindor):-
  corajudo(Mago).
tieneCaracterApropiado(Mago, slytherin):-
  orgulloso(Mago),
  inteligente(Mago).
tieneCaracterApropiado(Mago, ravenclaw):-
  inteligente(Mago),
  responsable(Mago).
tieneCaracterApropiado(Mago, hufflepuff):-
  amistoso(Mago).