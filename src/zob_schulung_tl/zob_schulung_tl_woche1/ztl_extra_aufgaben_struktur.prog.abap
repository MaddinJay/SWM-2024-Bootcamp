*&---------------------------------------------------------------------*
*& Report ztl_extra_aufgaben_struktur
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_extra_aufgaben_struktur.

************************************************************************
* Aufgabenstellung: Geben Sie alle Zahlen zwischen 1 und 100 aus,
* welche ohne Rest durch 3 teilbar sind.
************************************************************************

DATA(lv_zahlen) = 1.
WHILE lv_zahlen <= 100.
IF lv_zahlen MOD 3 EQ 0.
WRITE: /, 'Durch 3 geteilt: ', lv_zahlen.
ENDIF.
lv_zahlen = lv_zahlen + 1.
ENDWHILE.

************************************************************************
* Typdeklaration Integer Wert 3
* Struktur
************************************************************************
TYPES ty_integer3 TYPE int1. "int1 hat Länge 3
"Struktur erstellen
DATA: BEGIN OF ls_struktur,
       id TYPE ty_integer3,
       vorname TYPE string,
       bu_name TYPE c,
       alter TYPE int2,
       softskills TYPE string,
       END OF ls_struktur,
       lt_tabelle LIKE TABLE OF ls_struktur.
ls_struktur-id = 1.
ls_struktur-vorname = 'Tea'.
ls_struktur-bu_name = 'L'.
ls_struktur-alter = 22.
ls_struktur-softskills = 'Teamfähigkeit'.
APPEND ls_struktur TO lt_tabelle.

"Tabelle erstellen + befüllen
APPEND VALUE #(
id = 2
vorname = 'Jonas'
bu_name = 'M'
alter = 23
softskills = 'Charisma'
) TO lt_tabelle.

APPEND VALUE #(
id = 67
vorname = 'Lea'
bu_name = 'K'
alter = 21
softskills = 'Adaptionsfähigkeit'
) TO lt_tabelle.

INSERT VALUE #(
id = 3
vorname = 'Marko'
bu_name = 'G'
alter = 26
softskills = 'Flexibilität'
) INTO TABLE lt_tabelle.

INSERT VALUE #(
id = 30
vorname = 'Dragana'
bu_name = 'B'
alter = 40
softskills = 'Problemlösungsfähigkeit'
) INTO TABLE lt_tabelle.

cl_demo_output=>display(
data = lt_tabelle ).
