*&---------------------------------------------------------------------*
*& Report z_wdh
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_wdh.

*&---------------------------------------------------------------------*
*& Report ZOB_TEST_DW
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
  SELECT
     FROM saplane
    left JOIN sflight ON saplane~planetype = sflight~planetype
    left JOIN spfli ON sflight~carrid = spfli~carrid AND sflight~connid = spfli~connid
     FIELDS
     spfli~connid,
     spfli~carrid,
     saplane~consum AS verbrauch_kg,
     saplane~planetype,
     spfli~distance AS flugdistanz,
     spfli~fltime AS flugzeit,
SUM( sflight~seatsocc ) AS seatsocc,
SUM( sflight~seatsocc_b ) AS seatsocc_b,
SUM( sflight~seatsocc_f ) AS seatsocc_f,
SUM( sflight~seatsocc + sflight~seatsocc_b + sflight~seatsocc_f ) AS totalSumOcc
*     WHERE spfli~connid = @p_flug
*     AND spfli~carrid = @p_flug2
*     AND sflight~fldate = @p_flug3
GROUP BY spfli~connid,
     spfli~carrid,
     saplane~consum,
     saplane~planetype,
     spfli~distance,
     spfli~fltime,
     sflight~carrid
  INTO table @DATA(gt_spfli).
  cl_demo_output=>display( gt_spfli ).

***********************************************************************
** Wiederholung Woche 1
*
*"Datendeklaration
*"Elementarer Typ deklarieren
*DATA lv_zahl TYPE i VALUE 3.
*
*"Variable ausgeben
**WRITE lv_zahl.
**cl_demo_output=>display( lv_zahl ). "cl_demo_output ist eine Klasse, display ist eine Methode der Klasse
*
*"Datenmainpulation
*lv_zahl = lv_zahl + 8 .
*
*"Systemwerte
*WRITE sy-uname.
*
*"Konstanten
*CONSTANTS c_wert TYPE string VALUE 'Test'.
*
*"Typdeklaration
*TYPES: ty_wert(6) TYPE c,
*       ty_wert2   TYPE c LENGTH 6.
*
*
*"Struktur deklarieren
*DATA: BEGIN OF ls_kunde,
*        id    TYPE i,
*        name  TYPE string,
*        alter TYPE i,
*      END OF ls_kunde.
*
*"Struktur befüllen
*ls_kunde-id = 5.
*ls_kunde-name = 'Test'.
*cl_demo_output=>display( ls_kunde ).
*ls_kunde = VALUE #( id = 7 ). "Die komplette Struktur wird auf id=7 abgeändert bzw. die komplette Struktur wird überschrieben
*ls_kunde = VALUE #( BASE ls_kunde  name = 'Testi' ). "Nur der Wert nach Base, also name, wird befüllt bzw. überschrieben
*cl_demo_output=>display( ls_kunde ).
*
*"Tabelle deklarieren
*DATA: lt_tabelle LIKE TABLE OF ls_kunde.
*"Tabelle befüllen
*APPEND ls_kunde TO lt_tabelle.
*append value #( id = 5 ) to lt_tabelle.
*INSERT ls_kunde INTO lt_tabelle INDEX 1.
*lt_tabelle = VALUE #( BASE lt_tabelle
*                  ( id = 8  name = 'Name 1' alter = 12 )
*                  ( id = 12 name = 'Name 2' alter = 7 ) "doppelte Klammer weil eine Klammer pro Struktur/Zeile
*                  ).
*lt_tabelle = VALUE #(
*                  ( id = 8  name = 'Name 3' alter = 12 )
*                  ).
*WRITE 'Test'.
*
*"Schleife
*"Loop -> Tabellen
*"While Bed
*"do x Times.
*
*"Verzweigung
*"if
*"case
**if ls_kunde-alte = 10 AND ls_kunde-name = 'Test'.
