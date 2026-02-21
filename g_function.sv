

// Create Date: 10.02.2026 23:00:03


//module g_function(
//input  [31:0]W,
//input [3:0]rounds,
//output  reg [31:0]W_dash
//    );
//    reg [7:0]B[0:3];
//    reg [7:0]B_dash[0:3];
//    integer i;
    
//    genvar j;
//    generate 
//        for(j=0;j<4;j=j+1) begin : sbox
//            sbox nothing(B[j],B_dash[j]);  
//        end
//    endgenerate
    
//    always@(*) begin
//        for (i=0;i<4;i=i+1)
//        begin
//            B[i]=W[31 - 8*i -:8];
//        end
//        case(rounds)
//            4'b0000: //round 0
//            B_dash[1]=B_dash[1] ^ 8'h00;
            
//            4'b0001: //round 1
//            B_dash[1]=B_dash[1] ^ 8'h01;
            
//            4'b0010: //round 2
//            B_dash[1]=B_dash[1] ^ 8'h02;
            
//            4'b0011: //round 3
//            B_dash[1]=B_dash[1] ^ 8'h04;
            
//            4'b0100: //round 4
//            B_dash[1]=B_dash[1] ^ 8'h08;
            
//            4'b0101: //round 5
//            B_dash[1]=B_dash[1] ^ 8'h10;
            
//            4'b0110: //round 6
//            B_dash[1]=B_dash[1] ^ 8'h20;
            
//            4'b0111: //round 7
//            B_dash[1]=B_dash[1] ^ 8'h40;
            
//            4'b1000: //round 8
//            B_dash[1]=B_dash[1] ^ 8'h80;
            
//            4'b1001: //round 9
//            B_dash[1]=B_dash[1] ^ 8'h1b;
            
//            4'b1010: //round 10
//           B_dash[1]=B_dash[1] ^ 8'h36;
            
//            default:
//            B_dash[1]=B_dash[1] ^ 0;
            
//        endcase
//        W_dash={B_dash[1],B_dash[2],B_dash[3],B_dash[0]};
//    end
    

//endmodule



`timescale 1ns / 1ps

module g_function(
    input  wire [31:0] W,
    input  wire [3:0]  rounds,
    output wire [31:0] W_dash
);

    //////////////////////////
    // Split into bytes
    //////////////////////////
    
    wire [7:0] B0, B1, B2, B3;
    
    assign B0 = W[31:24];
    assign B1 = W[23:16];
    assign B2 = W[15:8];
    assign B3 = W[7:0];

    //////////////////////////
    // RotWord
    //////////////////////////
    
    wire [7:0] R0, R1, R2, R3;
    
    assign R0 = B1;
    assign R1 = B2;
    assign R2 = B3;
    assign R3 = B0;

    //////////////////////////
    // SubWord (S-box)
    //////////////////////////
    
    wire [7:0] S0, S1, S2, S3;

    sbox sbox0 (.in(R0), .aes_sbox(S0));
    sbox sbox1 (.in(R1), .aes_sbox(S1));
    sbox sbox2 (.in(R2), .aes_sbox(S2));
    sbox sbox3 (.in(R3), .aes_sbox(S3));

    //////////////////////////
    // Rcon
    //////////////////////////
    
    reg [7:0] rcon;

    always @(*) begin
        case (rounds)
            4'd0:  rcon = 8'h01;
            4'd1:  rcon = 8'h02;
            4'd2:  rcon = 8'h04;
            4'd3:  rcon = 8'h08;
            4'd4:  rcon = 8'h10;
            4'd5:  rcon = 8'h20;
            4'd6:  rcon = 8'h40;
            4'd7:  rcon = 8'h80;
            4'd8:  rcon = 8'h1B;
            4'd9: rcon = 8'h36;
 
            default: rcon = 8'h00;
        endcase
    end

    //////////////////////////
    // Final Output
    //////////////////////////
    
    assign W_dash = {
        S0 ^ rcon,   // XOR only MSB
        S1,
        S2,
        S3
    };

endmodule

