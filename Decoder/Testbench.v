module EEDC_decode_tb;
 reg clk;
 reg [10:0]encoded_input;
 wire [6:0] decoded_output;
 
 
 EEDC_decode dut (
 .clk(clk),
 .encoded_input(encoded_input),
 .decoded_output(decoded_output)
 );
 
 always #50 clk<=~clk;
 initial
 begin
 clk=0;
 encoded_input=11'b00000011111;
 #100 encoded_input=11'b00000001111;
 #100 encoded_input=11'b00000101001;
 #100 encoded_input=11'b00011010101;
 #100 encoded_input=11'b00101010101;
 #100 encoded_input=11'b00000100110;
 #100 encoded_input=11'b10110111111;
 #100 encoded_input=11'b10100111111;
 #100 $finish;
 end


always @(posedge clk)begin
$display("Time=%0t, Encoded Input=%b, Decoded Output=%b", $time, encoded_input, decoded_output);
end
endmodule
