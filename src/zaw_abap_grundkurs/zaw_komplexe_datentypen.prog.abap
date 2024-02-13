*&---------------------------------------------------------------------*
*& Report ZAW_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_komplexe_datentypen.

TYPES: BEGIN OF lty_s_mitarbeiter, "Anfang des Strukturtyps
         pernr   TYPE i,
         vorname TYPE string,
         name    TYPE string,
         alter   TYPE i,
       END OF lty_s_mitarbeiter. "Ende des Strukturtyps

TYPES lty_t_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter. "Definition des Tabellentyps (t) mit dem Strukturtyp (s)

DATA gs_mitarbeiter TYPE lty_s_mitarbeiter.
DATA gt_mitarbeiter TYPE lty_t_mitarbeiter.
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr. "Tabelle wird nach Personalnummer sortiert

gs_mitarbeiter-pernr = 1.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-name = 'Peter'.
gs_mitarbeiter-alter = 50.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Paul'.
gs_mitarbeiter-name = 'Müller'.
gs_mitarbeiter-alter = 23.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

"Alle Zeilen aus Tabelle gt_mitarbeiter2 in Tabelle gt_mitarbeiter einfügen.
APPEND LINES OF gt_mitarbeiter2 TO gt_mitarbeiter. "Variante 1
INSERT LINES OF gt_mitarbeiter2 INTO TABLE gt_mitarbeiter. "Variante 2








READ TABLE gt_mitarbeiter2 INDEX 1 INTO gs_mitarbeiter. "Auslesen einer bestimmten Zeile (hier Zeile 1)
READ TABLE gt_mitarbeiter2 WITH TABLE KEY pernr = 1 INTO gs_mitarbeiter. "Auslesen des Table Key (schneller als nur Key)
READ TABLE gt_mitarbeiter2 WITH KEY name = 'Peter' INTO gs_mitarbeiter. "Auslesen eines Wertes

gs_mitarbeiter-pernr = 1.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-name = 'Meyer'. "Name soll geändert werden.
gs_mitarbeiter-alter = 50.

MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Wenn Primärschlüssel (PK) vorhanden ist.
MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 1. "Wenn kein Primärschlüssel vorhanden oder nicht verwendet werden soll.

DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Sucht Zeile auf Basis des PK und löscht diese.
DELETE gt_mitarbeiter2 INDEX 1. "Löscht Zeile 1.

WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter.
