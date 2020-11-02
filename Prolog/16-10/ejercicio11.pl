
%FUCTOR o Predicados Compuestos
%
trabaja(ana, oficina).


% HECHOS
% usuario(identificador usuario, tipo de usuario).
usuario(2, trial(guille, fecha(10, 10, 2009))).
usuario(3, trial(luis, fecha(29, 9, 2009))).
usuario(4, trial(carlos, fecha(10, 10, 2020))).
usuario(5, premium(martin, 1000)).
hoy(fecha(16,10,2020)).

%1) El predicado estaVigente/1 determina si una .
%cuenta de usuario trial se creó hace un mes. 

estaVigente(Persona) :- usuario(_,trial(Persona, fecha(DD,MM,AA))), hoy(fecha(DD_ACT,MM_ACT,AA_ACT)), AA =:= AA_ACT, ( ( MM =:= MM_ACT ); ( D is MM_ACT - MM, D =:= 1, DD_ACT < DD ) ).                 

% 2)El predicado estaDisponible/1 indica si un nombre de usuario está % disponible, es decir, %no fue tomado aún, por ningún usuario premium % ni trial. 
%
estaDisponible(Nombre):- not(usuario(_,premium(Nombre,_))), not(estaVigente(Nombre)). 