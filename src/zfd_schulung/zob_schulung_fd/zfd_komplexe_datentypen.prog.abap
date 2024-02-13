*&---------------------------------------------------------------------*
*& Report ZFD_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_komplexe_datentypen.

**********************************************************************
*Typendefinitionen und Datendeklarationen
**********************************************************************
TYPES: BEGIN OF lty_s_mitarbeiter,
         pernr   TYPE i,
         vorname TYPE string,
         name    TYPE string,
         alter   TYPE i,

       END OF lty_s_mitarbeiter.

TYPES lty_t_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter.

DATA gs_mitarbeiter TYPE lty_s_mitarbeiter.
DATA gt_mitarbeiter TYPE lty_t_mitarbeiter.
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr.

**********************************************************************
*Einfügen von Datensätzen
**********************************************************************

gs_mitarbeiter-pernr =  2.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-name = 'Peter'.
gs_mitarbeiter-alter = 50.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

gs_mitarbeiter-pernr =  1.
gs_mitarbeiter-vorname = 'Paul'.
gs_mitarbeiter-name = 'Müller'.
gs_mitarbeiter-alter = 23.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
*INSERT gs_mitarbeiter INTO gt_mitarbeiter2 INDEX 1.
CLEAR gs_mitarbeiter.

APPEND LINES OF gt_mitarbeiter2 TO gt_mitarbeiter.
*INSERT LINES OF gt_mitarbeiter2 INTO TABLE gt_mitarbeiter2. ---> Geht nicht ! Verletzung UNIQUE KEY pernr
INSERT LINES OF gt_mitarbeiter2 INTO TABLE gt_mitarbeiter.
INSERT LINES OF gt_mitarbeiter2 FROM 1 to 2 INTO TABLE gt_mitarbeiter.

**********************************************************************
*Auslesen von Datensätzen
**********************************************************************

READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH TABLE KEY pernr = 1 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH KEY name = 'Peter' INTO gs_mitarbeiter.

CLEAR gs_mitarbeiter.
LOOP AT gt_mitarbeiter into gs_mitarbeiter where pernr = 1 AND name = 'Meyer'.
WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter, /.

CLEAR gs_mitarbeiter.
ENDLOOP.

**********************************************************************
*Verändern von Datensätzen
**********************************************************************
SORT gt_mitarbeiter By name pernr ASCENDING. " funktioniert nur bei Standardtabelle!

gs_mitarbeiter-pernr =  2.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-name = 'Meyer'.
gs_mitarbeiter-alter = 50.

MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Wenn Primärschlüssel vorhanden ist!
MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 2. "Wenn kein Primärschlüssel vorhanden ist oder er nicht verwendet werden soll.

**********************************************************************
*Löschen von Datensätzen
**********************************************************************

DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. " Sucht Zeile auf Basis PK und löscht
IF sy-subrc <> 0.
  WRITE: 'Löschen mit DELETE TABLE hat nicht geklappt.'.
ENDIF.

DELETE gt_mitarbeiter2 INDEX 2.
IF sy-subrc <> 0.
  Write: 'Löschen mit DELETE * INDEX hat nicht geklappt'.
ENDIF.


WRITE: / gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter.
