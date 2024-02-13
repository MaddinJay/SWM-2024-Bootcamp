*&---------------------------------------------------------------------*
*& Report ZVARIABLE_EA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZVARIABLE_EA.

DATA gv_name TYPE String.
DATA gv_name1 TYPE string VALUE 'Elvin'.
DATA gv_nachname TYPE string VALUE 'Alioski'.


gv_name = 'Klaus'.


WRITE gv_name.


WRITE / gv_name1. WRITE gv_nachname.
SKIP 3.
ULINE.
WRITE 'Test Kettensatz'.
DATA:gv_name2 TYPE string VALUE 'Elvin', gv_nachname2 TYPE string VALUE 'Alioski', gv_alter TYPE i VALUE 20.
SKIP.
WRITE: gv_name2, gv_nachname2, gv_alter.
ULINE.
SKIP 3.
WRITE 'Test Variablendeklaration'.
DATA: gv_zahl1 TYPE i VALUE 3,
      gv_dezimalzahl TYPE p DECIMALS 2 VALUE '4.20',
      gv_adresse TYPE string VALUE 'Haupstraße 1'.
SKIP 1.
WRITE: gv_zahl1, gv_dezimalzahl.
Write / gv_adresse.
Skip 1.
ULINE.
SKIP 1.
WRITE 'Test Konstanten'.
SKIP 2.
CONSTANTS gc_pi TYPE p DECIMALS 2 VALUE '3.14'.
WRITE gc_pi.
SKIP 2.
ULINE.
SKIP 1.
WRITE 'Test einfache Mathematik'.
SKIP 2.


DATA gv_var1 TYPE p DECIMALS 2.
DATA gv_var2 TYPE p DECIMALS 2.
DATA gv_erg1 TYPE p DECIMALS 2.
     gv_var1 = 3.
     gv_var2 = 5.

gv_erg1 = gv_var1 + gv_var2.
WRITE / gv_erg1.

gv_erg1 = gv_var1 - gv_var2.
WRITE / gv_erg1.

gv_erg1 = gv_var1 / gv_var2.
WRITE / gv_erg1.
SKIP 2.
ULINE.
SKIP 1.
WRITE 'Test Datentypen C, N und String'.
SKIP 1.
DATA gv_c(10) TYPE c. "Die 10 gibt die länge der Zeichenfolge an, da TYPE C normalerweise nur 1 Stelle hat"
      gv_c = 'hallo12345'.

DATA gv_n(10) TYPE n."TYPE N normalerweise nur 1 Stelle, hier wieder manuell 10 vergeben"
      gv_n = 1234567890.

DATA gv_s TYPE string. "TYPE STRING beliebig lange Zeichenkette"
      gv_s = 'Hallo mein Name ist Elvin und ich bin 24 Jahre alt'.


WRITE gv_c.
WRITE / gv_n.
WRITE / gv_s.
SKIP 2.
ULINE.
SKIP 1.
WRITE 'Text Concatinate'.
SKIP 2.
CONCATENATE gv_c gv_n INTO gv_n.

WRITE gv_n.
SKIP 2.
ULINE.
SKIP 1.
WRITE 'Replace Test'.
SKIP 2.
DATA gv_string2 Type string VALUE 'Elvin'.
WRITE / gv_string2.

"Hier ersetzen wir nun Elvin durch Alioski"

REPLACE 'Elvin' IN gv_string2 WITH 'ALioski'.
WRITE / gv_string2.
SKIP 2.
ULINE.

DATA gv_ganzername TYPE string VALUE 'Hans Müller'.
DATA gv_vorname TYPE string.
DATA gv_nachname3 TYPE string.

"Hier werden wir nun die Variable gv_ganzername auf gv_vorname und gv_nachname splitten undzwar am Leerzeichen"

SPLIT gv_ganzername AT ' ' INTO gv_vorname gv_nachname3.

WRITE: gv_vorname, / gv_nachname3.
SKIP 2.
ULINE.
SKIP 1.

WRITE 'Verdichtungen von Variablen mit dem Condense-Befehl'.
SKIP 2.
DATA gv_verdichtung TYPE string VALUE '  dies ist ein   Verdichtungstest     '.

WRITE gv_verdichtung. "Hier wird der Texr normal ausgegeben"
SKIP 1.

CONDENSE gv_verdichtung. "Hier wird der Text verdichtet ausgegeben, sprich die unnötigen Leerzeichen werden entfernt"
WRITE gv_verdichtung.
SKIP 2.
ULINE.
SKIP 1.
WRITE 'Texte umwandeln in groß- und kleinbuchstaben mit dem Translate-Befehl'.
"in diesem Fall nehmen wir die oben erstelle gv_verdichtung.
SKIP 1.
TRANSLATE gv_verdichtung TO UPPER CASE. "UPPER CASE = großbuchstaben"
WRITE / gv_verdichtung.

TRANSLATE gv_verdichtung TO LOWER CASE. "LOWER CASE = kleinbuchstaben"
Write / gv_verdichtung.
SKIP 2.
ULINE.
SKIP 1.

WRITE 'Textsymbole anlegen und verwenden'.
SKIP 1.

" Textsymbole werden oben über die Menüleiste angelegt, springen -> Textelemente -> Texsymbole"

WRITE text-001.
