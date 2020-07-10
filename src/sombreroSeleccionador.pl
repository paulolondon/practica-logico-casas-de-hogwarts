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