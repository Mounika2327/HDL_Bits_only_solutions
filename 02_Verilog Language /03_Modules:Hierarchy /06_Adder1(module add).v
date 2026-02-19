module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_lower, sum_upper;
    wire carry;

    // First 16-bit adder (lower half)
    add16 u1 (
        .a   (a[15:0]),
        .b   (b[15:0]),
        .cin (1'b0),
        .sum (sum_lower),
        .cout(carry)
    );

    // Second 16-bit adder (upper half)
    add16 u2 (
        .a   (a[31:16]),
        .b   (b[31:16]),
        .cin (carry),
        .sum (sum_upper),
        .cout()       // Ignored
    );

    // Combine the result
    assign sum = {sum_upper, sum_lower};

endmodule
