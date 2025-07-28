`include "defines.v"

module tb;


  // Testbench signals
  reg clk;
  reg [`addr_width-1:0] addr_0, addr_1;
  reg [`data_width-1:0] data_0, data_1;
  reg cs_0, cs_1;
  reg wr_0, wr_1;
  reg oe_0, oe_1;
  wire [`data_width-1:0] data_out_0, data_out_1;

  // Bidirectional inout wires
  wire [`data_width-1:0] bidir_data_0;
  wire [`data_width-1:0] bidir_data_1;

  // Assign bidirectional wires
  assign bidir_data_0 = (cs_0 && wr_0) ? data_0 : {`data_width{1'bz}};
  assign bidir_data_1 = (cs_1 && wr_1) ? data_1 : {`data_width{1'bz}};

  assign data_out_0 = bidir_data_0;
  assign data_out_1 = bidir_data_1;

  // Instantiate the dual-port RAM module
  dual uut (
    .clk(clk),
    .addr_0(addr_0),
    .data_0(bidir_data_0),
    .cs_0(cs_0),
    .wr_0(wr_0),
    .oe_0(oe_0),
    .addr_1(addr_1),
    .data_1(bidir_data_1),
    .cs_1(cs_1),
    .wr_1(wr_1),
    .oe_1(oe_1)
  );

  // Generate clock signal
  always #5 clk = ~clk;

  initial begin
    // Initialize signals
    clk = 0;
    addr_0 = 0;
    addr_1 = 0;
    data_0 = 0;
    data_1 = 0;
    cs_0 = 0;
    cs_1 = 0;
    wr_0 = 0;
    wr_1 = 0;
    oe_0 = 0;
    oe_1 = 0;

    // Test case 1: Write to port 0
    #10;
    cs_0 = 1; wr_0 = 1; oe_0 = 0;
    addr_0 = 4'b0010;
    data_0 = 8'hA5;
    #10;
    cs_0 = 0; wr_0 = 0;

    // Test case 2: Read from port 0
    #10;
    cs_0 = 1; wr_0 = 0; oe_0 = 1;
    addr_0 = 4'b0010;
    #10;
    cs_0 = 0; oe_0 = 0;

    // Test case 3: Write to port 1
    #10;
    cs_1 = 1; wr_1 = 1; oe_1 = 0;
    addr_1 = 4'b0101;
    data_1 = 8'h5A;
    #10;
    cs_1 = 0; wr_1 = 0;

    // Test case 4: Read from port 1
    #10;
    cs_1 = 1; wr_1 = 0; oe_1 = 1;
    addr_1 = 4'b0101;
    #10;
    cs_1 = 0; oe_1 = 0;

    // Test case 5: Simultaneous operations
    #10;
    cs_0 = 1; wr_0 = 1; oe_0 = 0;
    addr_0 = 4'b0011;
    data_0 = 8'hFF;
    cs_1 = 1; wr_1 = 0; oe_1 = 1;
    addr_1 = 4'b0010;
    #10;
    cs_0 = 0; cs_1 = 0;

    // Test complete
    #20;
    $finish;
  end
  
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars();
  end
  

endmodule
