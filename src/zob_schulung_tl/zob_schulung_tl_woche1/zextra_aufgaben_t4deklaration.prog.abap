*&---------------------------------------------------------------------*
*& Report zextra_aufgaben_t4deklaration
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zextra_aufgaben_t4deklaration.
*Aufgabe: Deklarieren sie 2 Zahlen a und b mit beliebigen TYPE
*Lassen Sie sich den folgenden Text ausgeben: 'Die Summe aus a und b ist c.'
*Ersetzen Sie a, b und c mit den Zahlenwerten.
*a+b = c

DATA: lv_a TYPE i VALUE 3,
      lv_b TYPE i VALUE 5,
      lv_c TYPE i.

lv_c = lv_a + lv_b.
WRITE: / 'Die summe aus', lv_a, 'und', lv_b, 'ist', lv_c.
ULINE.

*Extra Aufgabe: Typdeklaration II
"Struktur erstellen
TYPES: BEGIN OF lty_s_text,
        kurzel   TYPE c LENGTH 2,
        langtext TYPE string,
      END OF lty_s_text.

DATA lt_langtext TYPE TABLE OF lty_s_text.

lt_langtext = VALUE #(
( kurzel = 'DE' langtext = 'deutscher Text' )
( kurzel = 'EN' langtext = 'englischer Text' )
).


cl_demo_output=>display( lt_langtext ).
