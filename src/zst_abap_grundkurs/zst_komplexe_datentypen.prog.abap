*&---------------------------------------------------------------------*
*& Report ZST_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_komplexe_datentypen.
*******************************************************************************************************************************
*Typdefinition und Datendeklaration
*******************************************************************************************************************************
TYPES: BEGIN OF lty_s_mitarbeiter,
         persnr  TYPE i,
         vorname TYPE string,
         name    TYPE string,
         alter   TYPE i,
       END OF lty_s_mitarbeiter.

TYPES lty_t_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter.

DATA gs_mitarbeiter TYPE lty_s_mitarbeiter.
DATA gt_mitarbeiter TYPE lty_t_mitarbeiter.
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY persnr.

*******************************************************************************************************************************
*EInfügen von Datensätzen
*******************************************************************************************************************************

gs_mitarbeiter-persnr = 2.
gs_mitarbeiter-vorname = 'Sebastian'.
gs_mitarbeiter-name = 'Thieme'.
gs_mitarbeiter-alter = '36'.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.

CLEAR gs_mitarbeiter.

gs_mitarbeiter-persnr = 1.
gs_mitarbeiter-vorname = 'Monika'.
gs_mitarbeiter-name = 'Thieme'.
gs_mitarbeiter-alter = '34'.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

APPEND LINES OF gt_mitarbeiter2 TO gt_mitarbeiter.
INSERT LINES OF gt_mitarbeiter2 FROM 1 TO 2 INTO TABLE gt_mitarbeiter. "From X to X kann zusätzlich zu INTO TABLE vermerkt werden

*******************************************************************************************************************************
*Auslesen von Datensätzen
*******************************************************************************************************************************

READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH TABLE KEY persnr = 1 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH KEY name = 'Monika' INTO gs_mitarbeiter.

CLEAR gs_mitarbeiter.
LOOP AT gt_mitarbeiter INTO gs_mitarbeiter "Liest Daten in einer Schleife in einer Tabelle aus.
  WHERE persnr = 1 AND vorname = 'Sebastian'. "WHERE (AND) Schrenken die Suche weiter ein
  WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter, /. "Gibt diese Daten dann aus
  CLEAR gs_mitarbeiter.
ENDLOOP.

*******************************************************************************************************************************
*Verändern von Datensätzen
*******************************************************************************************************************************
*SORT gt_mitarbeiter BY name ASCENDING. "aufsteigend oder Descending (absteigend)
SORT gt_mitarbeiter BY name vorname ASCENDING. "in diesem Fall würde er erst nach Name sortieren und dann innerhalb der Namen nochmal nach Personalnummer


gs_mitarbeiter-persnr = 2.
gs_mitarbeiter-vorname = 'Sebastian'.
gs_mitarbeiter-name = 'Koch'.
gs_mitarbeiter-alter = '36'.

MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Wenn Primärschlüssel vorhanden ist
MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 2. " Wenn kein Primärschlüssel vorhanden ist oder nicht verwendet werden soll

*******************************************************************************************************************************
*Löschen von Datensätzen
*******************************************************************************************************************************

DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. "Sucht Zeile auf Basis des Schlüssels und löscht

IF sy-subrc <> 0. "Positive Rückmeldung / <> 0 Negative Rückmeldung
  Write 'Löschen hat nicht geklappt'.
ENDIF.

DELETE  gt_mitarbeiter2 INDEX 1. "Zeile auf Basis des Schlüssels und löscht

WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter.
