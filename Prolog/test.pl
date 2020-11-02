%vendedor(codigo,apellido,nombre,codigoSucursal)
vendedor(1111,'Linares', 'Indiana',1).
vendedor(2222,'Marchetti', 'Sofía',1).
vendedor(3333,'Luchetti', 'María Emilia',1).
vendedor(4444,'Bravi', 'Emilio', 2).
vendedor(5555,'Luchetti', 'Vera',2).

%sucursal(codigo,nombre)
sucursal(1,'Buenos Aires').
sucursal(2,'Córdoba').

%resumenAnual(año,cantidadFacturada,montoFacturado,codigoVendedor)
resumenAnual(2007,5000,25000,1111).
resumenAnual(2008,6000,33000,1111).
resumenAnual(2009,8500,53125,3333).
resumenAnual(2010,3000,21000,2222).
resumenAnual(2011,2500,20000,2222).
resumenAnual(2007,3500,23625,4444).
resumenAnual(2008,8000,56800,5555).
resumenAnual(2009,4500,32625,5555).
resumenAnual(2010,9000,74250,4444).
resumenAnual(2011,8500,72250,5555).

%Cual es el nombre de la sucursal de un vendedor determinado
punto1(CV,NS) :- vendedor(CV,_,_,CS),sucursal(CS,NS).

% 2. En qué años y en cuáles sucursales (nombre) hubo más de 5000
% pedidos facturados.
punto2(A,NS) :- resumenAnual(A,CF,_,CV), CF > 5000, punto1(CV,NS).


%3.     Para cada año, cuánto fue el importe donado por la sucursal
%       Córdoba.
%       La sucursal de Córdoba tiene una política propia de donar el 10%
%       del monto total recaudado a una fundación propia.
punto3(A,ID) :- resumenAnual(A,_,TF,CV),
                vendedor(CV,_,_,CS),
                CS == 2,
                ID is (TF * 0.10).


%4.     Para cada año, qué importe en impuestos se debió pagar en cada
%       sucursal.
%       Las sucursales deben pagar impuestos, en Buenos Aires se debe pagar el 25% del monto total facturado, en
%       Córdoba es el 30% del monto total facturado.
punto4(A,II) :- resumenAnual(A,_,TF,CV),
                vendedor(CV,_,_,CS),
                ( (CS == 1, II is (TF * 0.25)) ; (CS == 2, II is (TF * 0.30)) ).

%5.     En cada sucursal, para cada año, de cuánto fue el importe
%       promedio facturado por cada pedido
punto5(NS, A, IP) :- resumenAnual(A, CF, TF, CV).