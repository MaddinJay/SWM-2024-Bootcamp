*&---------------------------------------------------------------------*
*& Report zloop_verstehen_tl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zloop_verstehen_tl.

SELECT
  FROM
  SCARR
  FIELDS
  *
  WHERE CARRID = 'LH'
  INTO TABLE @DATA(lt_loop).

LOOP AT lt_loop into DATA(ls_loop). "--> INTO DATA= es kopiert die Zeilen aus der SCARR Tabelle
ls_loop-CURRCODE = 'BIH'.
MODIFY lt_loop FROM ls_loop.
ENDLOOP.

LOOP AT lt_loop REFERENCE INTO DATA(lo_loop). "--> REFERENCE= man kann sich die Daten direkt aus der Tabelle anzeigen, wird nicht kopiert
lo_loop->currcode = 'USD'.
ENDLOOP.

LOOP AT lt_loop ASSIGNING FIELD-SYMBOL(<fs_loop>). "--> FIELD-SYMBOL= man kann sich die Daten direkt aus der Tabelle anzeigen, wird nicht kopiert
  <fs_loop>-currcode = 'USD'.
ENDLOOP.

"Wenn man sich den Code mit Debugger anschaut, dann versteht man die einzelne Teile besser.
