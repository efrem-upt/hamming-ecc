module clk_rst_gen (
  input [31:0] i,
  output reg clk,
  output reg rst);
  
  always @(i) begin
    rst = 1'b0;
    #1 rst = 1'b1;
    clk = 0;
    repeat (66) begin
      #1 clk = ~clk;
    end
    
  end
  


endmodule
