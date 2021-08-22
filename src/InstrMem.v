`ifndef INSTRMEM_V
`define INSTRMEM_V

// Instruction Memory
module InstrMem(
    input       wire            clk,
    input       wire    [6:0]   addr, 
    output      wire    [31:0]  data
);
    // 32-bit memory with 128 entries
	reg [31:0] mem [0:127];             
	
    // Load requested instrucion into data output
	assign data = mem[addr];

    /* 
    // Old way of initializing memory, 
    // Now we do it in testbench

    // Number of memory entries,
    // not the same as the memory size
	parameter NMEM = 128;  
							
    // file to read data from
	parameter IM_DATA = "im_data.hex";
    initial begin
	    $readmemh(IM_DATA, mem, 0, NMEM-1);
	end
    */
endmodule

`endif
