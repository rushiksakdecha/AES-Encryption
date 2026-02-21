`timescale 1ns / 1ps

// Create Date: 15.02.2026 12:16:32

module mix_column_tb();

reg [7:0]in[3:0][3:0];
reg [7:0]out[3:0][3:0];
integer i,j;

mix_column mix(
.mix_in(in),
.mix_out(out)
    );
    
    initial begin
    // Input
    // Row 0
    in[0][0] = 8'hD4;
    in[0][1] = 8'hE0;
    in[0][2] = 8'hB8;
    in[0][3] = 8'h1E;

    // Row 1
    in[1][0] = 8'hBF;
    in[1][1] = 8'hB4;
    in[1][2] = 8'h41;
    in[1][3] = 8'h27;

    // Row 2
    in[2][0] = 8'h5D;
    in[2][1] = 8'h52;
    in[2][2] = 8'h11;
    in[2][3] = 8'h98;

    // Row 3
    in[3][0] = 8'h30;
    in[3][1] = 8'hAE;
    in[3][2] = 8'hF1;
    in[3][3] = 8'hE5;
    
    
        #10;
        for(i=0;i<4;i=i+1) begin
            for(j=0;j<4;j=j+1) begin
                $display("out[%d][%d]=%h",j,i,out[j][i]);
                #1;
            end
        end
    end
    
endmodule
