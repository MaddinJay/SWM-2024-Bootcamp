*&---------------------------------------------------------------------*
*& Report ZLC_KOMPLEXE_DATENTYPEN_FB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_komplexe_datentyp_fb_prest.
**********************************************************************
* Typdefinitionen und Datendeklarationen
**********************************************************************
TYPES: BEGIN OF lty_s_mitarbeiter,                                "lty_s = lokaler Typ (Strukturtyp)
         pernr   TYPE i,
         vorname TYPE string,
         name    TYPE string,
         alter   TYPE i,
       END OF lty_s_mitarbeiter.

TYPES lty_t_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter.          "lty_t = lokaler Tabellentyp

DATA gs_mitarbeiter  TYPE lty_s_mitarbeiter.                       "gs = globaler eStrukturtyp
DATA gt_mitarbeiter  TYPE lty_t_mitarbeiter.
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr.

**********************************************************************
* Einfügen von Datensätzen
**********************************************************************
"DATA gt_mitarbeiter2 TYPE TABLE OF lty_s_mitarbeiter.             "Alternativ - Möglichkeit

gs_mitarbeiter-pernr = 1.
gs_mitarbeiter-vorname = 'Minjae'.
gs_mitarbeiter-name = 'Kim'.
gs_mitarbeiter-alter = 27.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Leon'.
gs_mitarbeiter-name = 'Goretzka'.
gs_mitarbeiter-alter = 29.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
*INSERT gs_mitarbeiter INTO gt_mitarbeiter2 INDEX 1.
CLEAR gs_mitarbeiter.

APPEND LINES OF gt_mitarbeiter2 TO gt_mitarbeiter.
INSERT LINES OF gt_mitarbeiter2 INTO TABLE gt_mitarbeiter.
*INSERT LINES OF gt_mitarbeiter2 FROM 1 TO 2 INTO TABLE gt_mitarbeiter.

**********************************************************************
* Auslesen von Datensätzen
**********************************************************************
READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH TABLE KEY pernr = 1 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH KEY name = 'Minjae' INTO gs_mitarbeiter.

CLEAR gs_mitarbeiter.
LOOP AT gt_mitarbeiter INTO gs_mitarbeiter. "WHERE pernr = 1. (Zusatz mit Where Bedingung auf bestimmte Bedingung
WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter, /.
CLEAR gs_mitarbeiter.
ENDLOOP.

**********************************************************************
* Verändern von Datensätzen
**********************************************************************
SORT gt_mitarbeiter BY name ASCENDING. "DESCENDING               "Befehl für auf- oder absteigende Sortierung

gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Leon Paul'.
gs_mitarbeiter-name = 'Goretzka'.
gs_mitarbeiter-alter = 29.

MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter.               "wenn Primärschlüssel vorhanden!
*MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 2.             "wenn kein Primärschlüssel vorhanden / wenn er nicht verwendet werden soll!

**********************************************************************
* Löschen von Datensätzen
**********************************************************************
DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter.               "sucht Zeile auf Basis PK und löscht
IF sy-subrc <>  0.
  WRITE: 'Löschen hat nicht geklappt'.
ENDIF.
DELETE gt_mitarbeiter2 INDEX 2.                                 "löscht ganze Zeile unabhängig ob vorhanden oder nicht.
