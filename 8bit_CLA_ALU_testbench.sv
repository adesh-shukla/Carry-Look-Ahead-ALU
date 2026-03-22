module testbench;
  reg [7:0]a,b;
  reg [1:0]sel;
  reg sub;
  wire cout;
  wire [7:0]sum,q;
  
  ALU8 uut(
    .a(a),
    .b(b),
    .sel(sel),
    .sub(sub),
    .cout(cout),
    .sum(sum),
    .q(q)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,testbench);
    $monitor(" a=%b b=%b sel=%b sub=%b | cout=%b sum=%b q=%b",
             a, b, sel, sub, cout, sum, q);
    sel=2'b00; sub=1'b0; a=8'hAA; b=8'h55; #10;
    sel=2'b01; sub=1'b0; a=8'hAA; b=8'h55; #10;
    sel=2'b10; sub=1'b0; a=8'hAA; b=8'h55; #10;
    sel=2'b11; sub=1'b0; a=8'd10; b=8'd5; #10;
    sel=2'b11; sub=1'b1; a=8'd10; b=8'd5; #10;
    sel=2'b11; sub=1'b1; a=8'd5; b=8'd10; #10;
    $finish;
  end
endmodule