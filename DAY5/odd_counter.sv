module odd_counter (
  input logic clk,
  input logic reset_n,
  output logic [7:0] count_o
);
  
  logic [7:0] nxt_count;
  
  always_ff @(posedge clk) begin
    if (~reset_n) begin
      count_o <= 8'h1;
    end else begin
      count_o <= nxt_count;
    end
  end
  
  assign nxt_count = count_o + 8'h2;
  
endmodule


