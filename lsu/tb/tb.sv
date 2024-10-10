`timescale 1ns/1ps
module tb ();
logic        clk_i, rst_ni, st_en;
logic [11:0] addr;
logic [31:0] st_data, io_sw;
logic [31:0] ld_data, io_lcd, io_ledg, io_ledr;
logic [31:0] io_hex0, io_hex1, io_hex2, io_hex3;
logic [31:0] io_hex4, io_hex5, io_hex6, io_hex7;
logic [11:0] addr_gen;
logic [31:0] st_data_gen;
logic st_en_gen;

lsu inst_lsu (
        .clk_i    (clk_i),
        .rst_ni   (rst_ni),
        .st_en    (st_en),
        .addr     (addr),
        .st_data  (st_data),
        .io_sw    (io_sw),
        .ld_data  (ld_data),
        .io_lcd   (io_lcd),
        .io_ledg  (io_ledg),
        .io_ledr  (io_ledr),
        .io_hex0  (io_hex0),
        .io_hex1  (io_hex1),
        .io_hex2  (io_hex2),
        .io_hex3  (io_hex3),
        .io_hex4  (io_hex4),
        .io_hex5  (io_hex5),
        .io_hex6  (io_hex6),
        .io_hex7  (io_hex7)
    );

    // Clock gen
    initial begin
        clk_i = 0;
        forever #5 clk_i = ~clk_i;
    end

    // Reset gen
    initial begin
        rst_ni = 0;
        #10 rst_ni = 1;
    end

    // Wave dump
    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0,tb);
        #1000 begin
           $writememh("Mem_after.data",inst_lsu.data_mem);
           $finish(); 
        end
        
    end

    // Simulation
    integer seed1, seed2;
    // initial begin
    //     seed1 = 3;
    //     seed2 = 13;
    //     #11
    //     forever begin
    //         #10
    //         addr = $urandom_range(0/4, 2047/4) * 4;
    //         st_en = $urandom_range(0, 1);
    //         st_data = $random(seed1);
    //         io_sw = $random(seed2);
    //         if ((addr >= 12'h000) && (addr <= 12'h7FF)) begin
    //         if (st_en) begin
    //             if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //             inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //             inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //             inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //             $display("Error STORING in DATE MEM at addr=0x%0h",addr);
    //             #2 $display("Mem at addr 0x%0h = 0x%0h_%0h_%0h_%0h", addr, inst_lsu.data_mem[addr + 3], inst_lsu.data_mem[addr + 2], inst_lsu.data_mem[addr + 1], inst_lsu.data_mem[addr]);
    //         end
    //         else begin
    //             if (ld_data[7:0] != inst_lsu.data_mem[addr] ||
    //             ld_data[15:8]    != inst_lsu.data_mem[addr + 1] ||
    //             ld_data[23:16]   != inst_lsu.data_mem[addr + 2] ||
    //             ld_data[31:24]   != inst_lsu.data_mem[addr + 3])
    //             $display("Error LOADING in DATE MEM at addr=0x%0h, in mem",addr);
    //         end
    //     // Output peripherals
    //     end else if ((addr >= 12'h800) && (addr <= 12'h8FF)) begin
    //         // HEX0
    //         if (addr == 12'h800) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in HEX0 at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_hex0[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_hex0[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_hex0[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_hex0[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in HEX0 at addr=0x%0h", addr);
    //             end
    //         // HEX1
    //         end else if (addr == 12'h810) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in HEX1 at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_hex1[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_hex1[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_hex1[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_hex1[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in HEX1 at addr=0x%0h", addr);
    //             end
    //         // HEX2
    //         end else if (addr == 12'h820) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in HEX2 at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_hex2[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_hex2[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_hex2[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_hex2[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in HEX2 at addr=0x%0h", addr);
    //             end
    //         // HEX3
    //         end else if (addr == 12'h830) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in HEX3 at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_hex3[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_hex3[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_hex3[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_hex3[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in HEX3 at addr=0x%0h", addr);
    //             end
    //         // HEX4
    //         end else if (addr == 12'h840) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in HEX4 at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_hex4[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_hex4[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_hex4[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_hex4[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in HEX4 at addr=0x%0h", addr);
    //             end
    //         // HEX5
    //         end else if (addr == 12'h850) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in HEX5 at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_hex5[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_hex5[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_hex5[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_hex5[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in HEX5 at addr=0x%0h", addr);
    //             end
    //         // HEX6
    //         end else if (addr == 12'h860) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in HEX6 at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_hex6[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_hex6[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_hex6[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_hex6[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in HEX6 at addr=0x%0h", addr);
    //             end
    //         // HEX7
    //         end else if (addr == 12'h870) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in HEX7 at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_hex7[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_hex7[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_hex7[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_hex7[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in HEX7 at addr=0x%0h", addr);
    //             end
    //         // LEDR
    //         end else if (addr == 12'h880) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in LEDR at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_ledr[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_ledr[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_ledr[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_ledr[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in LEDR at addr=0x%0h", addr);
    //             end
    //         // LEDG
    //         end else if (addr == 12'h890) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in LEDG at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_ledg[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_ledg[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_ledg[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_ledg[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in LEDG at addr=0x%0h", addr);
    //             end
    //         // LCD
    //         end else if (addr == 12'h8A0) begin
    //             if (st_en) begin
    //                 if (inst_lsu.data_mem[addr] != st_data[7:0] ||
    //                     inst_lsu.data_mem[addr + 1] != st_data[15:8] ||
    //                     inst_lsu.data_mem[addr + 2] != st_data[23:16] ||
    //                     inst_lsu.data_mem[addr + 3] != st_data[31:24])
    //                     $display("Error STORING in LCD at addr=0x%0h", addr);
    //             end else begin
    //                 if (io_lcd[7:0] != inst_lsu.data_mem[addr] ||
    //                     io_lcd[15:8] != inst_lsu.data_mem[addr + 1] ||
    //                     io_lcd[23:16] != inst_lsu.data_mem[addr + 2] ||
    //                     io_lcd[31:24] != inst_lsu.data_mem[addr + 3])
    //                     $display("Error LOADING in LCD at addr=0x%0h", addr);
    //             end
    //         end
    //     // Input Peripherals
    //     end else if (addr == 12'h900) begin
    //         if (ld_data[7:0] != inst_lsu.data_mem[addr] ||
    //             ld_data[15:8] != inst_lsu.data_mem[addr + 1] ||
    //             ld_data[23:16] != inst_lsu.data_mem[addr + 2] ||
    //             ld_data[31:24] != inst_lsu.data_mem[addr + 3])
    //             $display("Error LOADING in INPUT PERIPHERALS at addr=0x%0h", addr);
    //     end
    //     end
    // end

    initial begin
        seed1 = 3;
        seed2 = 13;
        #10
            store(12'h000, 32'hDEADBEEF);
            load(12'h000);
        forever begin
            #10
            addr_gen = $urandom_range(0/4, 2047/4) * 4; //Only testing DATA MEM right now
            st_en_gen = $urandom_range(0, 1);
            st_data_gen = $random(seed1);
            store(addr_gen, st_data_gen);
            load(addr_gen);
            $display("\n");
        end
    end

    task load(input [11:0] addr);
        @(posedge clk_i) begin
            tb.st_en = 0;
            tb.addr = addr;
        end
        #1
        $display("Mem loaded from 0x%0h = 0x%0h", addr, tb.inst_lsu.ld_data);
    endtask

    task store(input [11:0] addr, input [31:0] st_data);
        @(posedge clk_i) begin
            tb.st_en = 1;
            tb.addr = addr;
            tb.st_data = st_data;
        end
        $display("Storing to mem 0x%0h  = 0x%0h", addr, st_data);
    endtask
endmodule