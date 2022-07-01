module hamming_detect (
  input [31:0] data_in,
  output err_2bit,
  output [4:0] xor_sum);
  
wire clk, rst, current_bit, sum_bits;
wire [4:0] s, rca_sum, xor_sum_precalc;

clk_rst_gen signalGenerator(.i(data_in),.clk(clk),.rst(rst));
mux_5s_1b bitSelector(.i(data_in), .s(s), .o(current_bit));
rca5_m addByOne (.i(s), .o(rca_sum));
dff_ar_en s_gen (.d(rca_sum), .clk(clk), .en(1'b1), .rst(rst), .q(s));
dff_ar_en xor_sum_gen (.d(xor_sum_precalc^s), .clk(clk), .en(current_bit), .rst(rst), .q(xor_sum_precalc));
dff_ar_en #(.nr_bits(1)) sum_bits_gen (.d(sum_bits^current_bit), .clk(clk),.en(1'b1), .rst(rst), .q(sum_bits));
dff_ar_en #(.nr_bits(1)) err_2bit_gen (.d(~sum_bits), .clk(clk),.en(~(s[0] | s[1] | s[2] | s[3] | s[4]) & (xor_sum[0] | xor_sum[1] | xor_sum[2] | xor_sum[3] | xor_sum[4])), .rst(rst), .q(err_2bit));

assign xor_sum = xor_sum_precalc;
endmodule
  