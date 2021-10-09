/* Testbench Instruction Decode */

`timescale 1ns/1ps

module tb_lab8_p2();
logic clk, reset;
logic [31:0] pc;
logic [31:0] komut;
logic [31:0] pc_new;
logic pc_update;
logic hata;

MercanGucuk_p2 dut0(.clk(clk),.reset(reset),
                    .pc_decode(pc),
                    .pc_update_decode(pc_update),
                    .pc_new_decode(pc_new),.komut(komut),.hata(hata));

logic [29:0] addr;
logic [31:0] mem [0:63];
assign addr = pc[29:0];

initial begin
 $readmemb("fib20.mem", mem);
end

assign komut = mem[addr>>2];

always begin
 clk = 1; #5; clk = 0; #5;
 end

initial begin
 reset = 1'b0; #20; reset = 1'b1;
end

initial
 begin
 pc_new = 32'h00000000; pc_update = 1'b1; #30; pc_update = 1'b0; #120; 
 $stop;
 end
endmodule
