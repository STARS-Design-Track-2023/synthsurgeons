module freq_gen (input logic clk,nrst, input logic [15:0] divider, output logic [15:0] count)

logic [15:0] next_count;

always_ff @ (posedge clk negedge nrst) begin
    if (nrst==0) begin
        next_count=16'b1; end
    else begin
        next_count=count; end
end

always_comb: freq_gen begin
if (count>=divider) begin
    next_count= 16'd1; end
else begin
    next_count= count+1; end
end
endmodule