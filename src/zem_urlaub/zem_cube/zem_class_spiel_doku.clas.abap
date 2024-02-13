CLASS zem_class_spiel_doku DEFINITION
  PUBLIC
  INHERITING FROM zem_class_cube_erg

  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA mv_erg3 TYPE string.

    METHODS spieldoku.

    METHODS spieldoku2    IMPORTING iv_erg  TYPE string
                                    iv_name TYPE string
                                    iv_tip  TYPE string.


    Methods dokumentieren IMPORTING iv_erg  TYPE string
                                    iv_name TYPE string
                                    iv_tip TYPE string.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zem_class_spiel_doku IMPLEMENTATION.
  METHOD spieldoku.


    set_erg( IMPORTING ev_erg = mv_erg3 ).

    WRITE mv_erg3.


  ENDMETHOD.

  METHOD spieldoku2.


    DATA: BEGIN OF ls_struktur,
            name     TYPE string,
            Tip      TYPE string,
            ergebnis TYPE string,
            resultat TYPE string,

          END OF ls_struktur.

    DATA lt_tab_erg LIKE TABLE OF ls_struktur.

    Data lv_erg type string.
    Data lv_tip type string.

    lv_erg = iv_erg.
    lv_tip = iv_tip.

    IF lv_erg = iv_tip.
      ls_struktur-resultat = 'gewonnen'.
    ELSE.
      ls_struktur-resultat = 'verloren'.
    ENDIF.

   ls_struktur-name = iv_name.
   ls_struktur-tip = iv_tip.
   ls_struktur-ergebnis = iv_erg.

 APPEND ls_struktur TO lt_tab_erg.


    cl_demo_output=>display( lt_tab_erg ).



  ENDMETHOD.

  METHOD dokumentieren.

  Data lt_result type table of zem_result.

  Select Single
  From zem_result
  Fields *
  Where spielername = @iv_name
  Into @Data(ls_result).

 Data(lv_siege)   = ls_result-anzahl_siege + 1.
 Data(lv_verl)    = ls_result-anzahl_verloren + 1.
 Data(lv_gesamt)  = ls_result-anzahl_gesamt + 1.


   IF iv_erg = iv_tip.
      ls_result-spielername = iv_name.
      ls_result-anzahl_siege = lv_siege.
      ls_result-anzahl_verloren = ls_result-anzahl_verloren.
      ls_result-anzahl_gesamt = lv_gesamt.
      ls_result-anteil_siege = ls_result-anzahl_siege * 100 / ls_result-anzahl_gesamt.

      Modify zem_result from ls_result.

      ELSE.
         ls_result-spielername = iv_name.
         ls_result-anzahl_siege = ls_result-anzahl_siege.
         ls_result-anzahl_verloren = lv_verl.
         ls_result-anzahl_gesamt = lv_gesamt.
         ls_result-anteil_siege = ls_result-anzahl_siege * 100 / ls_result-anzahl_gesamt.

      Modify zem_result from ls_result.

    ENDIF.


cl_demo_output=>display( ls_result ).



  ENDMETHOD.

ENDCLASS.
