// Copyright 2025 bazel_rules_hdl Authors

module tb ();

  // Waveform
  initial begin : proc_waveform
    string vcd_file = "dump.vcd";
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $display(vcd_file);
      $dumpfile(vcd_file);
      $dumpvars();
    end
    if ($test$plusargs("vpdfile")) begin
      $vcdpluson;
    end
  end

  // DUT
  logic [7:0] x;
  logic [7:0] y;
  logic carry_in;
  logic carry_output_bit;
  logic [7:0] sum;

  adder dut (
      .x(x),
      .y(y),
      .carry_in(carry_in),
      .carry_output_bit(carry_output_bit),
      .sum(sum)
  );

  // Test procedure
  initial begin : proc_test
    x = '0;
    y = '0;
    carry_in ='0;
    $display("Testing adder:");
    #10 x = 8'd1;
    y = 8'd2;
    #10 $display("x=%d, y=%d, x+y=%d", x, y, sum);
    assert (sum == 3);
    #10 $display("Testing done.");
    $finish();
  end

endmodule
