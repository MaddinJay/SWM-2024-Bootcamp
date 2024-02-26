*&---------------------------------------------------------------------*
*& Report ZLC_ZEICHENARTIGE_DT_AS2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_zeichenartige_dt_as2.

**********************************************************************
* Definition der Struktur
**********************************************************************
TYPES: BEGIN OF lv_fahrzeug,
         modell     TYPE string,
         fahrzeugnr TYPE i,
         baujahr    TYPE i,
         farbe      TYPE string,
         kilometer  TYPE i,
       END OF lv_fahrzeug.

DATA meintraumauto TYPE lv_fahrzeug.

TYPES lt_fahrzeug TYPE TABLE OF lv_fahrzeug.
DATA gs_fahrzeug TYPE lv_fahrzeug.
DATA gt_fahrzeug TYPE lt_fahrzeug.
*DATA gt_fahrzeug2 TYPE SORTED TABLE OF lv_fahrzeug WITH UNIQUE KEY fahrzeugnr.
DATA gt_fahrzeug2 TYPE lt_fahrzeug.


gs_fahrzeug-modell = 'BMW'.
gs_fahrzeug-baujahr = 2022.
gs_fahrzeug-fahrzeugnr = 485.
gs_fahrzeug-farbe = 'blau'.
gs_fahrzeug-kilometer = 12.
*APPEND gs_fahrzeug TO gt_fahrzeug.
INSERT gs_fahrzeug INTO TABLE gt_fahrzeug.

gs_fahrzeug-modell = 'OPEL'.
gs_fahrzeug-baujahr = 2019.
gs_fahrzeug-fahrzeugnr = 596.
gs_fahrzeug-farbe = 'rot'.
gs_fahrzeug-kilometer = 212.
*APPEND gs_fahrzeug TO gt_fahrzeug.
INSERT gs_fahrzeug INTO TABLE gt_fahrzeug.

gs_fahrzeug-modell = 'VW'.
gs_fahrzeug-baujahr = 2020.
gs_fahrzeug-fahrzeugnr = 276.
gs_fahrzeug-farbe = 'schwarz'.
gs_fahrzeug-kilometer = 423.
*APPEND gs_fahrzeug TO gt_fahrzeug.
INSERT gs_fahrzeug INTO TABLE gt_fahrzeug.
*CLEAR gt_fahrzeug.
CLEAR gs_fahrzeug.

LOOP AT gt_fahrzeug INTO gs_fahrzeug.

WRITE: gs_fahrzeug-modell, gs_fahrzeug-baujahr, gs_fahrzeug-fahrzeugnr, /.

ENDLOOP.
