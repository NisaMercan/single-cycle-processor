/* Testbench Instruction Fetch 2 */

`timescale 1ns/1ps

module tb_lab8_p1();
logic clk, reset;
logic [31:0] pc;
logic pc_update;
logic [31:0] pc_new;

MercanGucuk_p1 dut0(.clk(clk), .reset(reset),
                    .pc_fetch(pc), .pc_update_fetch(pc_update), 
                    .pc_new_fetch(pc_new));

logic [29:0] addr;  //address
logic [31:0] mem [0:63]; //64 rows 32-bits memory 
logic [31:0] komut;
assign addr = pc[29:0]; //address of the instructions are the first 30 bits of the pc

initial begin //read from the instruction memory as binary
 $readmemb("fib20.mem", mem);
end

assign komut = mem[addr>>2]; //fetch the instructions from memory

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
