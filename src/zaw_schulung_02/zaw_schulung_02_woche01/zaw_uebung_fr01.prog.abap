*&---------------------------------------------------------------------*
*& Report zaw_uebung_fr01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_uebung_fr01.

" Geben Sie das kleine Einmaleins aus.

*DATA lv_ergebnis TYPE i.
*DATA(lv_faktor1) = 1.
*DATA(lv_faktor2) = 0.
*DATA(lv_faktor3) = 0.
*DATA(lv_faktor4) = 0.
*DATA(lv_faktor5) = 0.
*DATA(lv_faktor6) = 0.
*DATA(lv_faktor7) = 0.
*DATA(lv_faktor8) = 0.
*DATA(lv_faktor9) = 0.
*DATA(lv_faktor10) = 0.
*DATA(lv_faktor11) = 0.
*
*DO 10 TIMES.
*  lv_faktor2 = lv_faktor2 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor2.
*  WRITE: / | { lv_faktor1 } x { lv_faktor2 } = { lv_ergebnis }|.
*ENDDO.
*
*ULINE.
*
*DO 10 TIMES.
*  lv_faktor1 = 2.
*  lv_faktor3 = lv_faktor3 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor3.
*  WRITE: / | { lv_faktor1 } x { lv_faktor3 } = { lv_ergebnis }|.
*ENDDO.
*
*ULINE.
*
*DO 10 TIMES.
*  lv_faktor1 = 3.
*  lv_faktor4 = lv_faktor4 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor4.
*  WRITE: / | { lv_faktor1 } x { lv_faktor4 } = { lv_ergebnis }|.
*ENDDO.
*
*ULINE.
*
*DO 10 TIMES.
*  lv_faktor1 = 4.
*  lv_faktor5 = lv_faktor5 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor5.
*  WRITE: / | { lv_faktor1 } x { lv_faktor5 } = { lv_ergebnis }|.
*ENDDO.
*
*ULINE.
*
*DO 10 TIMES.
*  lv_faktor1 = 5.
*  lv_faktor6 = lv_faktor6 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor6.
*  WRITE: / | { lv_faktor1 } x { lv_faktor6 } = { lv_ergebnis }|.
*ENDDO.
*
*ULINE.
*
*DO 10 TIMES.
*  lv_faktor1 = 6.
*  lv_faktor7 = lv_faktor7 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor7.
*  WRITE: / | { lv_faktor1 } x { lv_faktor7 } = { lv_ergebnis }|.
*ENDDO.
*
*ULINE.
*
*DO 10 TIMES.
*  lv_faktor1 = 7.
*  lv_faktor8 = lv_faktor8 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor8.
*  WRITE: / | { lv_faktor1 } x { lv_faktor8 } = { lv_ergebnis }|.
*ENDDO.
*
*ULINE.
*
*DO 10 TIMES.
*  lv_faktor1 = 8.
*  lv_faktor9 = lv_faktor9 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor9.
*  WRITE: / | { lv_faktor1 } x { lv_faktor9 } = { lv_ergebnis }|.
*ENDDO.
*
*ULINE.
*
*DO 10 TIMES.
*  lv_faktor1 = 9.
*  lv_faktor10 = lv_faktor10 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor10.
*  WRITE: / | { lv_faktor1 } x { lv_faktor10 } = { lv_ergebnis }|.
*ENDDO.
*
*ULINE.
*
*DO 10 TIMES.
*  lv_faktor1 = 10.
*  lv_faktor11 = lv_faktor11 + 1.
*  lv_ergebnis = lv_faktor1 * lv_faktor11.
*  WRITE: / | { lv_faktor1 } x { lv_faktor11 } = { lv_ergebnis }|.
*ENDDO.


*DATA: lv_fak1 TYPE i,
*      lv_fak2 TYPE i,
*      lv_erg  TYPE i.
*
*DO 10 TIMES.
*  lv_fak1 = sy-index.
*  ULINE.
*  DO 10 TIMES.
*    lv_fak2 = sy-index.
*    lv_erg = lv_fak1 * lv_fak2.
*    WRITE: /  | { lv_fak1 } x { lv_fak2 } = { lv_erg }|.
*  ENDDO.
*ENDDO.


" Erstellen Sie eine Tabelle mit einer Spalte für Zahlen. Befüllen Sie die Tabelle mit Zahlen von 1 - 100.
" Geben Sie den höchsten und den niedrigsten Wert aus.


" Erstellen Sie zwei Variablen mit zwei Sätzen. Berechnen Sie Längenunterschied zwischen den zwei Strings und geben Sie das Ergebnis aus.

DATA: lv_satz1 TYPE string VALUE 'Heute schneit es sehr viel.',
      lv_satz2 TYPE string VALUE 'Hoffentlich schneit es auch morgen noch.',
      lv_lang1 TYPE i,
      lv_lang2 TYPE i.

lv_lang1 = strlen( lv_satz1 ).
lv_lang2 = strlen( lv_satz2 ).

WRITE: |Satz 1 hat eine Länge von { lv_lang1 } Zeichen.|,
/ |Satz 2 hat eine Länge von { lv_lang2 } Zeichen.|.


DATA: lv_text   TYPE string,
      lv_length TYPE i.

lv_text = |Thus contumely, the native hue of resolution devoutly to others that flesh is heir to, 'tis nobler in that patient merit of troubles, and their to, 'tis a consience of resolution devoutly to be wish'd.|.

lv_length = strlen( lv_text ).

WRITE: / |Der Satz hat eine Länge von { lv_length } Zeichen.|.
