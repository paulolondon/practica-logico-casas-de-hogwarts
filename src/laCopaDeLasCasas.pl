%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parte 2 - La copa de las casas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

accion(harry, fueraDeCama).
accion(hermione, irA(tercerPiso)).
accion(hermione, irA(seccionRestringida)).
accion(harry, irA(bosque)).
accion(harry, irA(tercerPiso)).
accion(draco, irA(mazmorras)).
accion(ron, buenaAccion(ganarAjedrezMagico, 50)).
accion(hermione, buenaAccion(usarIntelecto, 50)).
accion(harry, buenaAccion(ganarAVoldemort, 60)).

% Lugares prohibidos
lugarProhibido(bosque, 50).
lugarProhibido(seccionRestringida, 10).
lugarProhibido(tercerPiso, 75).

% Casas de los alumnos
esDe(hermione, gryffindor).
esDe(ron, gryffindor).
esDe(harry, gryffindor).
esDe(draco, slytherin).
esDe(luna, ravenclaw).

% Cálculo de puntos por acción
puntosAccion(fueraDeCama, -50).
puntosAccion(irA(Lugar), Puntos) :-
    lugarProhibido(Lugar, PuntosNeg),
    Puntos is -PuntosNeg.
puntosAccion(irA(_), 0).
puntosAccion(buenaAccion(_, Puntos), Puntos).

% Cálculo de puntos totales para un alumno
puntosAlumno(Alumno, PuntosTotales) :-
    accion(Alumno, _).
    findall(Puntos, 
            (accion(Alumno, Accion), puntosAccion(Accion, Puntos)), 
            ListaPuntos),
    sum_list(ListaPuntos, PuntosTotales).

% Cálculo de puntos totales para una casa
puntosCasa(Casa, PuntosTotales) :-
    esDe(_, Casa).
    findall(PuntosAlumno, 
            (esDe(Alumno, Casa), puntosAlumno(Alumno, PuntosAlumno)), 
            ListaPuntos),
    sum_list(ListaPuntos, PuntosTotales).

% Determinar la casa ganadora
casaGanadora(Casa) :-
    esDe(_, Casa).
    findall(Puntos-C, puntosCasa(C, Puntos), Puntuaciones),
    max_member(PuntosMax-Casa, Puntuaciones).

buenAlumno(Alumno) :-
    accion(Alumno, _),
    not(accion(Alumno,Accion),puntosAccion(Accion,Puntos), Puntos < 0)