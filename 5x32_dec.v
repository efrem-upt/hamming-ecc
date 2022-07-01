module dec_5x32(
  input [4:0] i,
  input en,
  output reg [31:0] o
  );
  
reg [31:0] aux = {1'b1, {31{1'b0}}};

always @(*) begin
  if (en)
    o = aux >> i;
  else
    o = 32'd0;
end
  
endmodule