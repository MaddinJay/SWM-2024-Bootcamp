*&---------------------------------------------------------------------*
*& Report z_uebung_datenreferenzen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_uebung_datenreferenzen.

"Datenreferenz

SELECT
   FROM
      SCARR
   FIELDS
      *
   WHERE carrid LIKE 'LH'
   INTO TABLE @DATA(lt_referenz).

"KOPIE von Tabelle in eine Struktur
LOOP AT lt_referenz INTO DATA(ls_referenz).
    ls_referenz-currcode = 'MKD'.
   MODIFY lt_referenz FROM ls_referenz.
ENDLOOP.

LOOP AT lt_referenz REFERENCE INTO DATA(lo_referenz).
    lo_referenz->currcode = 'USD'.
ENDLOOP.

LOOP AT lt_referenz ASSIGNING FIELD-SYMBOL(<fs_referenz>).
    <fs_referenz>-currcode = 'BAM'.
ENDLOOP.
