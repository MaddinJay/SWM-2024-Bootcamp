*&---------------------------------------------------------------------*
*& Report ZLV_KOMPLEXE_DATENTYPEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZLV_KOMPLEXE_DATENTYPEN.


**********************************************************************
*strukturtypen definieren
**********************************************************************

TYPES: BEGIN OF str_fahrzeug,
  Herstellername(20) TYPE c,
  Modellname(20) TYPE c,
  Farbe(10) TYPE c,
  Motorleistung TYPE i,
  END OF str_fahrzeug.

  DATA meinfirmenwagen TYPE str_fahrzeug.

  meinfirmenwagen-Herstellername = 'volkswagen'.
  meinfirmenwagen-Modellname = 'passat'.
  meinfirmenwagen-Modellname = 'rot'.
  meinfirmenwagen-Motorleistung = '150'.

**********************************************************************
* strukturtypen definieren / Typendefinition
**********************************************************************

  TYPES: BEGIN OF lty_s_mitarbeiter,
    pernr TYPE i,
    vorname TYPE String,
    nachname TYPE string,
    alter TYPE i,
    END OF lty_s_mitarbeiter.

TYPES lty_t_mitarbeiter TYPE TABLE OF lty_s_mitarbeiter.

**********************************************************************
*Datendeklaration
**********************************************************************

"konkrete struktur anlegen: (gs = globale struktur)
DATA gs_mitarbeiter TYPE lty_s_mitarbeiter.
DATA gt_mitarbeiter TYPE lty_t_mitarbeiter.
DATA gt_mitarbeiter2 TYPE SORTED TABLE OF lty_s_mitarbeiter WITH UNIQUE KEY pernr.

**********************************************************************
*Einfügen von Datensätzen
**********************************************************************

gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-nachname = 'Peter'.
gs_mitarbeiter-alter = 50.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
CLEAR gs_mitarbeiter.

gs_mitarbeiter-pernr = 1.
gs_mitarbeiter-vorname = 'Paul'.
gs_mitarbeiter-nachname = 'Mueller'.
gs_mitarbeiter-alter = 50.
*APPEND gs_mitarbeiter TO gt_mitarbeiter2.
INSERT gs_mitarbeiter INTO TABLE gt_mitarbeiter2.
*INSERT gs_mitarbeiter INTO gt_mitarbeiter2 INDEX 1.
CLEAR gs_mitarbeiter.

APPEND LINES OF gt_mitarbeiter2 TO gt_mitarbeiter. "alle zeilen der gt_mitarbeiter2 tabelle in die gt_mitarbeiter reinpacken
INSERT LINES OF gt_mitarbeiter2 FROM 1 TO 2 INTO TABLE gt_mitarbeiter.

**********************************************************************
*Auslesen von Datensätzen
**********************************************************************

READ TABLE gt_mitarbeiter2 INTO gs_mitarbeiter INDEX 1.
READ TABLE gt_mitarbeiter2 INDEX 2 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH TABLE KEY pernr = 2 INTO gs_mitarbeiter.
READ TABLE gt_mitarbeiter2 WITH KEY nachname = 'Peter' INTO gs_mitarbeiter.

CLEAR gs_mitarbeiter.
LOOP AT gt_mitarbeiter INTO gs_mitarbeiter.
WRITE: gs_mitarbeiter-vorname, gs_mitarbeiter-nachname, gs_mitarbeiter-alter, /.
CLEAR gs_mitarbeiter.
ENDLOOP.

**********************************************************************
*verändern von Datensätzen
**********************************************************************

gs_mitarbeiter-pernr = 2.
gs_mitarbeiter-vorname = 'Hans'.
gs_mitarbeiter-nachname = 'Meyer'.
gs_mitarbeiter-alter = 50.

MODIFY TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. " wenn primärschlüssel vorhanden!
MODIFY gt_mitarbeiter2 FROM gs_mitarbeiter INDEX 2. "wenn kein primärschlüssel vorhanden / wenn er nicht verwendet werden soll

**********************************************************************
*löschen von datensätzen
**********************************************************************

DELETE TABLE gt_mitarbeiter2 FROM gs_mitarbeiter. " Sucht zeile auf basis PK und löscht

IF sy-subrc <> 0. "ungleich 0, es wurde mindestens eine zeile gelöscht
  WRITE: 'löschen hat nicht geklappt'.
ENDIF.

DELETE gt_mitarbeiter2 INDEX 2.
