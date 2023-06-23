`default_nettype none
module pwm (
    // HW
    input logic [7:0] sample,
    input logic clk, n_rst,
    output logic pwm_o
);
logic [7:0] count, next_count;

always_comb begin

    if(count >= 255) begin
        next_count = 0;
    end
    else begin
        next_count = count + 1;
    end

    if (count < sample) begin
        pwm_o = 1;
    end
    else begin
        pwm_o = 0;
    end
    
end
endmodule