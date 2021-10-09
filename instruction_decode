/* Instruction Decode */

module MercanGucuk_p2 (
input logic clk,reset,
input logic [31:0] komut, //decode a baglanacak
output logic [31:0] pc_decode, //fetch e baglanacak
input logic pc_update_decode,
input logic [31:0] pc_new_decode,
output logic hata //decode a baglanacak
); 

//decode
MercanGucuk_lab7_p3 dut0(.clk(clk),.reset(reset),
                         .komut_decode(komut),.hata_decode(hata));

//fetch unitesi
MercanGucuk_p1 dut(.clk(clk),.reset(reset),
                   .pc_fetch(pc_decode),
                   .pc_update_fetch(pc_update_decode),
                   .pc_new_fetch(pc_new_decode));
endmodule



// the lab before
module MercanGucuk_lab7_p3(
input logic clk , reset,
input logic [31:0] komut_decode,
output logic [6:0] opcode,
output logic [3:0] func,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data,
output logic [31:0] imm,
output logic hata_decode,
input logic we_decode, //exe
input logic [31:0] rd_data_decode //exe
);

logic [4:0] rs1;
logic [4:0] rs2;
logic [4:0] rd;

MercanGucuk_lab7_p2 dut(.clk(clk),.reset(reset),
                        .rs1(rs1),.rs2(rs2),
                        .rs1_data(rs1_data),
                        .rs2_data(rs2_data),
                        .waddr(rd),.we(we_decode),.wbdata(rd_data_decode));

assign opcode = komut_decode[6:0];

always_comb begin 
 if (opcode == 7'b0000001) begin // R
 rs1 = komut_decode[19:15];
 rs2 = komut_decode[24:20];
 rd = komut_decode[11:7];
 func = {komut_decode[30], komut_decode[14:12]};
 imm = 32'b0;
 hata_decode = 1'b0; 
 end
 
 else if (opcode == 7'b0000011) begin //I
 rs1 = komut_decode[19:15];
 rs2 = 5'b0;
 rd = komut_decode[11:7];
 func = {1'b0, komut_decode[14:12]};
 imm = komut_decode[31:20];
 hata_decode = 1'b0; 
 end

 else if(opcode == 7'b0000111) begin //U
 rs1 = 5'b0; 
 rs2 = 5'b0; 
 rd = komut_decode[11:7];
 func = 4'b0;
 imm = komut_decode[31:12];
 hata_decode = 1'b0; 
 end

 else if (opcode == 7'b0001111) begin //B
 rs1 = komut_decode[19:15];
 rs2 = komut_decode[24:20];
 rd = 5'b0;
 func = {1'b0, komut_decode[14:12]};
 imm = {{komut_decode[31:25], komut_decode[11:7]}, 1'b0}; 
 hata_decode = 1'b0; 
 end

 else begin 
 rs1 = 5'b0; 
 rs2 = 5'b0; 
 rd = 5'b0;
 func = 4'b0;
 imm = 32'b0;
 hata_decode = 1'b1; end
 
end 
endmodule

module MercanGucuk_lab7_p2(
input logic clk, reset,
input logic we,
input logic [4:0] waddr,
input logic [31:0] wbdata,
input logic [4:0] rs1,
input logic [4:0] rs2,
output logic [31:0] rs1_data,
output logic [31:0] rs2_data);
logic [31:0] mem_p2[0:63];

//initial begin 
// $readmemb("fib20.mem", mem_p2);
//end

integer i;
always_ff @(posedge clk) begin
if (!reset) for (i=0; i<64; i=i+1) mem_p2[i] <= 32'b0; 
if (we) mem_p2[waddr] <= wbdata;
end

assign rs1_data = mem_p2[rs1];
assign rs2_data = mem_p2[rs2];

endmodule
