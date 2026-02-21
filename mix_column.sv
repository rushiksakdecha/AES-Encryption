`timescale 1ns / 1ps

// Create Date: 15.02.2026 12:01:17

module mix_column(
input [7:0]mix_in[0:3][0:3],
output reg [7:0]mix_out[0:3][0:3]
    );
reg [7:0] mix_mat [0:3][0:3];
integer i,j,k;
bit x; // for checking multipliction 

initial begin
    // Row 0
    mix_mat[0][0] = 8'h02;
    mix_mat[0][1] = 8'h03;
    mix_mat[0][2] = 8'h01;
    mix_mat[0][3] = 8'h01;

    // Row 1
    mix_mat[1][0] = 8'h01;
    mix_mat[1][1] = 8'h02;
    mix_mat[1][2] = 8'h03;
    mix_mat[1][3] = 8'h01;

    // Row 2
    mix_mat[2][0] = 8'h01;
    mix_mat[2][1] = 8'h01;
    mix_mat[2][2] = 8'h02;
    mix_mat[2][3] = 8'h03;

    // Row 3
    mix_mat[3][0] = 8'h03;
    mix_mat[3][1] = 8'h01;
    mix_mat[3][2] = 8'h01;
    mix_mat[3][3] = 8'h02;
    
    
    for(i=0;i<4;i=i+1) begin
        for(j=0;j<4;j=j+1) begin
            
                mix_out[i][j]=8'h00; 
            
        end
    end
end


always @ (*)
begin
    for(i=0;i<4;i=i+1) begin
        for(j=0;j<4;j=j+1) begin
             mix_out[j][i]=8'h00; 
            for(k=0;k<4;k=k+1) begin
            
            
                if(mix_mat[i][k]==1) begin
                    mix_out[j][i]=mix_out[j][i]^mix_in[j][k];
    
                end
                
                else if(mix_mat[i][k]==2) begin
                   {x,mix_out[j][i]}=mix_out[j][i]^(mix_in[j][k]<<1);
                    
                    if(x) begin
                        mix_out[j][i]=mix_out[j][i]^8'h1b;
                    end
                    else begin
                        mix_out[j][i]=mix_out[j][i];
                    end
                    
                end
                
               // else if(mix_mat[i][k]==3) begin
               else begin
                    {x,mix_out[j][i]} = mix_out[j][i]^((mix_in[j][k]<<1)^(mix_in[j][k]));
                    
                    if(x) begin
                        mix_out[j][i]=mix_out[j][i]^8'h1b;
                    end
                    else begin
                        mix_out[j][i]=mix_out[j][i];
                    end
                    
                end
            
            
            
           
//                mix_out[i][j]=(mix_out[i][j]) ^ (mix_mat[i][k]*mix_in[k][j]); 
            end
        end
    end
end
endmodule
