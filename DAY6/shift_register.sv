// System code for a simple shift register

module shift_reg (
  input wire clk,
  input wire reset_n,
  input wire x_i,
  output logic [3:0] sr_o
);
  
  logic [3:0] next_val;
  
  always_ff @(posedge clk) begin
    if (~reset_n) begin
      sr_o <= '0;
    end else begin
      sr_o <= next_val;
    end
  end
  
   assign next_val = {sr_o[2:0],x_i};
  
endmodule
