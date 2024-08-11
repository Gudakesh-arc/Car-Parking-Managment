`timescale 1ns / 1ns

module tb_car_parking_management;

    // Inputs
    reg clk, rst, sense_entry, sense_exit;
    reg [1:0] password_1, password_2;

    // Outputs
    wire green_light, red_light;
    wire [6:0] hex_1, hex_2;
    wire [3:0] space_available, space_utilized, count_cars;

    // Instantiate the Unit Under Test (UUT)
    car_parking_management uut (
        .clk(clk), 
        .rst(rst), 
        .sense_entry(sense_entry), 
        .sense_exit(sense_exit), 
        .password_1(password_1), 
        .password_2(password_2), 
        .green_light(green_light), 
        .red_light(red_light), 
        .hex_1(hex_1), 
        .hex_2(hex_2), 
        .space_available(space_available), 
        .space_utilized(space_utilized), 
        .count_cars(count_cars)
    );

    // Clock Generation
    initial begin
        clk = 0;  // Ensure the clock starts at 0
        forever #5 clk = ~clk;
    end

    // Test Sequence
    initial begin
        rst = 1;
        sense_entry = 0;
        sense_exit = 0;
        password_1 = 2'b00;
        password_2 = 2'b00;

        // Reset the system
        #10;
        rst = 0;

        // Simulate a car entering
        #10;
        sense_entry = 1;
        password_1 = 2'b01;
        password_2 = 2'b01;

        // Simulate a car exiting
        #80;
        sense_entry = 0;
        sense_exit = 1;
        #10;
        sense_exit = 0;
    end

    // Monitoring
    initial begin
        $monitor("time=%g, clk=%b, rst=%b, sense_entry=%b, sense_exit=%b, password_1=%b, password_2=%b,\ngreen_light=%b, red_light=%b, hex_1=%b, hex_2=%b, space_available=%d, space_utilized=%d, count_cars=%d", $time, clk, rst, sense_entry, sense_exit, password_1, password_2, green_light, red_light, hex_1, hex_2, space_available, space_utilized, count_cars);
        #150 $finish;
    end

endmodule
