module UART_monitor (UART_if.MONITOR uartif) ;
  always @(posedge uartif.clk ) begin
    $display(" Reset = %0b , P_DATA = %0h , PAR_EN = %0b , PAR_TYP = %0b ,DATA_VALID = %0b " ,
     uartif.reset , uartif.P_DATA , uartif.PAR_EN , uartif.PAR_TYP ,uartif.DATA_VALID);
    $display(" TX_OUT = %0b , TX_OUT_ex = %0b , Busy = %0b , Busy_ex = %0b " , 
              uartif.TX_OUT,uartif.TX_OUT_ex,uartif.Busy,uartif.Busy_ex);
  end
endmodule