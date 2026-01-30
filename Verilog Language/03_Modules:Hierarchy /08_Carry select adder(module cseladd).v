module top_module(
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_lo;
    wire [15:0] sum_hi0, sum_hi1;
    wire cout_lo;
    // Lower 16 bits adder
    add16 u0 (.a(a[15:0]),.b (b[15:0]),.cin  (1'b0),.sum  (sum_lo),.cout (cout_lo));
    // Upper 16 bits assuming carry-in = 0
    add16 u1 (.a (a[31:16]),.b (b[31:16]),.cin (1'b0),.sum  (sum_hi0),.cout ());
    // Upper 16 bits assuming carry-in = 1
    add16 u2 (.a(a[31:16]),.b(b[31:16]),.cin  (1'b1),.sum  (sum_hi1),.cout ());
    // Final sum (carry-select multiplexer)
    assign sum[15:0]  = sum_lo;
    assign sum[31:16] = (cout_lo) ? sum_hi1 : sum_hi0;

endmodule
