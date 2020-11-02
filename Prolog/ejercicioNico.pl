%hechos
chofer(10101,'Juan_de_la_Prueba',direccion('Cabrera',123),12.45,'No',licencia(2018,'D1')).
chofer(10021,'German_de_la_Prueba',direccion('Alvear',125),12.45,'Si',licencia(2016,'D2')).
chofer(10034,'Jose_de_la_Prueba',direccion('Santiago_del_Estero',454),15.60,'Si',licencia(2016,'D2')).
chofer(10343,'Esteban_de_la_Prueba',direccion('San_Juan',556),15.60,'No',licencia(2017,'D1')).
chofer(12034,'Carlo_de_la_Prueba',direccion('San_Martin',52),11.50,'No',licencia(2017,'D2')).
chofer(44312,'Ignacio_de_la_Prueba',direccion('Belgrano',435),12.45,'Si',licencia(2017,'D2')).
chofer(14553,'Marcos_de_la_Prueba',direccion('Belgrano',743),12.45,'Si',licencia(2016,'D1')).
chofer(4532,'Oscar_de_la_Prueba',direccion('Ayacucho',566),15.60,'No',licencia(2018,'D2')).
chofer(12344,'Mariano_de_la_Prueba',direccion('Vilcapugio',454),11.50,'Si',licencia(2018,'D2')).
chofer(34398,'Juan_Carlos_de_la_Prueba',direccion('Salta',124),14.80,'No',licencia(2018,'D1')).
tramo(1,'Tramo_A',200,1,6,10101).
tramo(2,'Tramo_B',150,4,3,12034).
tramo(3,'Tramo_C',80,4,2,10343).
tramo(4,'Tramo_D',150,6,5,44312).
tramo(5,'Tramo_E',100,1,2,14553).
tramo(6,'Tramo_F',200,1,4,10101).
tramo(7,'Tramo_G',80,1,5,12344).
tramo(8,'Tramo_H',200,5,1,34398).
tramo(9,'Tramo_I',150,5,4,4532).
localidad(1,'Cordoba').
localidad(2,'Coronel_Moldes').
localidad(3,'Adelia_Maria').
localidad(4,'Rio_Cuarto').
localidad(5,'Villa_Maria').
localidad(6,'San_Francisco').
% familia(chofer,[nombre hijos]).
familia(10101,[]).
familia(10021,[juan,marcos]).
familia(10034,[maria,josefina,pedro]).
familia(10343,[leonardo,matias,maximo]).
familia(12034,[]).
familia(44312,[tiziano]).
familia(14553,[thiago,agostina]).
familia(4532,[thomas,benjamin,milena]).
familia(12344,[gabriel,selene]).
familia(34398,[maximo]).

% Determinar Nombre, Dirección completa y Refrigerio de los choferes que
% tiene tramos con Origen en la Ciudad de Córdoba

punto1(Nom,Dir,Ref):-chofer(Leg,Nom,Dir,_,Ref,_),tramo(_,_,_,Orig,_,Leg),localidad(Orig,'Cordoba').

% Informar el Nombre del chofer, la localidad de origen, la localidad
% de destino y el nombre del tramo de
% aquellos tramos cuya distancia es superior a un valor de referencia

punto2(Nom,NombreOrigen,NombreDestino,NomTram,Valor):- chofer(Leg,Nom,_,_,_,_),tramo(_,NomTram,Dist,Orig,Dest,Leg),localidad(Orig,NombreOrigen),localidad(Dest,NombreDestino),Dist > Valor.

% Determinar por cada chofer cual es el total que se le paga por
% recorrer el tramo asignado sabiendo que el total se calcula c mo el
% producto entre la distancia del tramo por el precio por kilómetro más
% un 20% adicional si cobra refrigerio.

punto4(Nom,Total):- (chofer(Leg,Nom,_,PrecioKm,Refrig,_),tramo(_,_,Dist,_,_,Leg),Refrig = 'Si', Total is PrecioKm * Dist + (Dist* PrecioKm * 0.20))
;chofer(Leg,Nom,_,PrecioKm,Refrig,_),tramo(_,_,Dist,_,_,Leg),Refrig = 'No', Total is PrecioKm * Dist.


% Indicar la cantidad de choferes que tienen un tipo de licencia X
% findall(UnaVariable,UnObjetivo,UnaLista):

punto5(Cant,Tipo):- findall(Leg,(chofer(Leg,_,_,_,_,licencia(_,Tipo))),L),length(L,Cant).

% Indicar la cantidad de tramos definidos para un Origen X

punto6(Cant,Origen):- findall(Num,((tramo(Num,_,_,Numero,_,_),localidad(Numero,Origen))),L),length(L,Cant).

% 7. Listar el nombre del chofer, la dirección, el total a cobrar de
% todos aquellos choferes que tengan la licencia de un tipo X.

punto7(Nom,Calle,NumCalle,Total,Tipo):-chofer(_,Nom,direccion(Calle,NumCalle),_,_,licencia(_,Tipo)),punto4(Nom,Total).

% Indicar el nombre de los choferes que tienen más de 2 hijos
% familia(10021,[juan,marcos]).


punto8(Nombre):-chofer(Leg,Nombre,_,_,_,_),familia(Leg,Lista),length(Lista,CantHijos),CantHijos > 2.

% Indicar el nombre de los choferes que tienen un hijo llamado "maximo"

punto9(Nombre):-chofer(Leg,Nombre,_,_,_,_),familia(Leg,Lista),member('maximo',Lista).

%Mostrar el sueldo que perciben los choferes que tienen más de 2 hijos.

punto10(Nombre,Monto):-punto8(Nombre),punto4(Nombre,Monto).

% Determine cual es la cantidad de hijos promedio entre los choferes

punto11(Promedio):-findall(CantHijos,(familia(_,Lista),length(Lista,CantHijos)),ListaN),sumlist(ListaN, Numerador),