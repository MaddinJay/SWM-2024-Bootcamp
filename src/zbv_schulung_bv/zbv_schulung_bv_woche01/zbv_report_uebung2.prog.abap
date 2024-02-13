*&---------------------------------------------------------------------*
*& Report zbv_report_uebung2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_report_uebung2.

**********************************************************************
*Kontrollstrukturen
**********************************************************************

DATA(lv_Zahl) = 1.

WHILE lv_zahl <= 100.
  IF lv_zahl MOD 3 EQ 0.
  WRITE: / , 'Dreier Zahl: ', lv_zahl.
  ENDIF.
  lv_zahl = lv_zahl + 1.
  ENDWHILE.

**********************************************************************
*Typdeklaration und Struktur
**********************************************************************

*TYPES tt_int3 TYPE int1.
*
*DATA: BEGIN OF ls_struktur,
*  ID TYPE tt_int3,
*  Vorname TYPE string,
*  Nachname TYPE c LENGTH 1,
*  Alter TYPE i,
*  Softskills TYPE string,
*  END OF ls_struktur,
*  lt_tabelle LIKE TABLE OF ls_struktur.
*
*  ls_struktur-ID = 123.
*  ls_struktur-vorname = 'Johny'.
*  ls_struktur-nachname ='S'.
*  ls_struktur-alter = 25.
*  ls_struktur-Softskills = 'Motivation'.
*
*  APPEND ls_struktur TO lt_tabelle.
*
*APPEND VALUE #(
*  ID = 7
*  vorname = 'Cristiano'
*  nachname ='R'
*  alter = 38
*  Softskills = 'Ehrgeiz'
*) TO lt_tabelle.
*
*APPEND VALUE #(
*  ID = 10
*  vorname = 'Lionel'
*  nachname ='M'
*  alter = 36
*  Softskills = 'Kreativität'
*) TO lt_tabelle.
*
*APPEND VALUE #(
*  ID = 9
*  vorname = 'Robert'
*  nachname ='L'
*  alter = 35
*  Softskills = 'Ehrgeiz'
*) TO lt_tabelle.
*
*APPEND VALUE #(
*  ID = 11
*  vorname = 'Edin'
*  nachname ='D'
*  alter = 37
*  Softskills = 'Motivation'
*) TO lt_tabelle.
*
*cl_demo_output=>display( data = lt_tabelle ).

**********************************************************************
*Aufgabe Tabelle II
**********************************************************************

*DATA: BEGIN OF ls_struktur2,
*      Euro TYPE p DECIMALS 2,
*      Dollar TYPE p DECIMALS 2,
*      END OF ls_struktur2,
*      lt_tabelle2 LIKE TABLE OF ls_struktur2.
*
*DATA lv_zahl2 TYPE int1 VALUE 1.
*
*PARAMETERS p_wert TYPE p DECIMALS 2 OBLIGATORY.
*
*DO 100 TIMES.
*  ls_struktur2-euro = lv_zahl2.
*  ls_struktur2-dollar = ls_struktur2-euro * p_wert.
*  APPEND ls_struktur2 TO lt_Tabelle2.
*  lv_zahl2 = lv_zahl2 + 1.
*ENDDO.
*
*cl_demo_output=>display( data = lt_Tabelle2 ).

**********************************************************************
*Aufgabe Einsetzen
**********************************************************************

DATA: lv_zahla TYPE int1 VALUE 2,
      lv_zahlb TYPE int1 VALUE 3,
      lv_erg TYPE int1.

lv_erg =  lv_zahla + lv_zahlb.

WRITE: / 'Die Summe aus ', lv_zahla, 'und', lv_zahlb, 'ist', lv_erg, '.'.
