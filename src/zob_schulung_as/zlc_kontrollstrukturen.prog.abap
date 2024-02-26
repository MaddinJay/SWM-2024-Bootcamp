*&---------------------------------------------------------------------*
*& Report ZLC_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_kontrollstrukturen. "Verarbeitungsblock 1 = Hauptprogramm

PARAMETERS: pa_name  TYPE string,
            pa_alter TYPE i.

DATA: lv_i TYPE i.

"jünger 20: Schüler
"zwischen 20 und 25: Student
"älter als 25: Mitarbeiter

**********************************************************************
* Verzweigungen Verarbeitungsblock 1.1
**********************************************************************
IF pa_alter >= 6 AND pa_alter < 20.         "Ist pa_alter größer gleich 6 und gleichzeitig kleiner als 20?
  WRITE: pa_name, 'ist ein Schüler'.        "Dann ist pa_name ein Schüler!
ELSEIF pa_alter < 26 OR NOT pa_name = 'Kevin'.  "Ist pa_alter kleiner als 26 ODER lautet pa_name NICHT Kevin?
  WRITE: pa_name, 'ist ein Student'.        "Dann ist pa_name ein Student!
ELSE.
  WRITE: pa_name, 'ist ein Mitarbeiter'.    "Ansonsten ist pa_name ein Mitarbeiter!
ENDIF.

CASE pa_alter. "Man kann nur auf eine Variable prüfen
  WHEN 6. "Man kann keine Ranges prüfen
    WRITE / 'Alter ist 6 Jahre!'.
  WHEN 7 OR 8.
    WRITE / 'Alter ist 7 oder 8 Jahre!'.
  WHEN OTHERS.
    WRITE / 'Alter ist weder 6, 7 noch 8!'.
ENDCASE.

**********************************************************************
* Schleifen
**********************************************************************
DO 5 TIMES.
*  IF lv_i > 100.
*      CONTINUE.
*  ENDIF.
  CHECK lv_i <= 100.
  lv_i = lv_i + pa_alter.
  EXIT.
ENDDO.

WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.

WHILE lv_i > 50. "Die Schleife durchläuft den Prozess solang die Variable einen Wert über 50 hat.
  lv_i = lv_i - 1.
ENDWHILE.
