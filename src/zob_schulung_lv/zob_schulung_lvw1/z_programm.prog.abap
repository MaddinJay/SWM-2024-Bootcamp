
REPORT z_programm.

*******************************************************************
* Datendeklaration
*******************************************************************

WRITE: / 'hello world'.

write / sy-datum.
write / sy-langu.
WRITE / sy-dbsys.

DATA(lv_text) = |Ich bin ein Text|.
DATA(lv_zahl) = 3.



DATA lv_text2 TYPE string.
lv_text2 = |ich bin zwei ein text|.
DATA lv_zahl2 TYPE int2.
lv_zahl2 = 2.

DATA: lv_text3 TYPE string VALUE 'ich bin ein text dies das ananas',
      lv_zahl3 TYPE int3 VALUE 3.

WRITE: / lv_text, lv_zahl, / lv_text2, lv_text2, / lv_text3, lv_zahl3.

*******************************************************************
* Datenmanipulation
*******************************************************************

if 'Das ist ein noach Satz' = 'Das ist ein noach Satz'.
  WRITE / 'wahr'.
  ELSE.
  WRITE  / 'falsch'.
endif.

lv_text = lv_text2 && lv_text3.
write / lv_text3.

lv_zahl = lv_zahl + lv_zahl3.
WRITE / lv_zahl.

DATA(lv_zahl4) = 0000123.
*DATA lv_zahl5 TYPE int VALUE 0000123.

*lv_zahl4 TYPE int.
*SHIFT Lv_zahl4 LEFT DELETING LEADING '0'.
WRITE lv_zahl4.

if 'das' CN 'as'.
 write / 'wahr'.
 else.
 write / 'falsch'.
endif.


*******************************************************************
* strukturen und tabellen
*******************************************************************

DATA: BEGIN OF ls_strukturname,
      kundennr TYPE  int2,
      kundenname TYPE  string,
      datum TYPE  dats,
      END OF ls_strukturname,
      lt_tabelle LIKE TABLE OF ls_strukturname.


      ls_strukturname-kundennr  = 123.
      ls_strukturname-kundenname  = 'Hans Fischer'.
      ls_strukturname-datum = sy-datum.


      APPEND ls_strukturname TO lt_tabelle.

      APPEND VALUE #( kundennr = 7 kundenname = 'karl meyer') to lt_tabelle. "schreibweise inline in die tabelle anhängen

      lt_tabelle = VALUE #( BASE lt_tabelle ( kundenname = 'sebastian müller' ) ). "basis. neue werte angehängt

      cl_demo_output=>display(
        data  = lt_tabelle
       ).

*    "******************************************************************
*    typendeklaration struktur befüllen
    "********************************************************
*
    TYPES: t_favourite_color TYPE c LENGTH 5,
           t_favourite_car TYPE C LENGTH 5.
           DATA lv_fav_colour TYPE t_favourite_color VALUE 'blue'.
           WRITE lv_fav_colour.

*******************************************************************
* LOOP
*******************************************************************

    LOOP AT lt_tabelle into ls_strukturname.
    WRITE / ls_strukturname-kundenname.
    ENDLOOP.

*******************************************************************
* CONSTANTS
*******************************************************************

  CONSTANTS: lv_text1 type string value 'ich bin ein text',
             lv_zahl1 type i value 1234.

WRITE / lv_text1.
WRITE / lv_zahl1.
