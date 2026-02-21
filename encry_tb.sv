`timescale 1ns / 1ps

// Create Date: 15.02.2026 17:12:46


module encry_tb();

logic [127:0]plain;
logic [127:0]input_key;
logic [127:0]cypher;



encry dut(
.plain(plain),
.input_key(input_key),
.cypher(cypher)
    );
    
    initial begin
        plain=128'h00112233445566778899aabbccddeeff;
        input_key=128'h000102030405060708090a0b0c0d0e0f;

        #10;
        $display("chypher = %h",cypher);
    end
endmodule
