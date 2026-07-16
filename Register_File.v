`timescale 1ns / 1ps

module Register_File(
    input clk, WE3,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    output reg [31:0] RD1, RD2
    );

    reg [31:0] RF [0:31];
    
    integer i;
    initial 
    begin
        for (i = 0; i < 32; i = i + 1) begin
            RF[i] = 32'b0;
        end
    end
    
    always @(posedge clk) begin
        if (WE3 && A3 != 5'b00000)
            RF[A3] <= WD3;   
    end

    always @(*) begin
        RD1 = RF[A1];
        RD2 = RF[A2];
    end

endmodule