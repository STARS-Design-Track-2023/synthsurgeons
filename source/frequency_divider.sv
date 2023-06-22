module LUTS (input logic [3:0] keycode, sound_series, input logic is_FPGA, output logic [15:0] divider);
always_comb begin : LUTS 
logic [12:0] [15:0] LUT_10MHz= {
    16'd19111,   // C (high)
    16'd20248,   // B
    16'd21452,   // A#
    16'd22727,   // A
    16'd24079,   // G#
    16'd25511,   // G
    16'd27027,   // F#
    16'd28635,   // F
    16'd30337,   // E
    16'd32141,   // D#
    16'd34052,   // D
    16'd36077,   // C#
    16'd38223   // C (low)
};

logic [12:0] [15:0] LUT_12MHz={
    16'd22933,   // C (high)
    16'd24298,   // B
    16'd25742,   // A#
    16'd27272,   // A
    16'd28895,   // G#
    16'd30613,   // G
    16'd32432,   // F#
    16'd34362,   // F
    16'd36404,   // E
    16'd38569,   // D#
    16'd40862,   // D
    16'd43292,   // C#
    16'd45868   // C (low)
};

if ((|keycode) && (!|sound_series)) begin
    if ((keycode == 4'b1101 || keycode == 4'b1110 || keycode == 4'b1111)) begin
        divider= 16'd0; end
    else begin
        if (is_FPGA == 0) begin
            divider= LUT_10MHz[keycode]; end
        else begin
            divider= LUT_12MHz[keycode]; end
    end
end
else if ((|sound_series) && (!|keycode)) begin
    if ((sound_series == 4'b1101 || sound_series == 4'b1110 || sound_series == 4'b1111)) begin
        divider= 16'd0; end
    else begin
        if (is_FPGA == 0) begin
            divider= LUT_10MHz[sound_series]; end
        else begin
            divider= LUT_12MHz[sound_series]; end
    end
end
else begin
    divider= 16'd0; end
end

endmodule