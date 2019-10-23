`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2019 18:10:44
// Design Name: 
// Module Name: ALU
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


module ALU#(NB_DATA = 8) //PARAMTERO: VALOR POR DEFECTO: 8
(//SE DEFINEN LOS ANCHOS DE BUSES SEGUN EL VALOR DEL PARAMETRO
    input [NB_DATA-1:0] opA,
    input [NB_DATA-1:0] opB,
    input [NB_DATA-1:0] cod,
    output [NB_DATA-1:0] result
    );
reg[NB_DATA-1:0] regResult;

assign result = regResult;

/*localparam SUM = 8'b00100000,
           SUB = */

always@(*)
    //SEGUN EL CODIGO DE OPERACION CARGADO, SE REALIZA LA OPERACION CORRESPONDIENTE
    case(cod)
        8'b00100000: regResult <= opA + opB;    //ADD
        8'b00100010: regResult <= opA - opB;    //SUB
        8'b00100100: regResult <= opA & opB;    //AND
        8'b00100101: regResult <= opA | opB;    //OR
        8'b00100110: regResult <= opA ^ opB;    //XOR
        8'b00000011: regResult <= opA >> opB;   //SRA
        8'b00000010: regResult <= opA << opB;   //SRL
        8'b00100111: regResult <= ~(opA | opB); //NOR
    endcase
endmodule


