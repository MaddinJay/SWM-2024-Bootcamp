*&---------------------------------------------------------------------*
*& Report zem_report22
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_report22.

Data lv_dezi type p DECIMALS 2 value '15.55'.
Data lv_inter type i value 4.
Data lv_erg type p DECIMALS 2.

lv_erg = lv_dezi * lv_inter.

Write: 'Produkt:', lv_erg.

ADD lv_inter to lv_dezi.

Write: /, 'Summe:', lV_dezi.

Data lv_text type string value 'In einem Loch, da lebte ein Hobbit'.

Replace all OCCURRENCES OF 'e' in lv_text WITH ' '.

Write / lv_text.

Uline.

Skip 2.

Write / sy-uname.
Write / sy-sysid.

Write / sy-mandt.

Skip 2.

uline.

Write: / 'das ist die aktuelle Uhrzeit:', sy-uzeit.

Data: lv_auf type i value 1.

Do 100 Times.

  lv_auf = lv_auf + 1.

   IF lv_auf MOD 3 EQ 0.
      Write: /, 'durch 3 teilbar:', lv_auf.
   Endif.

Enddo.

Uline.

Types t_integer3 type int1.

DATA: Begin of ls_struktur1,

        id type t_integer3,
        vorname type string,
        abuchs type c,
        alter type int3,
        softskill type string,

       End of ls_struktur1.

 Data lt_tabelle1 like table of ls_struktur1.
*Data gs_struktur type ls_struktur1.

 ls_struktur1-id = 001.
 ls_struktur1-vorname = 'Hans'.
 ls_struktur1-abuchs = 'H'.
 ls_struktur1-alter = '23'.
 ls_struktur1-softskill = 'Bluthund'.
 Append ls_struktur1 to lt_tabelle1.

 ls_struktur1-id = 003.
 ls_struktur1-vorname = 'Peter'.
 ls_struktur1-abuchs = 'P'.
 ls_struktur1-alter = '52'.
 ls_struktur1-softskill = 'Mulli'.
 Append ls_struktur1 to lt_tabelle1.


Loop at lt_tabelle1 INTO ls_struktur1.
   Write: /, 'ID:', ls_struktur1-id, /, 'Vorname:', ls_struktur1-vorname.
Endloop.
