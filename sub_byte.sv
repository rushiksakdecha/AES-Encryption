

// Create Date: 14.02.2026 16:29:44

module sub_byte(
input [7:0]in_sub[0:3][0:3],
output [7:0]out_sub[0:3][0:3]
    );
    genvar i,j;
    generate 
        for(i=0;i<4;i=i+1) begin : row
            for(j=0;j<4;j=j+1) begin: col
                sbox s(
                .in(in_sub[j][i]),
                .aes_sbox(out_sub[j][i])
                );
            end
        end
    endgenerate
endmodule
