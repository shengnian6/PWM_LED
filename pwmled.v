module pwmled(
    clk        ,
    rst_n      ,
    led          
);

parameter    TIMES = 200 ;

input       clk   ;
input       rst_n ;
output      led   ;

reg         led   ;



reg [18:0]  cnt0     ;
wire        add_cnt0 ;
wire        end_cnt0 ;
reg [18:0]  x        ;
always @(posedge clk or negedge rst_n) begin 
    if (rst_n==0) begin
        cnt0 <= 0; 
    end
    else if(add_cnt0) begin
        if(end_cnt0)
            cnt0 <= 0; 
        else
            cnt0 <= cnt0+1 ;
   end
end
assign add_cnt0 = 1;
assign end_cnt0 = add_cnt0  && cnt0 ==500000-1 ;



reg [ 7:0]  cnt1     ;
wire        add_cnt1 ;
wire        end_cnt1 ;
always @(posedge clk or negedge rst_n) begin 
    if (rst_n==0) begin
        cnt1 <= 0; 
    end
    else if(add_cnt1) begin
        if(end_cnt1)
            cnt1 <= 0; 
        else
            cnt1 <= cnt1+1 ;
   end
end
assign add_cnt1 = end_cnt0;
assign end_cnt1 = add_cnt1  && cnt1 == TIMES-1 ;


reg [ 3:0]  cnt2     ;
wire        add_cnt2 ;
wire        end_cnt2 ;
always @(posedge clk or negedge rst_n) begin 
    if (rst_n==0) begin
        cnt2 <= 0; 
    end
    else if(add_cnt2) begin
        if(end_cnt2)
            cnt2 <= 0; 
        else
            cnt2 <= cnt2+1 ;
   end
end
assign add_cnt2 = end_cnt1;
assign end_cnt2 = add_cnt2  && cnt2 == 10-1 ;



always  @(posedge clk or negedge rst_n)begin
    if(rst_n==1'b0)begin
        led <= 1;
    end
    /*
    else if(cnt2==0 && add_cnt0 && cnt0==475000-1)begin
        led <= 0;
    end
    else if(cnt2==1 && add_cnt0 && cnt0==425000-1)begin
        led <= 0;
    end
    */
    else if(add_cnt0 && cnt0==x-1)begin
        led <= 0;
    end
    else if(end_cnt0)begin
        led <= 1;
    end
end

always  @(*)begin
    if(cnt2==0)begin
        x = 475_000;
    end
    else if(cnt2==1)begin
        x = 425_000;
    end
    else if(cnt2==2)begin
        x = 350_000;
    end
    else if(cnt2==3)begin
        x = 250_000;
    end
    else if(cnt2==4)begin
        x = 100_000;
    end
    else if(cnt2==5)begin
        x = 100_000;
    end
    else if(cnt2==6)begin
        x = 250_000;
    end
    else if(cnt2==7)begin
        x = 350_000;
    end
    else if(cnt2==8)begin
        x = 425_000;
    end
    else begin
        x = 475_000;
    end
end






 



endmodule
