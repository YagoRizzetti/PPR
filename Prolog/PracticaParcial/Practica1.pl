aspirantes('30000000','Lara','Pointer',11111,domicilio('Suipacha',250)).
aspirantes('35000000','Tina','Jolie',22222,domicilio('San Martin',101)).
aspirantes('25000000','Paty','Perez',4444,domicilio('Rivadavia',1321)).
aspirantes('20000000','Matilde','Smith',99999,domicilio('9 de julio',2123)).

estudiantes(1,'30000000',fechaEvaluacion(12,5,2019),items(['a','b','c']),puntaje(10,15,20)).
estudiantes(2,'20000000',fechaEvaluacion(12,5,2019),items(['b','c']),puntaje(12,15)).
estudiantes(3,'30000000',fechaEvaluacion(19,5,2019),items(['d','e']),puntaje(19,18)).
estudiantes(4,'20000000',fechaEvaluacion(19,5,2019),items(['a','d','e']),puntaje(6,15,12)).
estudiantes(5,'30000000',fechaEvaluacion(1,6,2019),items(['f']),puntaje(15)).

item('a','uniforme',10).
item('b','colaborador',15).
item('c','tareas',20).
item('d','compañerismo',20).
item('e','ingles',20).
item('f','portugues',15).

punto1(P1,P2):- item(_,_,P),(P =< P1 ; P >= P2).

punto2(C,Nom,Ape,Call,Alt):- estudiantes(C,DNI,_,_,_), aspirantes(DNI,Nom,Ape,_,domicilio(Call,Alt)).

punto3(Mes,Anio,ListaSinRep):-findall(DNI,(estudiantes(_,DNI,fechaEvaluacion(_,Mes,Anio),_,_)),L),sort(L,ListaSinRep). 