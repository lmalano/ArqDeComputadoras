`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2019 17:57:44
// Design Name: 
// Module Name: MUX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX #(NB_DATA = 8,N_SELECT = 3)
  (//SE DEFINEN LOS ANCHOS DE BUSES SEGUN LOS VALORES DE LOS PARAMETROS
   input [NB_DATA-1:0] entMux,
    input [N_SELECT-1:0] selMux,
    output [NB_DATA-1:0] opA,
    output [NB_DATA-1:0] opB,
    output [NB_DATA-1:0] cod
    );
    
    reg[NB_DATA-1:0] regOpA; //registro que almacena el operando 1
    reg[NB_DATA-1:0] regOpB; //registro que almacena el operando 2
    reg[NB_DATA-1:0] regCod; //registro que almacena el codgigo de operacion
    
    //SETEA LOS VALORES DE LOS REGISTROS EN LAS SALIDAS
    assign opA = regOpA;
    assign opB = regOpB;
    assign cod = regCod;
    
    always@(*)
        //SEGUN SEA EL DATO QUE SE QUIERA CARGAR (opA, opB o codOp), SE GUARDA EN EL REGISTRO CORRESPONDIENTE
        case(selMux)
            3'b001: regOpA <= entMux;
            3'b010: regOpB <= entMux;
            3'b100: regCod <= entMux;
        endcase
endmodule
