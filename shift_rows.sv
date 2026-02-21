

// Create Date: 15.02.2026 10:51:22

module shift_rows(
input [7:0]sh_in[0:3][0:3],
output reg [7:0]sh_out[0:3][0:3]
    );
    integer i,j;
    always @ (*) begin
        for (i=0;i<4;i=i+1) begin
        ///////////////////////// row 0
            if(i==0) begin
                for(j=0;j<4;j=j+1) begin
                    sh_out[j][0]=sh_in[j][0];
                    end
                end
         /////////////////////////// row1       
            else if(i==1) begin
                sh_out[0][1] = sh_in[1][1];
                sh_out[1][1] = sh_in[2][1];
                sh_out[2][1] = sh_in[3][1];
                sh_out[3][1] = sh_in[0][1];
            end
         /////////////////////////// row2      
            else if(i==2) begin
                sh_out[0][2] = sh_in[2][2];
                sh_out[1][2] = sh_in[3][2];
                sh_out[2][2] = sh_in[0][2];
                sh_out[3][2] = sh_in[1][2];
            end
         /////////////////////////// row3     
            else if(i==3) begin
                sh_out[0][3] = sh_in[3][3];
                sh_out[1][3] = sh_in[0][3];
                sh_out[2][3] = sh_in[1][3];
                sh_out[3][3] = sh_in[2][3];
            end
            
            ///////////////////////////// default
            else begin
                 for(j=0;j<4;j=j+1) begin
                    sh_out[0][j]=sh_in[0][j];
                    end
            end
            
            
        end
    end
    
endmodule
