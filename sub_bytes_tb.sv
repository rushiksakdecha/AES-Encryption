`timescale 1ns / 1ps

// Create Date: 15.02.2026 10:34:19

module sub_bytes_tb();
reg [7:0]in[3:0][3:0];
reg [7:0]out[3:0][3:0];
integer i,j;
sub_byte sub(
.in_sub(in),
.out_sub(out)
    );
    
    initial begin
        // Column 0
        in[0][0] = 8'h00;
        in[1][0] = 8'h11;
        in[2][0] = 8'h22;
        in[3][0] = 8'h33;
        
        // Column 1
        in[0][1] = 8'h44;
        in[1][1] = 8'h55;
        in[2][1] = 8'h66;
        in[3][1] = 8'h77;
        
        // Column 2
        in[0][2] = 8'h88;
        in[1][2] = 8'h99;
        in[2][2] = 8'haa;
        in[3][2] = 8'hbb;
        
        // Column 3
        in[0][3] = 8'hcc;
        in[1][3] = 8'hdd;
        in[2][3] = 8'hee;
        in[3][3] = 8'hff;
        
        #10;
        for(i=0;i<4;i=i+1) begin
            for(j=0;j<4;j=j+1) begin
                $display("out[%d][%d]=%h",j,i,out[j][i]);
                #1;
            end
        end
    end
endmodule
