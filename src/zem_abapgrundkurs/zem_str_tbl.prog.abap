*&---------------------------------------------------------------------*
*& Report ZEM_STR_TBL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_str_tbl.

TYPES: BEGIN OF lsy_plattensammlung, "Struktur definieren

         interpret(20) TYPE c,
         album(20)     TYPE c,
         label(20)     TYPE c,

       END OF lsy_plattensammlung.

DATA gs_plattensammlung TYPE lsy_plattensammlung.

gs_plattensammlung-interpret = 'John Coltrane'.
gs_plattensammlung-album     = 'A Love Supreme'.
gs_plattensammlung-label     = 'Impulse'.

DATA gv_vor TYPE string.
DATA gv_nach TYPE string.

TRANSLATE gs_plattensammlung TO UPPER CASE. "in Großbuchstaben


WRITE: gs_plattensammlung-interpret, gs_plattensammlung-album,  gs_plattensammlung-label.

ULINE.

SPLIT gs_plattensammlung-interpret AT ' ' INTO gv_vor gv_nach. "vornachname in getrennt ausgegeben

IF sy-subrc = 0. "wenn splitten erfolgreich, soll ausgabe mit benennung erfolgen

  WRITE: 'Vorname:  ', gv_vor, /, 'Nachname:   ', gv_nach, /, 'Label:  ', gs_plattensammlung-label, /, 'Album:  ', gs_plattensammlung-Album.

ENDIF.

DATA gv_price type string value 20.
DATA gv_whrung(3) TYPE c VALUE 'EUR'.
Data gv_cost type string.

CONCATENATE gv_price gv_whrung INTO gv_cost.

ULINE.
WRITE: 'Kosten:  ', gv_cost.

Uline.
Write: 'Kosten:  ', gv_price, gv_whrung.
