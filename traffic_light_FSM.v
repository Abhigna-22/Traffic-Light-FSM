`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 15:16:52
// Design Name: 
// Module Name: traffic_light_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_FSM(
input Ta,Tb,clk,reset,
output La1,La0,Lb1,Lb0
    );
wire q0,q1;
reg s0,s1;

assign La1=s1;
assign La0=(s0&(~s1));
assign Lb1=~s1;
assign Lb0=s1&s0;

assign q1=s1^s0;
assign q0=(~s1&~s0&~Ta)|(s1&~s0&~Tb) ;
always@(posedge clk)begin
if (reset) begin
        s1<=0;
        s0<=0;
    end
else
    begin
        s1<=q1;
        s0<=q0;
    end
end

endmodule

