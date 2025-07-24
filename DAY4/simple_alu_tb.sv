// TB to verify the functionality of simple ALU

module simple_alu_tb ();

  logic [7:0] a_i;
  logic [7:0] b_i;
  logic [2:0] op_i;
  logic [7:0] alu_o;

  simple_alu alu1 (.*);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,simple_alu_tb);
  end

  initial begin
    for (int j =0; j<3; j++) begin
      for (int i =0; i<8; i++) begin
        a_i = $urandom_range(0, 8'hFF);
        b_i = $urandom_range(0, 8'hFF);
        op_i = 3'(i);
        #5;
      end
    end
  end

endmodule
