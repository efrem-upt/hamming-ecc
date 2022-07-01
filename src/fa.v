module fa(
      input a, b, c_in,
      output reg s,c_out
);

always @(*) begin
    s = a^b^c_in;
    c_out = (a & b) | (a & c_in) | (b & c_in);
end
endmodule