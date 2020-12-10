module FSM(out, rst, clk);
input rst, clk;
output [3:0] out;

reg [3:0]state;

parameter [3:0]
	IDLE = 4'b0000,
	S1 = 4'b0001,
	S2 = 4'b0010,
	S3 = 4'b0100,
	S4 = 4'b1000;
	

always@(posedge clk or negedge rst) begin

if(!rst) begin
	state <= IDLE;
	out <= 4'b0;
end
else begin


case (state)
IDLE: begin
		state<=S1;
		out<=4'b0;
		end
S1:	begin
		state<=S2;
		out<=4'b0001;
		end
S2:	begin
		state<=S3;
		out<=4'b0010;
		end
S3:	begin
		state<=S4;
		out<=4'b0100;
		end
S4:	begin
		state<=IDLE;
		out<=4'b1000;
		end
default: begin
		state<=IDLE;
		out<=4'b0;
		end
endcase

end

endmodule



		