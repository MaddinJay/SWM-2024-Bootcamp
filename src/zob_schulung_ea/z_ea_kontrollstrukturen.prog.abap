*&---------------------------------------------------------------------*
*& Report Z_EA_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_EA_KONTROLLSTRUKTUREN.

PARAMETERS: p_name TYPE string,
            p_alter TYPE i.

DATA: lv_i Type i.
"Jünger als 20 dann Schüler, zwischen 20 und 25 Student, älter als 25 Mitarbeiter"

WRITE p_name.

**********************************************************************
*Verzweigungen
**********************************************************************


IF p_alter <= 6 AND p_alter < 20. "AND - mehrere Datensätze prüfen"
    WRITE 'Schüler'.
ELSEIF p_alter < 26 OR p_name = 'Kevin'. "OR- Kevin ist immer egal welches Alter ein Student, mit z.B. OR NOT kann man eine Aussage verneinen, also ist der Name NICHT Kevin"
    WRITE 'Student'.
ELSE.
    WRITE 'Mitarbeiter'.
ENDIF.

CASE p_alter.
  WHEN 6.
    WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
    WRITE / 'Alter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
    WRITE / 'Alter ist weder 6 noch 7 noch 8'.
ENDCASE.

**********************************************************************
*Schleifen
**********************************************************************

DO 5 TIMES.
  IF lv_i > 100.
    CONTINUE.
  ENDIF.
lv_i = lv_i + p_alter.
ENDDO.

WRITE: / 'Ergebnis der multiplikation:', lv_i.

WHILE lv_i > 50.
  lv_i = lv_i - 1.
ENDWHILE.
