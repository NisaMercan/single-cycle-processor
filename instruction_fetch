/* Instruction Fetch Unitesi */

module MercanGucuk_p1 (
 input logic clk, reset,
 output logic [31:0] pc_fetch, 
 input logic pc_update_fetch,
 input logic [31:0] pc_new_fetch
);

always_ff @(posedge clk) begin
 if(!reset) //synch active-low reset
  pc_fetch <= 32'b0;

 else if (pc_update_fetch) //if pc_update is active, pc will be the new value.
  pc_fetch <= pc_new_fetch;

 else //if pc_update is not active, pc increase by 4.
  pc_fetch <= pc_fetch + 32'd4; 
end

endmodule
