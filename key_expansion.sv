// che=ange the order or roundkey here w 

// Create Date: 12.02.2026 19:00:41


module key_expansion(
input [7:0]key[0:3][0:3],
output reg [31:0]w[0:10][0:3]
//output  [31:0]w[10:0][3:0]
    );
 wire [31:0]wwire[0:10] ;  
    
     
    always@(*) begin
            w[0][0]={key[0][0],key[0][1],key[0][2],key[0][3]};
            w[0][1]={key[1][0],key[1][1],key[1][2],key[1][3]};
            w[0][2]={key[2][0],key[2][1],key[2][2],key[2][3]};
            w[0][3]={key[3][0],key[3][1],key[3][2],key[3][3]};
    end
    
    genvar i;
    generate 
    for(i=0;i<10;i=i+1) begin:g_fucnt
        g_function gf(
        .W(w[i][3]),
        .rounds(i),
        .W_dash(wwire[i])
        );
        always@(*) begin
            
            w[i+1][0] = wwire[i] ^ w[i][0];
            w[i+1][1] = w[i+1][0] ^ w[i][1];
            w[i+1][2] = w[i+1][1] ^ w[i][2];
            w[i+1][3] = w[i+1][2] ^ w[i][3];
        end
        
//          assign  w[0][0]={key[0][0],key[1][0],key[2][0],key[3][0]};
//          assign  w[0][1]={key[0][1],key[1][1],key[2][1],key[3][1]};
//          assign  w[0][2]={key[0][2],key[1][2],key[2][2],key[3][2]};
//          assign  w[0][3]={key[0][3],key[1][3],key[2][3],key[3][3]};
//          assign  w[i+1][0] = wwire[i] ^ w[i][0];
//          assign  w[i+1][1] = w[i+1][0] ^ w[i][1];
//          assign  w[i+1][2] = w[i+1][1] ^ w[i][2];
//          assign  w[i+1][3] = w[i+1][2] ^ w[i][3];
    end
    endgenerate
    
endmodule
