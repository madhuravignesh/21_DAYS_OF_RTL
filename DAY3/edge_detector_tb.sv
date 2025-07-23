// SV based stimulus for verification of edge detetctors

module edge_detector_tb ();

  logic    clk;
  logic    reset_n;

  logic    x_i;

  logic    rising_edge_o;
  logic    falling_edge_o;

  edge_detector edge_detec1 (.*);

  initial begin
    $dumpfile ("dump.vcd");
    $dumpvars (0,edge_detector_tb);
  end
  
  // generate clock
  initial begin
    clk = 1'b0;
  end
  always #5 clk = ~clk;
  
  // Stimulus
  initial begin
    reset_n <= 1'b0;
    x_i <= 1'b1;
    @(posedge clk);
    reset_n <= 1'b1;
    @(posedge clk);
    for (int i=0; i<32; i++) begin
      x_i <= $random%2;
      @(posedge clk);
    end
    $finish();
  end

endmodule
