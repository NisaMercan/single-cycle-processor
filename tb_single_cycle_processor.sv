/* tb Single Cycle Processor */

`timescale 1ns/1ps

module tb_MercanGucuk();
logic clk, reset;
logic [31:0] komut;
logic [31:0] pc;
logic hata;

MercanGucuk_p4 dut0(.clk(clk),.reset(reset),
                    .pc_islemci(pc),.komut_islemci(komut),
                    .hata_islemci(hata));

logic [29:0] addr;
logic [31:0] mem [0:63];
assign addr = pc[29:0];
assign komut = mem[addr>>2];

initial begin
 $readmemb("fib20.mem", mem);
end

always begin
 clk = 1; #5; clk = 0; #5;
 end

initial begin
 reset =1'b0; #10; reset = 1'b1; 
 end

initial
 begin
 #1100; 
 $stop;
 end

endmodule
