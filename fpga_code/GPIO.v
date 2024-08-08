module GPIO (
    input outEn,
    input clk,
    input RSTn,
    input [1:0]  oData,  
    output[7:0]  iData,  
    inout[1:0]  ioPin
);
reg [7:0] tmp;

always@(posedge clk or negedge RSTn) begin
  if(~RSTn) tmp <= 8'd0;
  else tmp <= {{6{1'b0}},ioPin};
end

assign iData = tmp;
assign ioPin = outEn ? oData : 2'bzz;

endmodule