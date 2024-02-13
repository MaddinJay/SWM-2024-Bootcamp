*&---------------------------------------------------------------------*
*& Report zst_uebung_1001_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_uebung_1001_2.

*START-OF-SELECTION.
*  DATA lv_result TYPE int1.
*  PARAMETERS: p_num1 TYPE int1,
*  p_num2 TYPE int1.
*
*  PERFORM ausgabe_zahl in Program zst_uebung_1001 USING p_num1 p_num2 CHANGING lv_result.
*  Write lv_result.

*DATA: lv_result TYPE int4.
*
*CALL FUNCTION 'Z_ST_FM_1001'
*  EXPORTING
*    ip_basis    = 5
*    ip_exponent = 7
*  IMPORTING
*    ep_result   = lv_result.
*WRITE lv_result.
*
*ULINE.
*
*DATA: lv_fibonacci_summe    TYPE i.
*
*PARAMETERS: p_num1 TYPE i.
*
*CALL FUNCTION 'Z_ST_FM_FIBO'
*  EXPORTING
*    ip_fibonacci_summand1 = 0
*    ip_fibonacci_summand2 = 1
*    ip_parameter          = p_num1
*  IMPORTING
*    ex_fibonacci_summe    = lv_fibonacci_summe.
*
*WRITE: lv_fibonacci_summe, '|'.

ULINE.

PARAMETERS: p_name TYPE kna1-name1 OBLIGATORY LOWER CASE MODIF ID sc1.
REPLACE ALL OCCURRENCES OF '*' IN p_name WITH '%'.
*PARAMETERS: p_ort TYPE kna1-ort01.

TYPES: BEGIN OF ty_kundendaten,
         kundennummer    TYPE vbak-kunnr,
         kundenname      TYPE kna1-name1,
         strasse         TYPE kna1-stras,
         plz             TYPE kna1-pstlz,
         ort             TYPE kna1-ort01,
         land            TYPE kna1-land1,
         verkaufsbeleg   TYPE vbak-vbeln,
         kontaktvorname  TYPE knvk-namev,
         kontaktnachname TYPE knvk-name1,
       END OF ty_kundendaten.

DATA: ls_kundendaten TYPE ty_kundendaten,
      lt_kundendaten TYPE TABLE OF ty_kundendaten.

CALL FUNCTION 'Z_ST_FM_KUNDEN'
  EXPORTING
    ip_parameter   = p_name
*    ip_parameter   = p_ort

  IMPORTING
    et_kundendaten = lt_kundendaten.

    cl_demo_output=>display( lt_kundendaten ).
