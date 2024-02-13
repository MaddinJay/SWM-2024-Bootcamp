*&---------------------------------------------------------------------*
*& Report zfd_gruppenaufgabe_reisebuero
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_gruppenaufgabe_reisebuero.

TABLES stravelag.

SELECT
  FROM stravelag
FIELDS *
ORDER BY name ASCENDING
INTO TABLE @DATA(lt_stravelag).


*******************************
* Gesamte Tabelle anzeigen
*******************************
SELECTION-SCREEN BEGIN OF BLOCK Block1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_gAnz1 AS CHECKBOX DEFAULT 'X'.

  IF p_gAnz1 = abap_true.
    cl_demo_output=>display( lt_stravelag ).
  ENDIF.
SELECTION-SCREEN END OF BLOCK Block1.

*******************************
* Suche nach Reisebüro
*******************************
PARAMETERS: p_rname  TYPE stravelag-name LOWER CASE OBLIGATORY.

*******************************
* Reisebüro ändern oder anlegen
*******************************
SELECTION-SCREEN BEGIN OF BLOCK Block3 WITH FRAME TITLE TEXT-003.
  PARAMETERS:
    p_1 RADIOBUTTON GROUP g_1,
    p_2 RADIOBUTTON GROUP g_1,
    p_0 RADIOBUTTON GROUP g_1 DEFAULT 'X'.
SELECTION-SCREEN END OF BLOCK Block3.

*******************************
* Block 4  ??
*******************************
SELECTION-SCREEN BEGIN OF BLOCK Block4 WITH FRAME TITLE TEXT-004.
  PARAMETERS: p_name   TYPE string lower case,
              p_agnum  TYPE n LENGTH 8,
              p_street TYPE String lower case,
              p_pbox   TYPE String lower case,
              p_pcode  TYPE String lower case,
              p_land   TYPE c LENGTH 3,
              p_city   TYPE String lower case,
              p_region TYPE String lower case,
              p_tele   TYPE String lower case,
              p_url    TYPE String lower case,
              p_langu  TYPE lang lower case,
              p_curr   TYPE c LENGTH 5.
SELECTION-SCREEN END OF BLOCK Block4.

*SELECT
*  FROM stravelag
*FIELDS *
*  WHERE name = @p_rname
*INTO TABLE @DATA(lt_rnames).

DATA lv_Rgefunden TYPE boolean.

SELECT SINGLE
  FROM stravelag
  FIELDS *
  WHERE name = @p_rname
  INTO  @DATA(ls_stravelag).

**********************************************************************
* Liest die interne Tabelle in die lokale Struktur an der ersten Zeile aus
**********************************************************************
*READ TABLE lt_stravelag2 INTO ls_stravelag INDEX 1.

IF sy-subrc = 0.
  WRITE: 'Folgender Kunde wurde gefunden:', ls_stravelag-name.
  lv_Rgefunden = abap_true.
ELSE.
  WRITE 'Reisebüro nicht gefunden. Bitte Reisebüro anlegen!'.
  lv_Rgefunden = abap_false.
ENDIF.

*  cl_demo_output=>display( ls_stravelag ).

*******************************
* nur Anzeige wenn gefunden
*******************************
IF p_0 = abap_true AND lv_Rgefunden = abap_true.
  cl_demo_output=>display( ls_stravelag ).
ENDIF.

*******************************
* bestehenden Eintrag ändern
*******************************
IF p_1 = abap_true AND lv_Rgefunden = abap_true.

  ls_stravelag-name = p_rname.

  IF p_name IS NOT INITIAL.
    ls_stravelag-name = p_name.
  ENDIF.

  IF p_agnum IS NOT INITIAL.
    ls_stravelag-agencynum = p_agnum.
  ENDIF.

  IF p_street IS NOT INITIAL.
    ls_stravelag-street = p_street.
  ENDIF.

  IF p_pbox IS NOT INITIAL.
    ls_stravelag-postbox = p_pbox.
  ENDIF.

  IF p_pcode IS NOT INITIAL.
    ls_stravelag-postcode = p_pcode.
  ENDIF.

  IF p_land IS NOT INITIAL.
    ls_stravelag-country = p_land.
  ENDIF.

  IF p_city IS NOT INITIAL.
    ls_stravelag-city = p_city.
  ENDIF.

  IF p_region IS NOT INITIAL.
    ls_stravelag-region = p_region.
  ENDIF.

  IF p_tele IS NOT INITIAL.
    ls_stravelag-telephone = p_tele.
  ENDIF.

  IF p_url IS NOT INITIAL.
    ls_stravelag-url = p_url.
  ENDIF.

  IF p_langu IS NOT INITIAL.
    ls_stravelag-langu = p_langu.
  ENDIF.

  IF p_curr IS NOT INITIAL.
    ls_stravelag-currency = p_curr.
  ENDIF.

  UPDATE stravelag FROM ls_stravelag.
  IF Sy-Subrc = 0..
    MESSAGE 'Daten wurden geändert.' TYPE 'I'.
  ELSE.
    WRITE 'Fehler'.
  ENDIF.

ENDIF.

*******************************
* Neuen Eintrag anlegen
*******************************
IF p_2 = abap_true AND lv_Rgefunden = abap_false.
  WRITE: /, 'zweites if'.
  ls_stravelag-name = p_name.
  ls_stravelag-agencynum = p_agnum.
  ls_stravelag-street = p_street.
  ls_stravelag-postbox = p_pbox.
  ls_stravelag-postcode = p_pcode.
  ls_stravelag-country = p_land.
  ls_stravelag-city = p_city.
  ls_stravelag-region = p_region.
  ls_stravelag-telephone = p_tele.
  ls_stravelag-url = p_url.
  ls_stravelag-langu = p_langu.
  ls_stravelag-currency = p_curr.

  INSERT stravelag FROM ls_stravelag.
  IF Sy-Subrc = 0..
    MESSAGE 'Daten wurden neu angelegt' TYPE 'I'.
  ELSE.
    WRITE 'Fehler'.
  ENDIF.


ENDIF.
