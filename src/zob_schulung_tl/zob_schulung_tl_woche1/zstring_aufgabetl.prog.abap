*&---------------------------------------------------------------------*
*& Report zstring_aufgabetl
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zstring_aufgabetl.

DATA: lv_text TYPE string VALUE 'In einem Loch im Boden, da lebte ein Hobbit'.

REPLACE ALL OCCURRENCES OF 'e' IN lv_text WITH ``.
REPLACE ALL OCCURRENCES OF 'E' IN lv_text WITH ``. "wichtig, weil er zwischen Klein-und Großschreibung nicht unterscheiden kann.
WRITE: lv_text.
ULINE.
*WRITE: 'Mandant: ', sy-mandt, /, 'System: ', sy-sysid, /, 'Uhrzeit: ', sy-uzeit, 'Uhr'.
WRITE: 'Mandant: ', sy-mandt, /, 'System: ', sy-sysid, /, 'Uhrzeit: ', sy-timlo, 'Uhr'.
