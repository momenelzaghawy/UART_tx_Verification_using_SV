package  UART_pkg ; 
class UART_class ;
  rand logic reset ;
  rand logic [7:0] P_DATA;
  rand logic PAR_EN;
  rand logic PAR_TYP;
  rand logic DATA_VALID;
  logic TX_OUT;
  logic Busy ;

  rand int pattern_type;

  constraint reset_con {reset dist {0 := 3 , 1 := 97};} 
  constraint PAR_TYP_con {PAR_TYP dist {0 := 50 , 1 := 50};} 
  constraint PAR_EN_con {PAR_EN dist{0 := 75 , 1 := 25};} 
  constraint DATA_VALID_con {DATA_VALID dist {0 := 8 , 1 := 92};} ;
  constraint P_DATA_LSB_con {P_DATA[0] dist {0 := 20 , 1:=80};}
  constraint pattern_type_con { pattern_type dist {0 := 96 , 1 := 4 };} 
  constraint P_DATA_con { if (pattern_type) P_DATA inside{8'hFF , 8'h00 , 8'hAA};}

  covergroup cvr_gp ;
  reset_cp : coverpoint reset { 
    bins zero = {0} ;
    bins one = {1} ;}
  PAR_TYP_cp : coverpoint PAR_TYP { 
    bins zero = {0} ;
    bins one = {1} ;}
  PAR_EN_cp : coverpoint PAR_EN { 
    bins zero = {0} ;
    bins one = {1} ;}
  P_DATA_cp : coverpoint P_DATA {
    bins all_values = {[0:255]};} 
  DATA_VALID_cp : coverpoint DATA_VALID { 
    bins zero = {0} ;
    bins one = {1} ;}
  TX_OUT_cp : coverpoint TX_OUT {
    bins zero = {0} ;
    bins one = {1} ;}
  Busy_cp : coverpoint Busy {
    bins zero = {0} ;
    bins one = {1} ;}
  PAR_EN_TYPE_cross : cross PAR_EN_cp , PAR_TYP_cp ;
  P_DATA_DATA_VALID_cross : cross P_DATA_cp , DATA_VALID_cp ;
  TX_OUT_Busy_cross : cross TX_OUT_cp , Busy_cp ;
  endgroup
  
  function new();
    cvr_gp = new();
  endfunction

endclass
endpackage