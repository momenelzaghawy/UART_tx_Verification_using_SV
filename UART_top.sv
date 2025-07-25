module UART_top ;
  bit clk ;
  initial begin
    forever #1 clk = ~clk ;
  end

  UART_if uartif (clk) ;
  UART_tb tb (uartif) ;
  UART dut (uartif) ;
  UART_monitor MON (uartif) ;
  UART_golden_model GM (uartif) ;

  bind UART UART_sva assertion (uartif) ;

  endmodule 