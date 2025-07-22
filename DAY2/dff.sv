/* System Verilog code for
1. Non Resettable DFF
2. Asynchronous reset DFF
3. Synchronous reset DFF
 The module uses actice low reset
*/

module dff (
  input logic clk_i,
  input logic reset_n,
  input logic d_i,
  output logic q_norst,
  output logic q_async_o,
  output logic q_sync_o
);
  
  // non resettable flip flop
  always_ff @(posedge clk_i) begin
    q_norst <= d_i;
  end

  // asynchrounous reset; active low reset
    always_ff @(posedge clk_i or negedge reset_n) begin
    if (~reset_n) begin
      q_async_o <= '0;
    end else begin
      q_async_o <= d_i;
    end
  end
  
  //synchronous reset; active low reset
  always_ff @(posedge clk_i) begin
    if (~reset_n) begin
      q_sync_o <= '0;
    end else begin
      q_sync_o <= d_i;
    end
  end
  
endmodule

    
