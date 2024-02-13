*&---------------------------------------------------------------------*
*& Report zmb_extra_uebung8
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmb_extra_uebung8.

*Erstellen Sie eine Tabelle mit einer Spalte für Zahlen.
*Befüllen Sie die Tabelle mit Zahlen von 1 - 100.
*Geben Sie den höchsten und den niedrigsten Wert aus.


Data: BEGIN OF ls_zahlen,
      zahl type i value '1',
    end of ls_zahlen.

Data: lt_zahlen like table of ls_zahlen.

do 100 times.
enddo.

cl_demo_output=>display( lt_zahlen ).
