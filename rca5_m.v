module rca5_m (
  input [4:0] i,
  output wire [4:0] o);
  
  wire [4:0] aux;
  fa f1(.a(i[0]),.b(1'b1),.c_in(1'b0),.s(o[0]),.c_out(aux[0]));
  fa f2(.a(i[1]),.b(1'b0),.c_in(aux[0]),.s(o[1]),.c_out(aux[1]));
  fa f3(.a(i[2]),.b(1'b0),.c_in(aux[1]),.s(o[2]),.c_out(aux[2]));
  fa f4(.a(i[3]),.b(1'b0),.c_in(aux[2]),.s(o[3]),.c_out(aux[3]));
  fa f5(.a(i[4]),.b(1'b0),.c_in(aux[3]),.s(o[4]),.c_out(aux[4]));
  
endmodule
