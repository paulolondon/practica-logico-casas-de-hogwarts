%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parte 2 - La copa de las casas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hizo(harry, fueraDeCama).
hizo(hermione, irA(tercerPiso)).
hizo(hermione, irA(seccionRestringida)).
hizo(harry, irA(bosque)).
hizo(harry, irA(tercerPiso)).
hizo(draco, irA(mazmorras)).
hizo(ron, buenaAccion(50, ganarAlAjedrezMagico)).
hizo(hermione, buenaAccion(50, salvarASusAmigos)).
hizo(harry, buenaAccion(60, ganarleAVoldemort)).
hizo(cedric, buenaAccion(100, ganarAlQuidditch)).
hizo(hermione, responderPregunta(dondeSeEncuentraUnBezoar, 20, snape)).
hizo(hermione, responderPregunta(comoHacerLevitarUnaPluma, 25, flitwick)).

hizoAlgunaAccion(Mago):-
  hizo(Mago, _).
hizoAlgoMalo(Mago):-
  hizo(Mago, Accion),
  puntajeQueGenera(Accion, Puntaje),
  Puntaje < 0.

puntajeQueGenera(fueraDeCama, -50).
puntajeQueGenera(irA(Lugar), PuntajeQueResta):-
  lugarProhibido(Lugar, Puntos),
  PuntajeQueResta is Puntos * -1.
puntajeQueGenera(buenaAccion(Puntaje, _), Puntaje).
puntajeQueGenera(responderPregunta(_, Dificultad, snape), Puntos):-
  Puntos is Dificultad // 2.
puntajeQueGenera(responderPregunta(_, Dificultad, Profesor), Dificultad):- Profesor \= snape.

lugarProhibido(bosque, 50).
lugarProhibido(seccionRestringida, 10).
lugarProhibido(tercerPiso, 75).

esBuenAlumno(Mago):-
  hizoAlgunaAccion(Mago),
  not(hizoAlgoMalo(Mago)).
%% 1b

% hizo(Mago, Accion).

esRecurrente(Accion):-
  hizo(Mago, Accion),
  hizo(OtroMago, Accion),
  Mago \= OtroMago.

% 2

esDe(hermione, gryffindor).
esDe(ron, gryffindor).
esDe(harry, gryffindor).
esDe(draco, slytherin).
esDe(luna, ravenclaw).
esDe(cedric, hufflepuff).

puntajeTotalDeCasa(Casa, PuntajeTotal):-
  esDe(_, Casa),
  findall(Puntos,
    (esDe(Mago, Casa), puntosQueObtuvo(Mago, _, Puntos)),
    ListaPuntos),
  sum_list(ListaPuntos, PuntajeTotal).

puntosQueObtuvo(Mago, Accion, Puntos):-
  hizo(Mago, Accion),
  puntajeQueGenera(Accion, Puntos).

% 3

casaGanadora(Casa):-
  puntajeTotalDeCasa(Casa, PuntajeMayor),
  forall((puntajeTotalDeCasa(OtraCasa, PuntajeMenor), Casa \= OtraCasa),
         PuntajeMayor > PuntajeMenor).

casaGanadora2(Casa):-
  puntajeTotalDeCasa(Casa, PuntajeMayor),
  not((puntajeTotalDeCasa(_, OtroPuntaje), OtroPuntaje > PuntajeMayor)).