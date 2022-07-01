module hamming_correct( 
  input [31:0] data_in,
  input [4:0] xor_sum,
  input err_2bit,
  output [31:0] data_out);
  
wire [31:0] encoder_exit;
dec_5x32 bitModifier (.i(xor_sum), .en(~err_2bit & (xor_sum[0] | xor_sum[1] | xor_sum[2] | xor_sum[3] | xor_sum[4])), .o(encoder_exit));
assign data_out = data_in ^ encoder_exit;
  
endmodule