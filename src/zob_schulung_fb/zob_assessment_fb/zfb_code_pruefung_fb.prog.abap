*&---------------------------------------------------------------------*
*& Report zfb_code_pruefung_fb
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfb_code_pruefung_fb.

*DATA lv_count TYPE i VALUE 0.
*DATA lv_toggle TYPE abap_bool VALUE abap_true.
*
*WHILE lv_count <> 11.
*  IF lv_toggle = abap_true.
*    lv_count = lv_count + 3.
*    lv_toggle = abap_false.
*  ELSE.
*    lv_count = lv_count + 2.
*    lv_toggle = abap_true.
*  ENDIF.
*  WRITE lv_count.
*ENDWHILE.

TYPES:
  BEGIN OF ty_daten,
    name TYPE c LENGTH 8,
    datum TYPE d,
    zahl TYPE i,
  END OF ty_daten.

  Data: ls_daten TYPE ty_daten.

        ls_daten = VALUE #(  name = 'Horst' datum = sy-datum zahl = 5 ).

  ls_daten-name = 'Klaus'.

  WHILE ls_daten-zahl < 5.
    ls_daten-name = 'Peter'.
  ENDWHILE.

  cl_demo_output=>display( ls_daten ).
