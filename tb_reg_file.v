`timescale 1ns/1ps

module tb_reg_file;

  reg clk;
  reg rst;
  reg we;
  reg [2:0] waddr;
  reg [2:0] raddr1, raddr2;
  reg [7:0] wdata;
  wire [7:0] rdata1, rdata2;

  // DUT instantiation
  regfile DUT (
    .clk(clk),
    .rst(rst),
    .we(we),
    .waddr(waddr),
    .raddr1(raddr1),
    .raddr2(raddr2),
    .wdata(wdata),
    .rdata1(rdata1),
    .rdata2(rdata2)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    we = 0;

    #10 rst = 0;

    // Write data
    we = 1;
    waddr = 3'b001; wdata = 8'hAA; #10;
    waddr = 3'b010; wdata = 8'h55; #10;

    // Read data
    we = 0;
    raddr1 = 3'b001;
    raddr2 = 3'b010;

    #50 $stop;
  end

endmodule
