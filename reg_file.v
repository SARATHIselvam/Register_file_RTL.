module regfile (
    input wire clk,
    input wire rst,
    input wire we,
    input wire [2:0] waddr,
    input wire [15:0] wdata,
    input wire [2:0] raddr1,
    input wire [2:0] raddr2,
    output wire [15:0] rdata1,
    output wire [15:0] rdata2
);
    reg [15:0] regfile[0:7];
    integer i;
    always @(posedge clk)
    begin
        if(rst)
        begin
            for (i =0 ;i<8 ;i=i+1 ) begin
                regfile[i]<=16'b0;
            end
        end
        else if (we && (waddr!=3'b000)) begin
            regfile[waddr]<=wdata;
        end
    end
    assign rdata1= (raddr1==3'b000)?16'b0:regfile[raddr1];
    assign rdata2= (raddr2==3'b000)?16'b0:regfile[raddr2];
endmodule