// Top-level 32-bit adder using two 16-bit adders
module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);
    wire c;  // carry from lower 16-bit adder
    // Lower 16 bits
    add16 u1 (.a (a[15:0]),.b(b[15:0]),.cin(1'b0),.sum (sum[15:0]),.cout (c));
    // Upper 16 bits
    add16 u2 (.a(a[31:16]),.b (b[31:16]),.cin  (c),.sum  (sum[31:16]),.cout ());
endmodule
// 1-bit Full Adder
module add1 (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;  
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule
