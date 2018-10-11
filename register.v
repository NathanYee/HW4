// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q <= d;
        end
    end

endmodule

// 32-bit register with enable
module register32
(
output reg[31:0] q,
input[31:0]      d,
input            wrenable,
input            clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule

// 32-bit register that only outputs zero
module register32zero
(
output reg[31:0] q,
input[31:0]      d,
input            wrenable,
input            clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = 0;
        end
    end
    
endmodule