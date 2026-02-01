module top_module (
    input  cpu_overheated,
    output reg shut_off_computer,
    input  arrived,
    input  gas_tank_empty,
    output reg keep_driving
);

    always @(*) begin
        if (cpu_overheated)
            shut_off_computer = 1;
        else
            shut_off_computer = 0;   // Ensure no latch is created
    end

    always @(*) begin
        if (~arrived && ~gas_tank_empty)
            keep_driving = 1;
        else
            keep_driving = 0;        // Ensure no latch is created
    end

endmodule
