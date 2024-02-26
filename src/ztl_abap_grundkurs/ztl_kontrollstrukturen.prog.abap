*&---------------------------------------------------------------------*
*& Report ZTL_KONTROLLSTRUKTUREN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztl_kontrollstrukturen.
"Damit es aber schöner aussieht wenn man es ausführt--> Auf Springen klicken --> Textelemente und dann Selektionstexte auswählen und
"den Parameter p_name dazu Text schreiben wie zb : Name des Benutzers (Achtung Report muss aktiviert werde sonst kann man keine Selektiontexte eingeben).
PARAMETERS: p_name  TYPE string,
            p_alter TYPE i.
DATA: lv_i TYPE i.
"zw. 6 und 20: Schüler
"zv. 20 und 25: Student
"Älter als 25, aber nicht älter als 65: Mitarbeiter

"Verknüpfungen sind z.B.: AND (müssen alle Bedingungen erfüllt sein), OR(muss mind. eine der Bedingungen erfüllt sein), OR NOT(prüft ob genau das eggenteil erfüllt ist.)
WRITE p_name.
*------------------------------------------------------------------
* VERZWEIGUNGEN
*------------------------------------------------------------------
" IF ELSEIF ELSE
IF p_alter >= 6 AND p_alter < 20.
  WRITE 'Schüler'.
ELSEIF p_alter < 26.
  WRITE 'Student'.
ELSEIF p_alter > 25 AND p_alter <= 65. "ELSE =wenn nichts anderes von oben zustimmt dann ist else gültig
  WRITE 'Mitarbeiter'.
ENDIF.

"Case ist schneller als IF ELSE. Einzige Verknüpfungsoperation: OR
CASE p_alter. "Eine Variable kann nur gepürüft werden, nicht mehrere wie bei IF
  WHEN 6. "nur IST GLEICH Bedingung kann hier eingegeben werden!! Keine Von Bis Bedingungen. Wenn da Steht 6 danns chaut er nur 6.
    WRITE / 'Alter ist 6 Jahre'.
  WHEN 7 OR 8.
    WRITE / 'Alter ist 7 oder 8 Jahre'.
  WHEN OTHERS.
    WRITE / 'Alter ist weder 6 noch 7 noch 8'.
ENDCASE.
*------------------------------------------------------------------
* SCHLEIFEN
*------------------------------------------------------------------
"DO Schleife:
DO 5 TIMES.
lv_i = lv_i + p_alter.
ENDDO.
WRITE: /, 'Ergebnis der Multiplikation: ', lv_i.

"WHILE Schleife:
WHILE lv_i > 50.
lv_i = lv_i - 1.
ENDWHILE.
WRITE: /, 'Ergebnis: ', lv_i.
