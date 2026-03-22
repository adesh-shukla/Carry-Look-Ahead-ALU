module CLA4(
  input [3:0]a,b,
  input cin,
  output cout,
  output[3:0]sum
);
  wire [3:0]G,P;
  assign G = a&b;
  assign P = a^b;
    
  wire [4:0]C;
  
  assign C[0] = cin;
  assign C[1] = G[0] | (P[0]&C[0]);
  assign C[2] = G[1] | (P[1]&G[0]) | (P[1]&P[0]&C[0]);
  assign C[3] = G[2] | (P[2]&G[1]) | (P[2]&P[1]&G[0]) | (P[2]&P[1]&P[0]&C[0]);
  assign C[4] = G[3] | (P[3]&G[2]) | (P[3]&P[2]&G[1]) | (P[3]&P[2]&P[1]&G[0]) | (P[3]&P[2]&P[1]&P[0]&C[0]);
  
  assign sum[0] = P[0] ^ C[0];
  assign sum[1] = P[1] ^ C[1];
  assign sum[2] = P[2] ^ C[2];
  assign sum[3] = P[3] ^ C[3];
  assign cout = C[4];
endmodule

module ALU4(
  input[3:0]a,b,
  input [1:0]sel,
  input sub,
  input cin,
  output cout,
  output [3:0]sum,
  output reg [3:0]q
);
  wire [3:0]b_modified;
  wire cout_cla;
  
  assign b_modified = b^{4{sub}};
  
  CLA4 cla(
    .a(a),
    .b(b_modified),
    .cin(cin),
    .cout(cout_cla),
    .sum(sum)
  );
  
  wire [3:0] And, Or, XOR;
  assign And = a&b;
  assign Or = a|b;
  assign XOR = a^b;
  
  always @(*)begin
    case(sel)
      2'b00:q = And;
      2'b01:q = Or;
      2'b10:q = XOR;
      2'b11:q = sum;
    endcase
  end
  assign cout = (sel==2'b11)?cout_cla : 1'b0;
endmodule

//extending to 8bit 
module ALU8(
  input [7:0]a,b,
  input [1:0]sel,
  input sub,
  output cout,
  output [7:0]sum,q
);
  wire c;
  ALU4 u1(
    .a(a[3:0]),
    .b(b[3:0]),
    .sel(sel),
    .cin(sub),
    .sub(sub),
    .cout(c),
    .sum(sum[3:0]),
    .q(q[3:0])
  );
   ALU4 u2(
     .a(a[7:4]),
     .b(b[7:4]),
     .sel(sel),
     .cin(c),
     .sub(sub),
     .cout(cout),
     .sum(sum[7:4]),
     .q(q[7:4])
  );
endmodule