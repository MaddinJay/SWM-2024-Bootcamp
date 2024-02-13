*&---------------------------------------------------------------------*
*& Report zfd_hauptproggi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_hauptproggi.

*******************************
* Übung Unterprogramm
*******************************
DATA lv_zahl1 TYPE i VALUE 5.
DATA lv_zahl2 TYPE i VALUE 2.

PERFORM gr_zahl_zurueck IN PROGRAM zfd_unterproggi USING lv_zahl1 CHANGING lv_zahl2.

WRITE: |Die größere Zahl ist { lv_zahl2 }|.
ULINE.

*******************************
* Übung Fuba
*******************************
DATA: lv_result TYPE i.

CALL FUNCTION 'Z_FD_POTENZ_BERECHNEN'  " der FUBA muss immer in gr. Buchstaben angegeben werden!
  EXPORTING
    ip_basis    = 5
    ip_exponent = 7
  IMPORTING
    ep_result   = lv_result.

WRITE: |Ergebnis der Potenz { lv_result }|.
ULINE.

*******************************
* EXTRA Übung: Fuba Fibonacci
*******************************
DATA lv_wieoft TYPE i VALUE 45.  " Wie oft soll Fibonacci berechnet werden.
DATA lv_result_fibo TYPE i.
CALL FUNCTION 'Z_FD_FIBONACCI'
  EXPORTING
    iv_wieoft     = lv_wieoft
  IMPORTING
    ev_fibo_summe = lv_result_fibo.

WRITE: |Ergebnis Fibonacci { lv_result_fibo } nach { lv_wieoft } mal|.
ULINE.

*******************************
* EXTRA Übung Funktionsgruppe 1 Kundennummer des Kunden
*******************************
TYPES: BEGIN OF ty_t_1,
         name1 TYPE kna1-name1,
         kunnr TYPE kna1-kunnr,
       END OF ty_t_1.

DATA lv_name1 TYPE string VALUE 'MDG Bupa'.
DATA lv_kunnr TYPE string.
DATA lt_kunde TYPE TABLE OF ty_t_1.

CALL FUNCTION 'Z_FD_GET_KUNNR_AUS_NAME1'
  EXPORTING
    iv_name1 = lv_name1
  IMPORTING
    et_kunde = lt_kunde.

WRITE: | Der Kunde { lv_name1 } hat folgende Kundennummern:|.

LOOP AT lt_kunde INTO DATA(ls_kunde).
  WRITE / ls_kunde-kunnr.
ENDLOOP.

*WRITE: | { lv_name1 } hat die Kundennummer:  { lv_kunnr }|.
ULINE.

*******************************
*  EXTRA Übung Funktionsgruppe 2  Adresse des Kunden
*******************************
DATA:
  lv_stras TYPE string,
  lv_pstlz TYPE string,
  lv_ort01 TYPE string,
  lv_land1 TYPE string.

CALL FUNCTION 'Z_FD_GET_ADRESSE_AUS_NAME1'
  EXPORTING
    iv_name1 = lv_name1
  IMPORTING
    ev_stras = lv_stras
    ev_pstlz = lv_pstlz
    ev_ort01 = lv_ort01
    ev_land1 = lv_land1.

WRITE: 'Der Kunde ', lv_name1, 'hat die Adresse:', lv_stras,',' , lv_pstlz, lv_ort01,',' , lv_land1.
ULINE.

*******************************
*  EXTRA Übung Funktionsgruppe 3  Kontaktperson des Kunden
*******************************
DATA:
  lv_kontakt_name    TYPE string,
  lv_kontakt_vorname TYPE string.

CALL FUNCTION 'Z_FD_GET_KONTAKT_AUS_NAME1'
  EXPORTING
    iv_name1           = lv_name1
  IMPORTING
    ev_kontakt_name    = lv_kontakt_name
    ev_kontakt_vorname = lv_kontakt_vorname.

WRITE: 'Die Kontaktperson des Kunden ', lv_name1,' heißt: ', lv_kontakt_vorname, lv_kontakt_name.

ULINE.

*******************************
*  EXTRA Übung Funktionsgruppe 4  Verkaufsdokumente des Kunden
*******************************
TYPES: BEGIN OF ty_t_2,
         name1 type kna1-name1,
         vbeln TYPE vbak-vbeln,
       END OF ty_t_2.

DATA: lt_vbeln TYPE TABLE OF ty_t_2.
      lv_name1 = 'Domestic US Customer 8'.

CALL FUNCTION 'Z_FD_GET_VBELN_AUS_NAME1'
  EXPORTING
    iv_name1 = lv_name1
  IMPORTING
    et_vbeln = lt_vbeln.

WRITE |Die Verkaufsbelege des Kunden { lv_name1 } lauten:|.

LOOP AT lt_vbeln INTO DATA(ls_vbeln).
  WRITE / ls_vbeln-vbeln.
ENDLOOP.


ULINE.
