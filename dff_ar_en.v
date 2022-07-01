module dff_ar_en #(
    parameter nr_bits = 5
  )
  (
    input [nr_bits-1:0] d,
    input clk,
    input rst,
    input en,
    output reg [nr_bits-1:0] q);
    
always @(posedge clk, negedge rst) begin
   if (!rst)
        q <= {nr_bits{1'b0}};
    else if(en)
        q <= d;
end
endmodule