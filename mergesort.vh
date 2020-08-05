module sort 
#(
    parameter NUM_VALS = 9,
    parameter SIZE     = 16
)
(  
    input  wire                         clk,
    input  wire [NUM_VALS*SIZE - 1 : 0] in,
    output reg  [NUM_VALS*SIZE - 1 : 0] out
);
    
    reg [NUM_VALS*SIZE - 1 : 0] sorted_bus;
    
    always @ (posedge clk) begin
        out <= sorted_bus;
    end

    integer i, j;
    reg [SIZE-1:0] tmp;
    reg [SIZE-1:0] array [1:NUM_VALS];

    
    always @ * begin

        for (i=0; i<NUM_VALS; i=i+1) begin
            array[i+1] = in[i*SIZE +: SIZE];
        end

        for (i=NUM_VALS; i>0; i=i-1) begin
            for (j=1; j<i; j=j+1) begin
                if (array[j] < array[j+1]) begin
                    tmp        = array[j];
                    array[j]   = array[j+1];
                    array[j+1] = tmp;
                end 
            end
        end

       for (i=0; i<NUM_VALS; i=i+1) begin
            sorted_bus[i*SIZE +: SIZE] = array[i+1];
       end

    end
endmodule


module sort_tb;
    reg           clk;
    reg  [16-1:0] in1,  in2,  in3,  in4,  in5,  in6,  in7,  in8,  in9;
    wire [16-1:0] out1, out2, out3, out4, out5, out6, out7, out8, out9;

    sort #(.NUM_VALS(9), .SIZE(16)) dut (
        .clk (clk),
        .in  ({in1,  in2,  in3,  in4,  in5,  in6,  in7,  in8,  in9 }),
        .out ({out1, out2, out3, out4, out5, out6, out7, out8, out9})
    );

    initial begin
        in1 <= 5;
        in2 <= 9;
        in3 <= 1;
        in4 <= 3;
        in5 <= 4;
        in6 <= 6;
        in7 <= 6;
        in8 <= 3;
        in9 <= 2;
    end

    always @(posedge clk) begin
        // $display("In:  %0d %0d %0d %0d %0d %0d %0d %0d %0d", in1,  in2,  in3,  in4,  in5,  in6,  in7,  in8,  in9);
        // $display("Out: %0d %0d %0d %0d %0d %0d %0d %0d %0d", out1, out2, out3, out4, out5, out6, out7, out8, out9);
    end

    initial begin
        clk = 1'b0;
        #3;
        
        // $display("Sorted:");
        $display("%0d %0d %0d %0d %0d %0d %0d %0d %0d", out1, out2, out3, out4, out5, out6, out7, out8, out9);

        $finish;

    end

    always begin
        clk = ~clk; 
        #1;
    end

endmodule
