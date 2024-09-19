module EEDC_decode(
    input clk,
    input [10:0] encoded_input,
    output reg [6:0] decoded_output
);

reg [10:0] c2;
reg [3:0] syndrome;

always @ (posedge clk)
begin
    syndrome[3] = encoded_input[3] ^ encoded_input[4] ^ encoded_input[6] ^ encoded_input[8] ^ encoded_input[10];
    syndrome[2] = encoded_input[2] ^ encoded_input[5] ^ encoded_input[4] ^ encoded_input[9] ^ encoded_input[8];
    syndrome[1] = encoded_input[1] ^ encoded_input[4] ^ encoded_input[5] ^ encoded_input[6] ^ encoded_input[7];
    syndrome[0] = encoded_input[1] ^ encoded_input[2] ^ encoded_input[3];
c2=encoded_input;

    if (syndrome != 4'b0000) 
    begin
        if (syndrome == 4'b1001)
            c2[10] = ~encoded_input[10];
        else if (syndrome == 4'b0101)
            c2[9] = ~encoded_input[9];
        else if (syndrome == 4'b1101)
            c2[8] = ~encoded_input[8];
        else if (syndrome == 4'b0011)
            c2[7] = ~encoded_input[7];
        else if (syndrome == 4'b1011)
            c2[6] = ~encoded_input[6];
        else if (syndrome == 4'b0111)
            c2[5] = ~encoded_input[5];
        else if (syndrome == 4'b1111)
            c2[4] = ~encoded_input[4];
    end 
    end
    always @(posedge clk)
    begin
        decoded_output[6] = c2[10];
        decoded_output[5] = c2[9];
        decoded_output[4] = c2[8];
        decoded_output[3] = c2[7];
        decoded_output[2] = c2[6];
        decoded_output[1] = c2[5];
        decoded_output[0] = c2[4];
    end
endmodule
