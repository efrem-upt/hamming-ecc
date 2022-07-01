module ECC(
  input [31:0] data_in,
  output [31:0] data_out,
  output err_2_bit);

wire [4:0] xor_sum;

hamming_detect decectionOfErrorBits(.data_in(data_in), .err_2bit(err_2_bit), .xor_sum(xor_sum));
hamming_correct correctionOfErrorBits(.data_in(data_in), .err_2bit(err_2_bit),.xor_sum(xor_sum),.data_out(data_out));

endmodule