module test2;
reg clk1,clk2;
integer K;
mips32 uut(clk1,clk2);

initial begin
    clk1=0;clk2=0;
    repeat(50)
    begin
        #5 clk1=1;#5 clk1=0;
        #5 clk2=1;#5 clk2=0;
    end
end

initial begin
    for(K=0;K<32;K++)
    uut.Reg[K]=K;

    uut.Mem[0]=32'h28010078;
    uut.Mem[1]=32'h0c631800;
    uut.Mem[2]=32'h20220000;
    uut.Mem[3]=32'h0c631800;
    uut.Mem[4]=32'h2842002d;
    uut.Mem[5]=32'h0c631800;
    uut.Mem[6]=32'h24220001;
    uut.Mem[7]=32'hfc000000;
    uut.Mem[120]=85;

    uut.HALTED=0;
    uut.PC=0;
    uut.TAKEN_BRANCH=0;

    #500
    
    $display("Mem[120]:%4d\nMem[121]:%4d",uut.Mem[120],uut.Mem[121]);
    

end

initial begin
    $dumpfile("mips.vcd");
    $dumpvars(0,test2);
    #600 $finish;
end
endmodule