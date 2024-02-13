*&---------------------------------------------------------------------*
*& Report zmb_extra_uebung2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_extra_uebung2.

*Extra: Einsetzen
*Deklarieren Sie zwei Zahlen a und b und geben Sie ihnen beliebige Werte.
*Lassen Sie sich den folgenden Text ausgeben. Ersetzen Sie a, b und c mit den
*Zahlenwerten. c ist die Summe aus a und b.
*'Die Summe aus a und b ist c.'

 Data lv_a type i value 10.
 Data lv_b type i value 20.
 Data lv_c type i.

 lv_c = lv_a + lv_b.


 write: |Die Summe aus { lv_a } und { lv_b } ist { lv_c }|.

*Extra: Typdeklaration II
*Deklarieren Sie einen Typ.
*Dieser enthält zwei Spalten für Sprachkürzel und Text.
*Verwenden Sie den Typ um eine Tabelle zu deklarieren.
*Befüllen Sie die Tabelle.


Types: begin of ly_s_sprache,
       Kuerzel       type char2, "c length 2
       Text         type string,
 end of ly_s_sprache.

DATA lt_sprache type table of ly_s_sprache.
lt_sprache = Value #(
( Kuerzel = 'DE' text = 'deutscher Text')
( Kuerzel = 'AT' text = 'östereichischer Text')
( Kuerzel = 'DE' text = 'deutscher Text')
( Kuerzel = 'DE' text = 'deutscher Text')
).

 cl_demo_output=>display( lt_sprache ).
