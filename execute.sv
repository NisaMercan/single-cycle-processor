/* Execute Unit */

module MercanGucuk_p3 (
input logic [31:0] rs1_data_exe, rs2_data_exe,
input logic [31:0] imm_exe,
input logic [6:0] opcode_exe,
input logic [3:0] func,
output logic [31:0] sonuc_exe,
output logic pc_update_exe,
output logic we_exe,
output logic hata_exe);

`define R 7'b0000001
`define I 7'b0000011 
`define U 7'b0000111 
`define B 7'b0001111
`define ADD 4'b0000 
`define SUB 4'b1000
`define AND 4'b0111 
`define OR 4'b0110 
`define EOR 4'b0100
`define LSL 4'b0001 
`define LSR 4'b0101 
`define ASR 4'b1101
`define BB 4'b0011
`define BEQ 4'b0000
`define BNE 4'b0001
`define BLT 4'b0100
`define BGE 4'b0101
`define BLTU 4'b0110
`define BGEU 4'b0111

always_comb begin
case(opcode_exe)
`R: begin 
 if(func == `ADD) begin sonuc_exe = rs1_data_exe + rs2_data_exe; hata_exe=0; pc_update_exe=0; we_exe=1; end
 else if(func == `SUB) begin sonuc_exe = rs1_data_exe - rs2_data_exe; hata_exe=0; pc_update_exe=0; we_exe=1; end
 else if(func == `AND) begin sonuc_exe = rs1_data_exe & rs2_data_exe; hata_exe=0; pc_update_exe=0; we_exe=1; end
 else if(func == `OR) begin sonuc_exe = rs1_data_exe | rs2_data_exe; hata_exe=0; pc_update_exe=0; we_exe=1; end
 else if(func == `EOR) begin sonuc_exe = rs1_data_exe ^ rs2_data_exe; hata_exe=0; pc_update_exe=0; we_exe=1; end
 else if(func == `LSL) begin sonuc_exe = rs1_data_exe << rs2_data_exe; hata_exe=0; pc_update_exe=0; we_exe=1; end
 else if(func == `LSR) begin sonuc_exe = rs1_data_exe >> rs2_data_exe; hata_exe=0; pc_update_exe=0; we_exe=1; end
 else if(func == `ASR) begin sonuc_exe = $signed(rs1_data_exe)>>>$signed(rs2_data_exe); hata_exe=0; pc_update_exe=0; we_exe=1; end
 else begin sonuc_exe = 32'b0; hata_exe=1; pc_update_exe=0; we_exe=0; end
end

`I: begin
 if(func == `ADD) begin sonuc_exe = rs1_data_exe + imm_exe; hata_exe = 0; pc_update_exe = 0; we_exe = 1; end
 else if(func == `AND) begin sonuc_exe = rs1_data_exe & imm_exe; hata_exe = 0; pc_update_exe = 0; we_exe = 1; end
 else if(func == `OR) begin sonuc_exe = rs1_data_exe | imm_exe; hata_exe = 0; pc_update_exe = 0; we_exe = 1; end
 else if(func == `EOR) begin sonuc_exe = rs1_data_exe ^ imm_exe; hata_exe = 0; pc_update_exe = 0; we_exe = 1; end
 else if(func == `LSL) begin sonuc_exe = rs1_data_exe <<imm_exe; hata_exe = 0; pc_update_exe = 0; we_exe = 1; end
 else if(func == `LSR) begin sonuc_exe = rs1_data_exe >> rs2_data_exe; hata_exe=0; pc_update_exe=0; we_exe=1; end
 else begin sonuc_exe = 32'b0; hata_exe = 1; pc_update_exe = 0; we_exe = 0; end
 end

`U: begin sonuc_exe = rs1_data_exe; hata_exe = 0; pc_update_exe = 0; we_exe = 1; end
 
`B: begin
 if(func == `BB) begin sonuc_exe = imm_exe; hata_exe = 0; pc_update_exe = 1; we_exe = 0; end 
 else if(func == `BEQ) begin sonuc_exe = imm_exe; hata_exe = 0;
                         pc_update_exe = $signed(rs1_data_exe) == $signed(rs2_data_exe);
                                we_exe = !(pc_update_exe); end
 else if(func == `BNE) begin sonuc_exe = imm_exe; hata_exe = 0;
                         pc_update_exe = !($signed(rs1_data_exe)== $signed(rs2_data_exe));
                                we_exe = !(pc_update_exe); end
 else if(func == `BLT) begin sonuc_exe = imm_exe; hata_exe = 0;
                         pc_update_exe = $signed(rs1_data_exe) < $signed(rs2_data_exe);
                                we_exe = !(pc_update_exe); end
 else if(func == `BGE) begin sonuc_exe = imm_exe; hata_exe = 0;
                         pc_update_exe = $signed(rs1_data_exe)>= $signed(rs2_data_exe);
                                we_exe = !(pc_update_exe); end
 else if(func == `BLTU) begin sonuc_exe = imm_exe; hata_exe = 0;
                          pc_update_exe = rs1_data_exe < rs2_data_exe;
                                 we_exe = !(pc_update_exe); end
 else if(func == `BGEU) begin sonuc_exe = imm_exe; hata_exe = 0;
                          pc_update_exe = rs1_data_exe >= rs2_data_exe;
                                 we_exe = !(pc_update_exe); end
 else begin sonuc_exe = 32'b0; hata_exe = 1; pc_update_exe = 0; we_exe = 0; end
 end

default: begin sonuc_exe = 32'b0; hata_exe = 1; pc_update_exe = 0; we_exe = 0; end

endcase
end
endmodule

