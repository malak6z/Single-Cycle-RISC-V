
`timescale 1ns / 1ps

module SC_Risc_v_tb;
    reg Clk, Reset;
    integer i;

    SC_32_RISC_V Riscv (
        .Clk(Clk),
        .Reset(Reset)
    );

    initial 
    begin
        Clk = 1'b1;
    end

    always 
    begin
        #10 Clk = ~Clk;
    end

    initial 
    begin
       
        Reset = 1'b1;
        #20;
        Reset = 1'b0;
       
        
        #1000;
        
      
        for (i = 0; i < 11; i = i + 1) begin
            $display("x%0d = %0d (0x%h)", i, Riscv.Processor.DP.RF.RF[i], Riscv.Processor.DP.RF.RF[i]);
        end
        
       
        $finish;
    end

endmodule