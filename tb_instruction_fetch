/* Testbench Instruction Fetch */

`timescale 1ns/1ps

module tb_lab8_p1();
logic clk, reset;
logic [31:0] pc;
logic pc_update;
logic [31:0] pc_new;

MercanGucuk_p1 dut0(.clk(clk), .reset(reset),
                    .pc_fetch(pc), .pc_update_fetch(pc_update), 
                    .pc_new_fetch(pc_new));

always begin
 clk = 1; #5; clk = 0; #5;
 end

initial begin
 reset =1'b0; #20; reset = 1'b1;
 end

initial begin
 pc_new = 32'h00004444; pc_update = 1'b1; #30;
 pc_update = 1'b0; #70;
 pc_new = 32'h00001111; pc_update = 1'b1; #30;
 pc_update = 1'b0; #70; 
 pc_update = 1'b0; pc_new = 32'h00003333; #30; 
 $stop;
 end

endmodule
