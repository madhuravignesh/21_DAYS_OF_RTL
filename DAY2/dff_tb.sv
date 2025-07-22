// System verilog based stimulus to verify th DFF module

module dff_tb ();
  logic clk_i;
  logic reset_n;
  logic d_i;
  logic q_norst;
  logic q_async_o;
  logic q_sync_o;
  
  dff dff1(.*);
  
  // to dump the waveforms
  initial begin
    $dumpfile("dump.vcd");  // VCD - value change dump - text based file that stores changes in signal values during the simultion
    $dumpvars(0,dff_tb);
  end
  
  // Generate clock
  initial clk_i = 1'b0;
  always #5 clk_i = ~clk_i;
  
  // Stimulus
  initial begin
    reset_n <= 1'b0;
    d_i <= 1'b1;
    @(posedge clk_i);
    reset_n <= 1'b1;
    @(posedge clk_i);
    d_i <=1'b0;
    @(posedge clk_i);
    d_i <=1'b1;
    @(posedge clk_i);
    @(posedge clk_i);
    @(posedge clk_i);
    d_i <=1'b0;
    @(negedge clk_i);
    reset_n <= 1'b0;
    @(posedge clk_i);
    @(posedge clk_i);
    reset_n <= 1'b1;
    @(posedge clk_i);
    @(posedge clk_i);
    $finish();
  end
endmodule
