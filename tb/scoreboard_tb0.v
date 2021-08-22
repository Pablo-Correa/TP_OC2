// Scoreboard_tb0.v - Testbench para o módulo Scoreboard

`include "./src/Scoreboard.v"

module tb_scoreboard();
    reg clock;
    reg reset;

    reg  [4:0] readaddress;
    wire       valuepending;
    wire [1:0] valueunit;
    wire [4:0] valuerow;

    reg [4:0] addrpending;
    reg [1:0] func_unit;
    reg       enablewrite;

    wire [31:0] sb_haz_column;

    reg [5:0] i;

    integer cur_time;

    // Doesn't test the second set of assynchronous i/o, for simplicity's sake
    Scoreboard s(.clock(clock),
                 .reset(reset),
                 .iss_ass_addr_a(readaddress),
                 .iss_ass_pending_a(valuepending),
                 .iss_ass_unit_a(valueunit),
                 .iss_ass_row_a(valuerow),
                 .registerunit(func_unit),
                 .writeaddr(addrpending),
                 .enablewrite(enablewrite),
                 .sb_haz_column(sb_haz_column)
    );

    initial begin
        #1
        $dumpfile("scoreboard_tb0.vcd");
        $dumpvars;        

        $display("\tTime\tClock\tRegister\tPending\t\tUnit\tData position\tHaz_Col");
        $monitor("%d\t%d\t%d\t\t%b\t\t%d\t%b", cur_time, clock, readaddress, valuepending, valueunit, valuerow, sb_haz_column);

        #51 $finish;
    end

    initial begin
        readaddress <= 5'd4;
        #4
        // register 4, memory operation
        addrpending <= 5'd4;
        func_unit   <= 2'd2;
        enablewrite <= 1'b1;
        #6
        enablewrite <= 0;
        func_unit <= 2'd0;
    end

    initial begin
        cur_time = $time;
        enablewrite <= 0;
        clock <= 0;
        reset <= 1;
        #1 reset <= 0;
        #2 reset <= 1;
    end

    always begin
        #3 clock = ~clock;
        cur_time = $time;
    end

endmodule
