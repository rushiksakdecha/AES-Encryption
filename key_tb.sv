`timescale 1ns / 1ps
 
// Create Date: 12.02.2026 19:46:18


module key_tb();
reg [7:0]key[3:0][3:0];
reg [31:0]w[10:0][3:0];
integer i,j;

key_expansion dut(key,w);
initial begin
    key[0][0] = 8'h2b;
    key[1][0] = 8'h7e;
    key[2][0] = 8'h15;
    key[3][0] = 8'h16;
    
    key[0][1] = 8'h28;
    key[1][1] = 8'hae;
    key[2][1] = 8'hd2;
    key[3][1] = 8'ha6;
    
    key[0][2] = 8'hab;
    key[1][2] = 8'hf7;
    key[2][2] = 8'h15;
    key[3][2] = 8'h88;
    
    key[0][3] = 8'h09;
    key[1][3] = 8'hcf;
    key[2][3] = 8'h4f;
    key[3][3] = 8'h3c;

    
    
    #10;
    for (i=0;i<11;i=i+1)begin
        for (j=0;j<4;j=j+1)begin
          $display("w[%d][%d] = %h",i,j,w[i][j]);
        end
    end
end
endmodule
