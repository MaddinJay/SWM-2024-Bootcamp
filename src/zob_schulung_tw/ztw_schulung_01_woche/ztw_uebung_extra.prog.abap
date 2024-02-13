*&---------------------------------------------------------------------*
*& Report ztw_uebung_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_uebung_extra.
*
*DATA: lv_decimal  TYPE p DECIMALS 2 VALUE '15.55',
*      lv_zahl     TYPE i VALUE 4,
*      lv_ergebnis TYPE p DECIMALS 2.
*
*lv_ergebnis = lv_decimal + lv_zahl.
*WRITE: /, 'Summe:', lv_ergebnis.
*
*lv_ergebnis = lv_decimal * lv_zahl.
*WRITE: /, 'Produkt:', lv_ergebnis.
*
*ULINE.
*
*DATA: lv_Hobbit TYPE string VALUE 'In einem Loch im Boden lebte ein Hobbit'.
*
*REPLACE ALL OCCURRENCES OF 'e' IN lv_Hobbit WITH ''.
*REPLACE ALL OCCURRENCES OF 'E' IN lv_Hobbit WITH ''.
*
*WRITE: / 'SATZ ohne E und e:', lv_Hobbit.
*

*ULINE.
*
*WRITE: / 'SYSTEM & MANDANT:', sy-sysid, sy-mandt.
*
*ULINE.
*
*WRITE: / 'Die aktuelle Uhrzeit ist:' ,sy-timlo , 'Uhr',
* / 'Das aktuelle Datum ist:' , sy-datum.
*
*ULINE.

**********************************************************************
*EXTRA ÜBUNGEN -> Stuktur erstellen und befüllen
**********************************************************************

*DATA: lv_zahl TYPE i.
*
*DO 100 TIMES.
*  lv_zahl = sy-index.
*  IF lv_zahl MOD 3 = 0.
*    WRITE lv_zahl.
*  ENDIF.
*ENDDO.
*
*ULINE /.

**********************************************************************
* Kürzere Variante
**********************************************************************
*DATA: BEGIN OF ls_teilnehmer,
*        id         TYPE int1,
*        vorname    TYPE string,
*        nachname   TYPE c LENGTH 1, "Die Länge von 'c' kann nach 'nachname' mit () hinterlegt werden. Bsp: 'nachname(1)'.
*        alter      TYPE i,
*        softskills TYPE string,
*      END OF ls_teilnehmer.

**********************************************************************
*Längere Variante
**********************************************************************
*TYPES: BEGIN OF ty_s_teilnehmer,
*         id         TYPE int1, "Deklariere einen  Integer der Länge 3 --> STRG + Leertaste -> mehrere Auswahlmöglichkeiten
*         vorname    TYPE string,
*         nachname   TYPE c,
*         alter      TYPE i,
*         softskills TYPE string,
*       END OF ty_s_teilnehmer.
*
*DATA: lt_teilnehmer TYPE TABLE OF ty_s_teilnehmer,
*      ls_teilnehmer TYPE ty_s_teilnehmer.
*
*
*ls_teilnehmer-id = '123'.
*ls_teilnehmer-vorname = 'Thea'.
*ls_teilnehmer-nachname = 'Waldhauser'.
*ls_teilnehmer-alter = '24'.
*ls_teilnehmer-softskills = 'Leidenschaftliche Programmiererin'.
*APPEND ls_teilnehmer TO lt_teilnehmer.
*CLEAR ls_teilnehmer.
*
*ls_teilnehmer-id = '124'.
*ls_teilnehmer-vorname = 'Andi'.
*ls_teilnehmer-nachname = 'Peter'.
*ls_teilnehmer-alter = '29'.
*ls_teilnehmer-softskills = 'Leidenschaftlicher Müsli Esser'.
*APPEND ls_teilnehmer TO lt_teilnehmer.
*CLEAR ls_teilnehmer.
*
*ls_teilnehmer-id = '125'.
*ls_teilnehmer-vorname = 'Paul'.
*ls_teilnehmer-nachname = 'Waldhauser'.
*ls_teilnehmer-alter = '25'.
*ls_teilnehmer-softskills = 'Leidenschaftlicher Elektriker'.
*APPEND ls_teilnehmer TO lt_teilnehmer.
*CLEAR ls_teilnehmer.
*
*ls_teilnehmer-id = '126'.
*ls_teilnehmer-vorname = 'Anton'.
*ls_teilnehmer-nachname = 'Waldhauser'.
*ls_teilnehmer-alter = '29'.
*ls_teilnehmer-softskills = 'Leidenschaftlicher Installateur'.
*APPEND ls_teilnehmer TO lt_teilnehmer.
*CLEAR ls_teilnehmer.
*
*ls_teilnehmer-id = '127'.
*ls_teilnehmer-vorname = 'Harald'.
*ls_teilnehmer-nachname = 'Barth'.
*ls_teilnehmer-alter = '41'.
*ls_teilnehmer-softskills = 'Leidenschaftlicher Hausmeister'.
*APPEND ls_teilnehmer TO lt_teilnehmer.
*CLEAR ls_teilnehmer.
*
*LOOP AT lt_teilnehmer INTO ls_teilnehmer.
*  WRITE: 'Teilnehmer ID:', ls_teilnehmer-id, /, 'Vorname:', ls_teilnehmer-vorname, /,
*  'Nachname:', ls_teilnehmer-nachname, /, 'Alter:', ls_teilnehmer-alter, /, 'Softskills:', ls_teilnehmer-softskills, /.
*ENDLOOP.

**********************************************************************
*Kürzere Schreibweise um Tabelleninhalt hinzuzufügen.
**********************************************************************
*ls_teilnehmer = VALUE #( "kürzere Schreibweise mit VALUE#( ... ).
*id = 127
*vorname = 'Harald'
*nachname = 'Barth'
*alter = '41'
*).

**********************************************************************
*Debugging
**********************************************************************
**Breakpoint setzen mit Doppelklich auf die Linke Spalte.
*DATA(lv_test) = |Test|. "<----- '||' PIPE-SYMBOL
*lv_test = 'Dies ist ein Test'.
*WRITE lv_test.
*
***********************************************************************
**Debugger Übung 2
***********************************************************************
*
*DATA: lv_add_three          TYPE i VALUE 3,
*      lv_amount             TYPE i,
*      lv_bigger_than_thirty TYPE abap_bool.
*
*
*WHILE lv_bigger_than_thirty <> abap_true.
*  "gleichbedeutend zu:
*  lv_amount += lv_add_three.
*  WRITE: 'The amount is ' , lv_amount.
* IF lv_amount >= 30.
* lv_bigger_than_thirty = abap_true.
* ENDIF.
* ENDWHILE.

**********************************************************************
*Tabelle 2
**********************************************************************
*DATA: BEGIN OF ls_werte,
*   Euro TYPE p DECIMALS 2,
*   Dollar TYPE p DEcimals 2,
*   END OF ls_werte,
*   lt_werte LIKE TABLE OF ls_werte.
*
*"fester Umrechnungskurs
*   Constants: lc_umrechnung TYPE p VALUE '1.09'.
*
*   PARAMETERS: p_urk TYPE p Decimals 2 OBLIGATORY.
*
*START-of-SELECTION.
*   DO 100 Times.
*   "im ersten Schleifendurchlauf ist der Wert Initial 0.00, darum addieren wir hier 1 am Beginn
*   ls_werte-euro = ls_werte-euro + 1.
*   "Berechnung des Dollarkurses mit Hilfe der Umrechnung und des Euro-Wertes
*   ls_werte-dollar = ls_werte-euro * lc_umrechnung.
*   "neue Zeile an die Tabelle hängen
*   APPEND ls_werte to lt_werte.
*   ENDDO.
*
*   cl_demo_output=>display( lt_werte ). "<----- "Demo Ausgabe"

**********************************************************************
*Extra Übung
**********************************************************************
DATA: lv_summe1a Type i VALUE 2,
      lv_summe2b Type i VALUE 3,
      lv_ergeb Type i.

      lv_ergeb = lv_summe1a + lv_summe2b.

      WRITE: |'Die Summe aus', lv_summe1a, 'und', lv_summe2b, 'ist', lv_ergeb,'.'|.
