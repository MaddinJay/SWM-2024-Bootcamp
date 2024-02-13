*&---------------------------------------------------------------------*
*& Report zem_modular
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_modular.


*PARAMETERS: p_zahl1 TYPE i,
*            p_zahl2 TYPE i.
*
*Data lv_ergebnis type i.
*PERFORM unterprogramm1 using 1 2 changing lv_ergebnis.
*
*PERFORM potenz.
*
*Data lv_p_erg1 type i.
***data lv_p_erg type i.
*
*CALL FUNCTION 'ZEM_POTENZ'
*EXPORTING lv_p_zahl1 = 2
*          lv_p_zahl2 = 3
*Importing lv_p_erg = lv_p_erg1.
*
*
*
*FORM unterprogramm1 using lv_zahl1 type i lv_zahl2 type i changing lv_erg type i.
*
*  IF lv_zahl1 > lv_zahl2.
*
*   WRITE  / |die höhere Zahl lautet: { lv_zahl1 }|.
*
*  ELSEIF lv_zahl2 > lv_zahl1.
*
*    WRITE |die höhere Zahl lautet: { lv_zahl2 }|.
*
*  ENDIF.
*
*ENDFORM.
*
*FORM potenz.

*  DATA lv_potenz TYPE i.
*
*  lv_potenz = p_zahl1 ** p_zahl2.
*
*WRITE / |die Potenz aus { p_zahl1 } hoch { p_zahl2 } lautet: { lv_potenz }|.
*
*ENDFORM.


*Select
*From kna1
*left join knvk on kna1~kunnr = knvk~kunnr
*Fields
*knvk~kunnr,
*kna1~name1,
*kna1~name2,
*kna1~STRAS,
*kna1~ekont
*Into Table @Data(lt_tab).

*PARAMETERS p_name type string.
*
*
*Data lt_tab2 type zem_tab_knr.
*
*Call FUNCTION 'ZEM_FUBA_KUNDEN'
*Exporting iv_name = p_name
*Importing lt_tab = lt_tab2.
*
*cl_demo_output=>display( lt_tab2 ).

Parameters p_text type string.

Data lv_text1 type string.
Data lv_text2 type string.
Data lv_text  type string.

lv_text = p_text.

Perform firstword using lv_text changing lv_text1.

Write lv_text1.

Form firstword using lv_text changing lv_text1.

Split: lv_text at ' ' into lv_text1 lv_text2.



Endform.
