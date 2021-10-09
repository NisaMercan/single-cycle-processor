/* Single Cycle Processor */

module MercanGucuk_p4 (
input logic clk, reset,
input logic [31:0] komut_islemci,
output logic [31:0] pc_islemci,
output hata_islemci
);

logic hata_islemci_exe;
logic hata_islemci_decode;
logic [31:0] rs1_data_ic;
logic [31:0] rs2_data_ic;
logic pc_update_ic;
logic [31:0] sonuc_ic;
logic [3:0] func_ic;
logic [31:0] imm_ic;
logic we_ic;
logic [6:0] opcode_ic;

//fetch
MercanGucuk_p1 dut0 (.clk(clk),.reset(reset),
                     .pc_update_fetch(pc_update_ic),
                     .pc_new_fetch(sonuc_ic),.pc_fetch(pc_islemci));

//decode
MercanGucuk_lab7_p3 dut1 (.clk(clk),.reset(reset), 
                          .komut_decode(komut_islemci),
                          .opcode(opcode_ic),.func(func_ic),
                          .rs1_data(rs1_data_ic),.rs2_data(rs2_data_ic),
                          .imm(imm_ic),.we_decode(we_ic),
                          .rd_data_decode(sonuc_ic),
                          .hata_decode(hata_islemci_decode));

//execute
MercanGucuk_p3 dut2 (.rs1_data_exe(rs1_data_ic),
                     .rs2_data_exe(rs2_data_ic),
                     .imm_exe(imm_ic),
                     .opcode_exe(opcode_ic),
                     .func(func_ic), 
                     .sonuc_exe(sonuc_ic),
                     .pc_update_exe(pc_update_ic),
                     .we_exe(we_ic),.hata_exe(hata_islemci_exe));

assign hata_islemci = hata_islemci_exe | hata_islemci_decode;
endmodule
