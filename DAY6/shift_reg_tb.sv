module shift_reg_tb();
  logic clk;
  logic reset_n;
  logic x_i;
  logic [3:0] sr_o;
  
  shift_reg sr1 (.*);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,shift_reg_tb);
  end
  
  initial begin
    clk = 1'b0;
  end
  
  always #5 clk = ~clk;
  
  initial begin
    reset_n <= 1'b0;
    x_i <= 1'b0;
    @(posedge clk);
    reset_n <= 1'b1;
    @(posedge clk);
    for (int i=0; i<16; i=i+1) begin
      x_i <= $random%2;
      @(posedge clk);
    end
    $finish();
  end
  
  
  endmodule
