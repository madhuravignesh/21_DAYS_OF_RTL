module mux_2to1_tb (
  logic [7:0] x1_i;
  logic [7:0] x2_i;
  logic sel_i;
  logic [7:0] y_o;
  
);
  
  //instatiate the design module
  mux_2to1 mux1 (.*);
  
 initial begin
    // Waveform dumping setup
    $dumpfile("dump.vcd");        // Create a VCD file named dump.vcd
    $dumpvars(0, mux_2to1_tb);             // Dump all variables in tb and below
  end


  initial begin
    for (int i=0; i<10; i++ ) begin
      x1_i = $urandom_range (0, 8'hFF);
      x2_i = $urandom_range (0, 8'hFF);
      sel_i = $random%2;
      #5
    end
    $finish();
  end
  
endmodule