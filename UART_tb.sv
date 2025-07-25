import UART_pkg ::*;
module UART_tb (UART_if.TEST uartif) ;

UART_class a = new();

int correct_count = 0 ;
int error_count = 0 ;

initial begin
  assert_rst;
  repeat(100) begin
    assert (a.randomize())
    uartif.reset = a.reset ;
    uartif.P_DATA = a.P_DATA ;
    uartif.PAR_EN = a.PAR_EN ;
    uartif.PAR_TYP = a.PAR_TYP ;
    uartif.DATA_VALID = a.DATA_VALID;
    @(posedge uartif.clk) ;
    uartif.DATA_VALID = 0;
    repeat(10) begin
      @(posedge uartif.clk);
    a.TX_OUT = uartif.TX_OUT ;
    a.Busy = uartif.Busy ;
    @(posedge uartif.clk) ;
    check_result ;
  end
  end
  #2 $display ("correct count = %0d , error count = %0d ",correct_count,error_count);
  #2;
  $stop;
end

always @(posedge uartif.clk ) begin
  a.cvr_gp.sample();
end

task assert_rst ; 
    uartif.reset = 0 ;
    @(posedge uartif.clk);
    uartif.reset = 1 ;
endtask

task check_result ;
    if ((uartif.TX_OUT === uartif.TX_OUT_ex)&&(uartif.Busy === uartif.Busy_ex))
     correct_count ++ ;
    else begin
      $display ("Error Error Error !!!!!!!! at time %0t " , $time );
      error_count++ ;
    end
endtask

endmodule