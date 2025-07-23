// System verilog code for rising and falling edge detector

module edge_detector (
  input logic clk,
  input logic reset_n,
  input logic x_i,
  output logic rising_edge_o,
  output logic falling_edge_o
);
  
  logic x_q;
  
  always_ff @(posedge clk) begin
    if (~reset_n) begin
      x_q <= '0;
    end else begin
      x_q <= x_i;
    end
  end
  
  assign rising_edge_o = x_i & ~x_q;
  
  assign falling_edge_o = ~x_i & x_q;
  
  
endmodule
    
