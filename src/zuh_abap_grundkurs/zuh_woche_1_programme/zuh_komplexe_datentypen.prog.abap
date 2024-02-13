*&---------------------------------------------------------------------*
*& Report ZUH_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_komplexe_datentypen.

**********************************************************************
* MOVE-CORRESPONDING
**********************************************************************

*DATA: wa_slight TYPE slight,
*      wa-focc   TYPE sbc400focc.
*
*MOVE-CORRESPONDING wa_slight TO wa_focc. " sucht in der stuktur die gleichen Felder und übergibt die Daten

**********************************************************************
* ACHTUNG es wird nur Namesgleich geprüft, aber nicht Typengleich
**********************************************************************

**********************************************************************
* Typendefiniotion und Datendeklaration
**********************************************************************
TYPES: BEGIN OF lty_s_mitarbeiter,
         pernr   TYPE i,
         vorname TYPE string,
         name    TYPE string,
         alter   TYPE i,

       END OF lty_s_mitarbeiter.

TYPES lty_t_mitarbeiter TYPE TABLE OF  lty_s_mitarbeiter.

DATA gs_mitarbeiter TYPE lty_s_mitarbeiter.
DATA gt_mitarbeiter TYPE lty_t_mitarbeiter.
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr.

**********************************************************************
*Einfügen von Datensätzen
**********************************************************************

gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-name = 'Peter'.
gs_mitarbeiter-alter = 50.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

gs_mitarbeiter-pernr = 1.
gs_mitarbeiter-vorname = 'Paul'.
gs_mitarbeiter-name = 'Müller'.
gs_mitarbeiter-alter = 23.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
*INSERT gs_mitarbeiter INTO gt_mitarbeiter2 INDEX 1.
CLEAR gs_mitarbeiter.

APPEND LINES OF gt_mitarbeiter2 TO gt_mitarbeiter.
*INSERT LINES OF gt_mitarbeiter2 into  Table gt_mitarbeiter2. *geht nicht!
INSERT LINES OF gt_mitarbeiter2 FROM 1 TO 2 INTO  TABLE gt_mitarbeiter.

**********************************************************************
*Auslesen von Datensätzen
**********************************************************************

READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH TABLE KEY pernr = 1 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH KEY name = 'Peter' INTO gs_mitarbeiter.

CLEAR gs_mitarbeiter.
LOOP AT gt_mitarbeiter INTO gs_mitarbeiter WHERE  pernr = 1 AND name = 'Müller'.
  WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter, /.
  CLEAR gs_mitarbeiter.
ENDLOOP.
**********************************************************************
*Verändern von Datensätzen
**********************************************************************
SORT gt_mitarbeiter BY name ASCENDING.

gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-name = 'Meyer'.
gs_mitarbeiter-alter = 50.

MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Wenn Primarschlüsselvorhanden ist!
MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 2. "Wenn kein Primärschlussel vorhanden/ wenn er nicht verwendet werden soll

**********************************************************************
*Löschen von Datensätzen
**********************************************************************
DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. " Suche Zeile auf Basis Primärschlüssel und lösche
IF  sy-subrc <> 0.
  WRITE: 'Löschen hat nicht geklappt'.

ENDIF.
DELETE gt_mitarbeiter2 INDEX 1.
