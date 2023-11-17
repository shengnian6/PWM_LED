module tb_pwmled;

parameter  CYCLE = 20;
reg        clk    ;
reg        rst_n  ;
wire       led    ;

pwmled#(.TIMES(16)) uut(
    .clk    (clk    )  ,
    .rst_n  (rst_n  )  ,
    .led    (led    )    
);


initial begin
    clk = 0;
    forever#(CYCLE/2)begin
        clk = ~clk; 
    end
end


initial begin
    #1;
    rst_n = 0;
    #(10*CYCLE);
    rst_n = 1;
end





endmodule 
