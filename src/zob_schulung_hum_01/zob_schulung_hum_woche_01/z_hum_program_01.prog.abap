*&---------------------------------------------------------------------*
*& Report z_hum_program_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_hum_program_01.

*WRITE 'Hello World'.

DATA(lv_test) = 'Sabina'.

*WRITE lv_test.

*WRITE: /'Heute ist der', sy-Datum. "Ausgabe Systemdatum
*WRITE: /'Die Sprache ist', sy-langu. "Ausgabe Systemsprache
**WRITE: /'Anwendungsserver',sy-host, 'und Datenbankserver', sy-dbsys. "Ausgabe von Host und DBServer
*
*DATA(lv_text) = |Ich bin ein Text|.
*DATA(lv_Zahl) = 3.
*WRITE: /,lv_text, lv_Zahl.

DATA(lv_zahl1) = 0003.
DATA(lv_zahl2) = 0005.
DATA lv_erg TYPE i.

lv_erg = lv_zahl1 + lv_zahl2.
WRITE lv_erg.


WRITE: |Hello World { lv_test }|.
