*&---------------------------------------------------------------------*
*& Report ZEM_MODULARISIERUNG
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEM_MODULARISIERUNG.

  INCLUDE ZEM_MODULARISIERUNG_INCLUDE. "incluce macht 2 eingabefelder und definiert p_potenz

PERFORM potenzieren(zem_modularisierung)
  USING p_h p_zahl
  CHANGING p_potenz.

 WRITE p_potenz.

 CALL FUNCTION 'Z_EM_FUBA_TEST'
*  EXPORTING
*    IV_TEST       =
           .


          .

FORM potenzieren USING p_h p_zahl CHANGING p_potenz.
  p_potenz = p_zahl ** p_h.
ENDFORM.
