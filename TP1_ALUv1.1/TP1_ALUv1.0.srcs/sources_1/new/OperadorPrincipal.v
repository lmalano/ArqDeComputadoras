`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2019 18:43:37
// Design Name: 
// Module Name: OperadorPrincipal
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


module OperadorPrincipal#(NB_DATA = 8, N_SELECT = 3)
(
    input [NB_DATA-1:0] dato,
    input [N_SELECT-1:0] selector,
    output [NB_DATA-1:0] resultado,
    output [NB_DATA-2:0] seg,
    output [3:0]an //salida de displays. Valor fijo
    );
    wire [NB_DATA-1:0]datoA;        //TRANSPORTA DATO A ENTRE MUX Y ALU
    wire [NB_DATA-1:0]datoB;        //TRANSPORTA DATO B ENTRE MUX Y ALU
    wire [NB_DATA-1:0]codOp;        //TRANSPORTA DATO C ENTRE MUX Y ALU
    reg [NB_DATA-2:0]display;       //SALIDA A LOS 7 SEGMENTOS DE UN DISPLAY
    reg [3:0]dispSelect;    //SELECCIONA ENTRE LOS 4 DISPLAYS
    assign seg = display;   //LA SALIDA seg TENDRA SIEMPRE EL VALOR DEL REG display EN TIEMPO REAL. MUESTRA EL NUMERO DE LA OPERACION (LOGICA NEGATIVA)
    assign an = 4'b1110;    //ACTIVA SOLO EL PRIMER DISPLAY
    
    MUX#(NB_DATA,N_SELECT) mux1(dato, selector, datoA, datoB, codOp);    //INSTANCIO UN MULTIPLEXOR CON BUS DE DATOS DE 8 BITS Y DE SELECCION DE 3 BITS
    ALU#(NB_DATA) alu1(datoA,datoB,codOp,resultado);              //INSTANCIO UNA ALU
    
    always@(*)
        //SEGUN EL CODIGO DE OPERACION, MUESTRA UN VALOR EN EL DISPLAY
        case(codOp)
            8'b00100000: display = ~7'b0111111; //ADD
            8'b00100010: display = ~7'b0000110; //SUB
            8'b00100100: display = ~7'b1011011; //AND
            8'b00100101: display = ~7'b1001111; //OR
            8'b00100110: display = ~7'b1100110; //XOR
            8'b00000011: display = ~7'b1101101; //SRA
            8'b00000010: display = ~7'b1111101; //SRL
            8'b00100111: display = ~7'b0000111; //NOR
            default: display = 7'b0111111; //CODIGO INVALIDO
        endcase
    //ALU alu1(.opA(datoA), .opB(datoB), .cod(codOP), .result(resultado));
endmodule
