FUNCTION ZOB_FB_FUBA_FIBONACCI.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_FIBO_BEGIN) TYPE  I
*"     REFERENCE(IV_FIBO_BEGIN2) TYPE  I
*"     REFERENCE(IV_FIBO_ANZAHL) TYPE  I
*"  EXPORTING
*"     REFERENCE(ZEM_TAB_FIBO) TYPE  I
*"----------------------------------------------------------------------
Data: begin of ls_fibo_st,
  ergebnis type i,
      End of ls_fibo_st.

Data et_fibo_tab type table of i.
Data lv_fibo_begin type i.
Data lv_fibo_begin2 type i.
Data lv_fibo_erg type i.
Data iv_fibo_erg type i.

Do IV_FIBO_ANZAHL times.

 iv_fibo_erg = iv_fibo_begin + iv_fibo_begin2.
Append lv_fibo_erg to et_fibo_tab.

lv_fibo_begin = lv_fibo_erg.

 Enddo.

ENDFUNCTION.


*FUNCTION Z_CALCULATE_FIBONACCI.
**"----------------------------------------------------------------------
**"*"Lokale Schnittstelle:
**"  EXPORTING
**"     VALUE(et_fibonacci) TYPE TABLE OF I
**"----------------------------------------------------------------------
*
*  DATA: lv_fibonacci1 TYPE I,
*        lv_fibonacci2 TYPE I,
*        lv_current     TYPE I.
*
*  " Initialisierung der Fibonacci-Zahlen
*  lv_fibonacci1 = 0.
*  lv_fibonacci2 = 1.
*
*  " Füge die ersten beiden Fibonacci-Zahlen zur Tabelle hinzu
*  APPEND lv_fibonacci1 TO et_fibonacci.
*  APPEND lv_fibonacci2 TO et_fibonacci.
*
*  " Berechne die restlichen Fibonacci-Zahlen bis 15
*  DO 13 TIMES.
*    lv_current = lv_fibonacci1 + lv_fibonacci2.
*    lv_fibonacci1 = lv_fibonacci2.
*    lv_fibonacci2 = lv_current.
*    APPEND lv_current TO et_fibonacci.
*  ENDDO.
*
*ENDFUNCTION.
