
REPORT zaw_hallo_welt LINE-SIZE 50.

DATA: gv_name     TYPE string,
      gv_nachname TYPE zaw_gk_nachname,
      gv_strasse  TYPE string VALUE 'Emmy-Noether-Straße'.

gv_name = 'Antje'.
gv_nachname = 'Weiland'.

WRITE: gv_name,
gv_nachname,
/ gv_strasse.
SKIP 3.
ULINE.

types: t_int(4) type c.
data lv_var type t_int.

lv_var = '10022'. "Zahl wird nach den ersten 4 Stellen abgeschnitten, da der selbst definierte Typ nur 4 Stellen hat.
write lv_var.
