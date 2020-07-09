%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parte 2 - La copa de las casas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fueraDeCama(harry).
fueA(hermione, tercerPiso).
fueA(hermione, seccionRestringida).
fueA(harry, bosque).
fueA(harry, tercerPiso).
fueA(draco, mazmorras).
buenaAccion(ron, 50, ganarAlAjedrezMagico).
buenaAccion(hermione, 50, salvarASusAmigos).
buenaAccion(harry, 60, ganarleAVoldemort).

lugarProhibido(bosque, 50).
lugarProhibido(seccionRestringida, 10).
lugarProhibido(tercerPiso, 75).

hizoAlgunaAccion(Mago):-
  fueraDeCama(Mago).
hizoAlgunaAccion(Mago):-
  fueA(Mago, _).
hizoAlgunaAccion(Mago):-
  buenaAccion(Mago, _, _).

hizoAlgoMalo(Mago):-
  hizoAlgoQueDioPuntos(Mago, Puntos),
  Puntos < 0.

hizoAlgoQueDioPuntos(Mago, -50):-
  fueraDeCama(Mago).
hizoAlgoQueDioPuntos(Mago, PuntosQueResta):-
  fueA(Mago, Lugar),
  lugarProhibido(Lugar, PuntosPorLugar),
  PuntosQueResta is PuntosPorLugar * -1.
hizoAlgoQueDioPuntos(Mago, Puntos):-
  buenaAccion(Mago, Puntos, _).

esBuenAlumno(Mago):-
  hizoAlgunaAccion(Mago),
  not(hizoAlgoMalo(Mago)).
/*
hizoAlgoMalo(Mago):-
  fueraDeCama(Mago).
hizoAlgoMalo(Mago):-
  fueA(Mago, Lugar),
  lugarProhibido(Lugar, _).
*/
