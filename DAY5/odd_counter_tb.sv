module odd_counter_tb ();
  logic clk;
  logic reset_n;
  logic [7:0]  count_o;
  
  initial begin
    $dumpfile ("dump.vcd");
    $dumpvars (0,odd_counter_tb);
  end

  odd_counter count1(.*);
  
  initial begin
    clk = 1'b0;
  end
 
  always #5 clk = ~clk;
 
  
   initial begin
    reset_n = 1'b0;
    #12;
    reset_n = 1'b1;
    #200;
    $finish();
  end
  
endmodule
