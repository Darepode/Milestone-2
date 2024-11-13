module testbench #(
    parameter DATA_SIZE = 8
) ();
    logic[DATA_SIZE-1:0] a, b;
    logic eq, lt;
    logic un;

    logic[1:0] expected;
    int un_errors = 0;
    int s_errors = 0;

    brc #(DATA_SIZE) dut(a, b, un, lt, eq);

    initial begin
        for (int i = 0; i < 2**17; i++) begin
            {a, b, un} = $urandom;
            // compare sign numbers
            if (!un) begin
                expected = {a == b, a < b};
            end else begin
                expected = {a == b, $signed(a) < $signed(b)};
            end
            
            #1;
            if (expected !== {eq, lt}) begin
                if(un == 0) begin
                    $display("Error: un = %b, a = %d, b = %d, result = %b, expected = %b",
                            un, a, b, {eq, lt}, expected);
                    un_errors++;
                end
                else begin
                    $display("Error: un = %b, a = %d, b = %d, result = %b, expected = %b",
                            un, $signed(a), $signed(b), {eq, lt}, expected);
                    s_errors++;
                end
            end
            #1;
        end
        $display("Test finished with %3d unsigned errors.", un_errors);
        $display("Test finished with %3d signed errors.", s_errors);
    end
endmodule