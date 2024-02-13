*&---------------------------------------------------------------------*
*& Report zob_report_od_konstanten
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_report_od_konstanten.

DATA: lv_text TYPE string VALUE 'In einem Loch im Boden, da lebte ein Hobbit',
      lv_zahl1 TYPE p DECIMALS 2 VALUE '15.55', "Variabledeklaration mit Nachkommastelle und vordefiniertem Wert
      lv_zahl2 TYPE p VALUE 4,
      lv_erg TYPE p DECIMALS 2,
      lv_datum TYPE sydats,
      lv_mandantid TYPE mandt.


*REPLACE ALL OCCURRENCES OF 'e' IN lv_text WITH ' '.

 lv_erg = lv_zahl1 *  lv_zahl2.

 WRITE lv_erg.

WRITE: / 'die aktuelle Zeit ist: ', sy-datlo, ' Uhr',
/, 'Mandanten ID: ', sy-mandt,
/, 'aktuelles System: ', sy-host.



*CONSTANTS lc_hello TYPE string VALUE 'Hello World!'.
*CONSTANTS lc_text TYPE string VALUE 'Ich bin ein Text'.
**
**
***lv_text = |{ lc_hello } { lc_text }|.
*CONCATENATE lc_hello lc_text INTO lv_text SEPARATED BY ' '.
**
*WRITE lv_text.
