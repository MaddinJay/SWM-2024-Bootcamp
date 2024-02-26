*&---------------------------------------------------------------------*
*& Report ZTL_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTL_KOMPLEXE_DATENTYPEN.

TYPES: BEGIN OF lty_s_mitarbeiter,
  pernr TYPE i,
  vorname TYPE string,
  name TYPE string,
  alter TYPE i,
END OF lty_s_mitarbeiter.

"Tabellentyp von Mitarbeiter anlegen lty_t = lokaler tabellentyp
TYPES lty_t_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter.

DATA gs_mitarbeiter TYPE lty_s_mitarbeiter.
*DATA gt_mitarbeiter TYPE lty_t_mitarbeiter.
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr.

gs_mitarbeiter-pernr = 1.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-name = 'Peter'.
gs_mitarbeiter-alter = 50.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2. "überschreibt oben geschriebene
CLEAR gs_mitarbeiter.

gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Paul'.
gs_mitarbeiter-name = 'Müller'.
gs_mitarbeiter-alter = 23.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
*INSERT gs_mitarbeiter INTO gt_mitarbeiter2 INDEX 1.
CLEAR gs_mitarbeiter.

READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH TABLE KEY pernr = 1 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH KEY name = 'Peter' INTO gs_mitarbeiter.

WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-name, gs_mitarbeiter-alter.
