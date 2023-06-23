`default_nettype none
module pwm (
    // HW
    input logic [7:0] sample,
    input logic clk, n_rst,
    output logic pwm_o
);
logic [7:0] count, next_count;
logic pwm;
always_ff @ (posedge clk, negedge n_rst) begin
  if(1'b0 == n_rst) begin
    pwm_o <= 0;
  end
  else begin
    pwm_o <= pwm;
  end
end
always_comb begin

    if(count >= 255) begin
        next_count = 0;
    end
    else begin
        next_count = count + 1;
    end

    if (count < sample) begin
        pwm = 1;
    end
    else begin
        pwm = 0;
    end

end
endmodule