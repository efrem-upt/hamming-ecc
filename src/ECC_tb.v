module ECC_tb();
  reg[31:0] data_in_tb;
  reg[31:0] data_out_tb_exp;
  wire[31:0] data_out_tb_actual;
  reg err_2_bit_tb_exp;
  wire err_2_bit_tb_actual;
  ECC DUT(.data_in(data_in_tb), .data_out(data_out_tb_actual), .err_2_bit(err_2_bit_tb_actual));
  
  integer n_tests, n_tests_passed;
  integer data_file;
  reg[63:0] aString[6:0];
  
  integer MORE_INFORMATION, DISPLAY_PASSED;
  initial begin
    data_file = $fopen("tests_ECC.dat", "r");
    if (data_file == 0) begin
      $display("Adauga fisierul tests_ECC.dat in acelasi proiect");
      $finish;
    end
    /* ignoram prima linie */
    $fscanf(data_file, "%s %s %s\n", aString[0], aString[1], aString[2]);
    
    MORE_INFORMATION = 1;
    DISPLAY_PASSED = 1;
    n_tests = 0;
    n_tests_passed = 0;
    
    while(!$feof(data_file)) begin
      n_tests = n_tests + 1;
      $fscanf(data_file, "%s %s %s %s %s %s %s\n", aString[0], aString[1], aString[2], aString[3], aString[4], aString[5], aString[6]);
      $fscanf(data_file, "%b %b %b\n", data_in_tb, data_out_tb_exp, err_2_bit_tb_exp);
      #100;
      $display("[Test %3d]", n_tests);
      if(MORE_INFORMATION == 0) begin
        /* do nothing */
      end 
      else begin
        $display("%s %s %s %s %s %s %s", aString[0], aString[1], aString[2], aString[3], aString[4], aString[5], aString[6]);
        $display("data_in = %b", data_in_tb);
        $display("Expected data_out = %b   err_2_bit = %b", data_out_tb_exp, err_2_bit_tb_exp);
      end
      if(data_out_tb_actual == data_out_tb_exp && err_2_bit_tb_actual == err_2_bit_tb_exp) begin
        if(DISPLAY_PASSED == 1) begin
          $display("Test PASSED");
        end
        n_tests_passed = n_tests_passed + 1;
      end
      else begin
        $display("Test FAILED");
        $display("Actual data_out = %b    err_2_bit = %b", data_out_tb_actual, err_2_bit_tb_actual);
      end
    end
    $display("Teste passed: %d / %d", n_tests_passed, n_tests);
    $fclose(data_file);
  end
endmodule