%--------------------Punto 1--------------------------------------

% contrato(N�mero, Distribuidor,, NombreProducto, regalia, tipoDeProducto, Derechos de Distribuci�n, Valor minimo).

contrato('A234', 'Distribuidor A','Game of Thrones','1Q2010', 2 , ['DVD', 'BlueRay', 'TVP', 'Streaming'], 25000 ).
contrato('A423', 'Distribuidor B', 'El hombre invisible', '1M2020', 1, ['DVD', 'Streaming'], 12500).
contrato('A120', 'Distribuidor A', 'Mentes Criminales', '2M2515', 2, ['TVP', 'Streaming'], 7500).
contrato('A540', 'Distribuidor B', 'Lluvia Negra', '3M3520', 1, ['DVD', 'BlueRay'], 10000).
contrato('A255', 'Distribuidor A', 'CSI Las Vegas', '3M3520', 2,['DVD', 'Streaming'], 30000).
contrato('A566', 'Distribuidor B', 'Cazafantasnas', '1Q2010', 1, ['Cine'], 50000).
contrato('A897', 'Distribuidor A', 'Sherlock Holmes', '1M2020', 2, ['DVD', 'BlueRay', 'TVP', 'Streaming'] , 75000 ).
contrato('A123', 'Distribuidor C', 'El Rey Leon', '2Q3015', 1, ['DVD', 'BlueRay', 'TVP', 'Streaming'] , 65000).
contrato('A453', 'Distribuidor B', 'La odisea de los giles', '1M2020', 1, ['Cine'], 35000).
contrato('A690', 'Distribuidor C', 'El Robo del Siglo', '1Q2010', 1, ['Cine'], 45000).

% ingresoMensual(N�mero Contrato, fecha Ingreso (D�a, Mes, A�o), MontoIngreso, MontoGastos, Pais).

ingresoMensual('A123', fechaIngreso(15,03,2020), 45000, 17500, 1).
ingresoMensual('A123', fechaIngreso(31,03,2020), 20000, 16500, 1).
ingresoMensual('A123', fechaIngreso(30,06,2020), 50000, 22500, 3).
ingresoMensual('A453', fechaIngreso(12,06,2020), 30000, 15000, 2).
ingresoMensual('A453', fechaIngreso(28,06,2020), 25000, 15000, 2).
ingresoMensual('A690', fechaIngreso(02,02,2020), 12000, 13500, 3).
ingresoMensual('A690', fechaIngreso(29,02,2020), 95500, 13500, 3).
ingresoMensual('A690', fechaIngreso(31,03,2020), 80000, 12500, 1).
ingresoMensual('A897', fechaIngreso(16,03,2020), 40000, 17000, 2).
ingresoMensual('A897', fechaIngreso(31,03,2020), 15000, 17000, 2).
ingresoMensual('A897', fechaIngreso(02,29,2020), 50000, 17000, 1).
ingresoMensual('A566', fechaIngreso(30,04,2020), 50000, 16500, 3).
ingresoMensual('A255', fechaIngreso(10,04,2020), 72000, 14500, 3).
ingresoMensual('A255', fechaIngreso(30,04,2020), 90000, 14500, 3).
ingresoMensual('A540', fechaIngreso(12,06,2020), 30000, 10800, 2).
ingresoMensual('A540', fechaIngreso(30,06,2020), 30800, 10700, 2).
ingresoMensual('A540', fechaIngreso(31,07,2020), 30500, 10600, 1).
ingresoMensual('A120', fechaIngreso(31,07,2020), 25500, 23400, 1).
ingresoMensual('A234', fechaIngreso(15,05,2020), 75600, 12800, 1).
ingresoMensual('A234', fechaIngreso(31,05,2020), 75600, 12800, 1).

%regalia(regalia, nombre, %pagar, %costo, pais).

regalia('1Q2010', 'Regalia 1', 0.20, 0.10, 1).
regalia('1M2020', 'Regalia 2', 0.20, 0.20, 2).
regalia('2Q3015', 'Regalia 3', 0.30, 0.15, 1).
regalia('2M2515', 'Regalia 4', 0.25, 0.15, 2).
regalia('3M3520', 'Regalia 5', 0.35, 0.20, 3).

%tipoProducto(Id, Nombre).

tipoProducto(1, 'Pelicula').
tipoProducto(2, 'Serie').

%paises(Id, Nombre).
%
pais(1, 'Argentina').
pais(2, 'Brasil').
pais(3, 'Uruguay').

%contrato(NumeroDeContrato, Distribuidor, Nombre del Producto, Regalia, Tipo de Producto, Derechos de Distribucion, Valor Minimo a Pagar)
%regalia(Regalia, Nombre, %Pagar, %Costo, Pais)
%ingresosMensual(NumeroDeContrato, FechaDeIngreso(Dia,Mes,Año),MontoIngreso,MontoGasto,Pais)
%

%Funciones Auxiliares------------------------------------------------------------------
%




%Item 2 ----------------------------------------------------------------
% Informar si existe un contrato que solo tenga como Derecho de
% distribución “Cine”.

item2():-contrato(_,_,_,_,_,['Cine'],_),!.


%Item 3 ----------------------------------------------------------------
% Generar una regla que a partir del Número de Contrato determine el
% Monto de la Regalía para a abonar en un Mes determinado.

item3Aux(NC,M,MR,NM,PCOST):- contrato(NC,_,_,R,_,_,MM),
                        regalia(R,_,PP,PC,_), 
                        ingresoMensual(NC,fechaIngreso(_,M,_),MI,GD,_),
    					PCOST is ((MI - GD)* PC),
       					NM is (MI - GD - PCOST),
                        MR is ((NM - MM) * PP).


item3(NC,M,TOT):- findall(T,item3Aux(NC,M,T,_,_),L), sumlist(L,TOT).

%Item 4 ----------------------------------------------------------------
%Generar una regla que permita determinar el pago total
%mensual, pasando por argumento el Número de
%Contrato y el Mes que se desea abonar.

item4Aux(NC,Mes,PST):-contrato(NC,_,_,_,_,_,MM),
                    item3Aux(NC,Mes,MR,NM,_),
                        (                        
                            (NM > MM,
                            PST is MM + MR);
                            
                            (NM =< MM,
                            PST is MM)
                        ).


item4(NC,Mes,PT):-findall(PST,(item4Aux(NC,Mes,PST)),Lista),
	                   sumlist(Lista,PT).

%Item 5 ----------------------------------------------------------------
%Dado un valor y un mes determinados (argumentos),
%generar una lista ordenada con los Número de Contrato
%cuyo Monto Total a Pagar (Monto Mínimo + Monto de la
%Regalía) sea mayor a ese valor y que corresponda a ese
%mes.


item5Aux(V,Mes,NC):- ingresoMensual(NC,fechaIngreso(_,Mes,_),_,_,_),item4Aux(NC,Mes,PST), PST > V.

item5(V,Mes,ListO):- findall(NC,(item5Aux(V,Mes,NC)),List), sort(List,ListO).


%Item 6 ----------------------------------------------------------------
%Informar Numero de Contrato, Nombre del Producto,
%Nombre de la Regalía, el Nombre del Tipo de Producto
%solo de los Contratos que tengan al menos 3 derechos
%de distribución y cuyo Monto Mínimo a Pagar sea mayor
%a un valor pasado por argumento.

item6(MM,NC,NP,NR,NTP):-contrato(NC,_,NP,R,TP,DD,MMP), 
                        length(DD,T), 
                        T >= 3, 
                        MMP > MM, 
                        regalia(R,NR,_,_,_),
                        tipoProducto(TP,NTP).