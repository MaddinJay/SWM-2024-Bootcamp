*&---------------------------------------------------------------------*
*& Report zbv_debbuging_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_debbuging_uebung.
*
*DATA: lv_Test2 TYPE string.
*"Break-Point setzen durch Doppelklick
*
*DATA(lv_test) = |Test|.
*lv_test = 'Dies ist ein Test'.
*lv_test2 = 'Dies ist ein Test'.
*
*WRITE lv_test.
*WRITE / lv_test2.

DATA: BEGIN OF ls_struktur,
      Vorname type string,
      Nachname type string,
      Beruf type string,
      END OF ls_struktur,
      lt_tabelle LIKE TABLE OF Ls_struktur.

      ls_struktur-vorname = 'Lea'.
      ls_struktur-nachname = 'Knezevic'.
      ls_struktur-Beruf ='Profi Thai Boxer wie Huhn'.
APPEND ls_struktur TO lt_Tabelle.
 cl_demo_output=>display( data = lt_Tabelle ).
