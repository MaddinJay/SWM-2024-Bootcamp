FUNCTION zem_fibonacci.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_FIBO_BEGIN) TYPE  INT1
*"     REFERENCE(IV_FIBO_BEGIN2) TYPE  INT1
*"     REFERENCE(IV_FIBO_ANZAHL) TYPE  INT1
*"  EXPORTING
*"     REFERENCE(ZEM_TAB_FIBO) TYPE  I
*"----------------------------------------------------------------------


*Types: begin of ls_fibo_st,
*  ergebnis type int1,
*      End of ls_fibo_st.

Data lt_fibo_tab1 like table of zem_tab_fibo.
Data ls_st_fibo type zem_st_fibo. "table of zem_tab_fibo.

Data lv_fibo_begin type int1.
Data lv_fibo_begin2 type int1.
Data lv_fibo_erg type int1.

lv_fibo_begin = 1.
lv_fibo_begin2 = 2.


Do IV_FIBO_ANZAHL times.

 lv_fibo_erg = iv_fibo_begin + iv_fibo_begin2.
 ls_st_fibo-zahl = lv_fibo_erg.

Append ls_st_fibo-zahl to lt_fibo_tab1.


lv_fibo_begin = lv_fibo_erg.



 Enddo.




ENDFUNCTION.
