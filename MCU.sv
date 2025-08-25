
`timescale 1ns / 1ps

module MCU (
    input logic clk,
    input logic reset,
    output logic [31:0]bus_write,
    output logic [31:0]bus_read
);
    logic [31:0] instrCode;
    logic [31:0] instrMemAddr;
    logic        busWe;
    logic [31:0] busAddr;
    logic [31:0] busWData;
    logic [31:0] busRData;

    assign bus_write = busWData;
    assign bus_read = busRData;


    ROM U_ROM (
        .addr(instrMemAddr),
        .data(instrCode)
    );

    CPU_RV32I U_RV32I (.*);

    RAM U_RAM (
        .clk  (clk),
        .we   (busWe),
        .addr (busAddr),
        .wData(busWData),
        .rData(busRData)
    );
endmodule
