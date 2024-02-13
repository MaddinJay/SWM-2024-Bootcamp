*&---------------------------------------------------------------------*
*& Report z_fb_tag3_fuba_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_tag3_fuba_uebung.

DATA: lv_result TYPE int4.

CALL FUNCTION 'ZOB_FB_FM_002'
  EXPORTING
    ip_basis    = 5
    ip_exponent = 7
  IMPORTING
    ep_result   = lv_result.

WRITE lv_result.

**** CODE von Michael:
****
****REPORT zem_modular.
****
****
****PARAMETERS: p_zahl1 TYPE i,
****            p_zahl2 TYPE i.
****
****Data lv_ergebnis type i.
****PERFORM unterprogramm1 using 1 2 changing lv_ergebnis.
****
****PERFORM potenz.
****
****Data lv_p_erg1 type i.
******data lv_p_erg type i.
****
****CALL FUNCTION 'ZEM_POTENZ'
****EXPORTING lv_p_zahl1 = 2
****          lv_p_zahl2 = 3
****Importing lv_p_erg = lv_p_erg1.
****
****
****
****FORM unterprogramm1 using lv_zahl1 type i lv_zahl2 type i changing lv_erg type i.
****
****  IF lv_zahl1 > lv_zahl2.
****
****   WRITE  / |die höhere Zahl lautet: { lv_zahl1 }|.
****
****  ELSEIF lv_zahl2 > lv_zahl1.
****
****    WRITE |die höhere Zahl lautet: { lv_zahl2 }|.
****
****  ENDIF.
****
****ENDFORM.
****
****FORM potenz.
****
****  DATA lv_potenz TYPE i.
****
****  lv_potenz = p_zahl1 ** p_zahl2.
****
****WRITE / |die Potenz aus { p_zahl1 } hoch { p_zahl2 } lautet: { lv_potenz }|.
****
****ENDFORM.
