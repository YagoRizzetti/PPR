%Una veterinaria ofrece un nuevo servicio de paseo de mascotas, 
%y necesita un programa en Prolog que le brinde cierta información 
%sobre los paseos realizados. Cada paseo está a cargo de un paseador 
%autorizado por la veterinaria. Los paseos se realizan en grupos de hasta 5 mascotas por vez, 
%como así también en forma individual. La veterinaria paga un importe a cada paseador por cada paseo 
%realizado, para lo cual se aplica una tarifa expresada en tiempo de 60 minutos, la cual depende de la 
%cantidad de mascotas llevadas en cada paseo y de la duración que haya tenido ese paseo.

paseo(1,'20000000',fecha(1,10,2020),['A','B','C'],25).
paseo(2,'15000000',fecha(1,10,2020),['B','E'],30).
paseo(3,'8000000',fecha(2,10,2020),['A','B','C','D','E'],20).
paseo(4,'20000000',fecha(2,10,2020),['A'],20).
paseo(5,'12000000',fecha(3,10,2020),['C','D','E'],40).
paseo(6,'15000000',fecha(3,10,2020),['B','D'],40).

paseador('8000000','Emilia','Estrada').
paseador('12000000','Delia','Lizárraga').
paseador('15000000','Rocío','Albinoni').
paseador('20000000','Nico','Pointer').

tarifa_60_min(1,'paseo exclusivo',50).
tarifa_60_min(2,'paseo de a dos',80).
tarifa_60_min(3,'paseo triple',100).
tarifa_60_min(4,'paseo de dos pares',120).
tarifa_60_min(5,'paseo quíntuple',150).

%1)Conocer si entre los paseos realizados, se realizó o no, 
%algún paseo a cargo de un paseador cuyo DNI se recibe como argumento en la regla. 
%Predicado sugerido para esta regla: regla1/1.

regla1(DNI):-paseo(_,DNI,_,_,_),!.

%2)Conocer para un determinado número de paseo que se deberá especificar, 
%los siguientes datos: apellido y nombre del paseador, día, mes en el que se realizó el paseo, 
%y la cantidad de minutos que duró el paseo. Predicado sugerido para esta regla: regla2/6. 

regla2(Num,Ape, Nom,Dia,Mes,CantMin):-paseo(Num,DNI,fecha(Dia,Mes,_),_,CantMin), paseador(DNI,Nom,Ape).

%3)Generar una lista con las descripciones de aquellos paseos realizados durante cierto día y mes 
%que se especifican. En la lista a generar no deberán figurar nombres de paseos repetidos en caso 
%que dicho día y mes se hayan realizado más de una vez el mismo tipo de paseo; por lo tanto se deberán 
%eliminar de la lista a generar aquellos nombres de paseos que llegaran a estar repetidos. 
%Predicado sugerido para esta regla: regla3/3.

filtrarDesc(Dia,Mes,Desc):- paseo(_,_,fecha(Dia,Mes,_),Lis,_),length(Lis,Cant),tarifa_60_min(Cant,Desc,_).

regla3(Dia,Mes,Lista):-findall(Desc,(filtrarDesc(Dia,Mes,Desc)),L), sort(L,Lista).