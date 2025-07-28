`include "defines.v"
module dual(clk,addr_0,data_0,cs_0,wr_0,oe_0,addr_1,data_1,cs_1,wr_1,oe_1);
  input [`addr_width-1:0] addr_0;
  input [`addr_width-1:0] addr_1;
  inout [`data_width-1:0] data_0;
  inout [`data_width-1:0] data_1;
  input cs_0;
  input cs_1;
  input clk;
  input wr_0;
  input wr_1;
  input oe_0;
  input oe_1;
  
  
  reg [`data_width-1:0] data_out_0;
  reg [`data_width-1:0] data_out_1;
  reg [`data_width-1:0] memory [0:`depth-1];
  
  //write block
  
  always@(posedge clk)
    begin
      if(cs_0 && wr_0)
        begin
          memory[addr_0]<=data_0;
        end
      else
        begin
          memory[addr_1]<=data_1;
        end
    end
  
  //tri state buffer control
  
  assign data_0=(cs_0 && oe_0 && !wr_0)?data_out_0:`data_width'bz;
  
  //read block
  
  always @(posedge clk)
    begin
      if(cs_0 && !wr_0 && oe_0)
        begin
          data_out_0<=memory[addr_0];
        end
      else
        begin
          data_out_0<=0;
        end
    end
  
  //second port ram
  
  assign data_1=(cs_1 && oe_1 && !wr_1)?data_out_1:`data_width'bz;

  
  always @(posedge clk)
    begin
      if(cs_1 && !wr_1 && oe_1)
        begin
          data_out_1<=memory[addr_1];
        end
      else
        begin
          data_out_1<=0;
        end
    end
  
endmodule
