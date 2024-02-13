*&---------------------------------------------------------------------*
*& Report zem_eingabetabelle
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_eingabetabelle.
*
Data: Begin of ls_struktur,
      euro type p DECIMALS 2,
      dollar type p DECIMALS 2,
   End of LS_STRUKTUR.
*
Data lt_tabelle like TABLE OF ls_struktur.

Append ls_struktur to lt_tabelle.
lt_tabelle = Value #( Base lt_tabelle
( euro = '20.9' dollar = '20.2')
( euro = '10.8'  dollar = '20.3')
( euro = '10.7'  dollar = '20.4')
( euro = '10.6'  dollar = '20.5')
( euro = '10.5'  )
).


Loop at lt_tabelle into ls_struktur.
Write:ls_struktur-dollar, ls_struktur-euro, /.
Endloop.

*
*Parameters p_wechsl type p DECIMALS 2.
**CONSTANTS: lc_wechsl type p DECIMALS 2 Value '1.09'.
*
*ls_struktur-euro = 0.
*
* Do 100 Times.
*
*  ls_struktur-euro = ls_struktur-euro + 1.
*  ls_struktur-dollar = ls_struktur-euro * p_wechsl.
*
* Append ls_struktur to lt_tabelle.
*
*Enddo.
*
*Loop at lt_tabelle into ls_struktur.
*Write: 'Euro:', ls_struktur-euro, 'Dollar:', ls_struktur-dollar, /.
*Endloop.

*cl_demo_output=>display( ls_struktur-euro ).
*cl_demo_output=>display( ls_struktur-dollar ).

*
*Data lv_zahla type c value 'a'.
*Data lv_zahlb type c value 'b'.
*Data lv_zahlc type c value 'c'.
*
*lv_zahla = 1.
*lv_Zahlb = 2.
*
*lv_zahlc = lv_zahla + lv_zahlb.
*
*write: 'die Summe aus a und b ist gleich c:', /, lv_zahlc.



*Types: BEgin of ls_struktur2,
*      sprache type string,
*      text type string,
*
*      End of LS_STRUKTUR2.
*
* Data: lt_tabelle2 type table of ls_struktur2,
*       ls_struktur type ls_struktur2.
*
*lt_tabelle2 = VALUE #(
*( sprache = 'DE' text = 'jaaaaa' )
*( sprache = 'AT' text = 'joooaa' )
*).
*
*Loop at lt_tabelle2 into ls_struktur.
*Write: ls_struktur-sprache, ls_struktur-text, /.
*Endloop.
*
*cl_demo_output=>display( lt_tabelle2 ).
