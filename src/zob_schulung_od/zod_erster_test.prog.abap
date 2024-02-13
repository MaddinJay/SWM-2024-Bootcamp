*&---------------------------------------------------------------------*
*& Report ZOD_ERSTER_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zod_erster_test.
TYPES: BEGIN OF lty_s_zdaten,
         znr           TYPE string,
         ztyp          TYPE string,
         zbeschreibung TYPE string,
         zstatus       TYPE i,
       END OF lty_s_zdaten.
**********************************************************************
*Einfache Struktur
**********************************************************************
DATA gs_zdaten TYPE lty_s_zdaten.
*  DATA gt_zdaten TYPE TABLE OF lty_s_zdaten WITH KEY znr.
DATA gt_zdaten TYPE TABLE OF lty_s_zdaten WITH DEFAULT KEY.
DATA gt_zdaten2 TYPE TABLE OF lty_s_zdaten.

gs_zdaten-znr = 'A86384'.
gs_zdaten-ztyp ='4 Quadrant'.
gs_zdaten-zbeschreibung ='ZMD'.
gs_zdaten-zstatus = 1.
INSERT gs_zdaten INTO TABLE gt_zdaten.

CASE gs_zdaten-zstatus.
  WHEN 1. WRITE: / , gs_zdaten-znr,' inaktiv'.
  WHEN 2. WRITE: /, gs_zdaten-znr, ' ist gestört'.
  WHEN OTHERS. WRITE: / , gs_zdaten-znr, 'aktiv'.
ENDCASE.
CLEAR gs_zdaten.

gs_zdaten-znr = 'A44444'.
gs_zdaten-ztyp ='2 Quadrant'.
gs_zdaten-zbeschreibung ='EMH'.
gs_zdaten-zstatus = 1.
INSERT gs_zdaten INTO TABLE gt_zdaten.

CASE gs_zdaten-zstatus.
  WHEN 1. WRITE: / , gs_zdaten-znr, ' inativ'.
  WHEN 2. WRITE: /, gs_zdaten-znr, ' ist gestört'.
  WHEN OTHERS. WRITE: / , gs_zdaten-znr, ' aktiv'.
ENDCASE.
CLEAR gs_zdaten.

gs_zdaten-znr = 'Z66669'.
gs_zdaten-ztyp ='Standard'.
gs_zdaten-zbeschreibung ='A1500'.
gs_zdaten-zstatus = 1.
INSERT gs_zdaten INTO TABLE gt_zdaten.
CLEAR gs_zdaten.

LOOP AT gt_zdaten INTO gs_zdaten.
READ TABLE gt_zdaten WITH KEY zstatus = 1 INTO gs_zdaten.
cl_demo_output=>display( gs_zdaten ).
ENDLOOP.
*READ TABLE gt_zdaten WITH KEY zstatus = 1 INTO gs_zdaten.

LOOP AT gt_zdaten INTO gs_zdaten.
  IF gs_zdaten-zstatus = 1.
    WRITE: / , gs_zdaten-znr, ' Inativ'.
  ELSEIF gs_zdaten-zstatus = 2.
    WRITE: / , gs_zdaten-znr, ' Gestört'.
    ELSEIF gs_zdaten-zstatus = 3.
    WRITE: / , gs_zdaten-znr, ' Template'.
  ELSE.
    WRITE: / , gs_zdaten-znr, ' Aktiv'.
  ENDIF.
ENDLOOP.

DELETE gt_zdaten WHERE zstatus = 2.
cl_demo_output=>display( gt_zdaten ).


*  WRITE:  gs_zdaten-znr, /, gs_zdaten-ztyp, /, gs_zdaten-zbeschreibung, /, gs_zdaten-zstatus.
*  ULINE.
