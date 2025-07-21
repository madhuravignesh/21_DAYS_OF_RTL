//A simple 2:1 mux

module mux_2to1 (
  input [7:0] x1_i,
  input [7:0] x2_i,
  input sel_i,
  output [7:0] y_o
);
  
  assign y_o = sel_i? x1_i : x2_i;
  
endmodule
