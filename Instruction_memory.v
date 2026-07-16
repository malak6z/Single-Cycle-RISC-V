`timescale 1ns / 1ps

module Instruction_memory(
        input  [31:0] A,
        output [31:0] RD
    );
  
    reg [31:0] mem [0:31];  
    integer i;
    
    initial 
    begin
       
        for (i = 0; i < 32; i = i + 1) begin
            mem[i] = 32'h00000000;
        end
        $readmemh("inst_mem.txt", mem);
    end 
    
    assign RD = mem [A[31:2]];
    
endmodule