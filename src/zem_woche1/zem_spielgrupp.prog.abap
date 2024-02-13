*&---------------------------------------------------------------------*
*& Report zem_spielgrupp
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_spielgrupp.


"Tabelle: SBUSPART
*Gebt einem Endanwender die Möglichkeit zu prüfen, ob ein bestimmter Eintrag (s.u.) bereits existiert.
*Sollte der Eintrag nicht existieren, so soll er die Möglichkeit haben, einen neuen Eintrag anzulegen.
*Sollte der Eintrag existieren, so soll die Möglichkeit bestehen, diesen einzusehen und zu editieren.
"_________________________________________________________________________
"Gesamte Tabelle anzeigen lassen
"_________________________________________________________________________
SELECT
FROM
sbuspart
FIELDS *
INTO TABLE @DATA(lt_sbuspart).

SELECTION-SCREEN BEGIN OF BLOCK hole WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_1 AS CHECKBOX.
SELECTION-SCREEN END OF BLOCK hole.
IF p_1 = abap_true.
  cl_demo_output=>display( lt_sbuspart ).
ENDIF.

DATA ls_flygp TYPE sbuspart.

SELECTION-SCREEN BEGIN OF BLOCK suchfeld WITH FRAME TITLE TEXT-002.
  PARAMETERS p_kunde TYPE sbuspart-contact.   "suche nach dem Kundennamen

 SELECTION-SCREEN END OF BLOCK suchfeld.



SELECTION-SCREEN BEGIN OF BLOCK Header WITH FRAME TITLE TEXT-003.
  PARAMETERS  p_anl AS CHECKBOX. "Checkbox zum Anlegen
  PARAMETERS  p_aen AS CHECKBOX. "Checkbox zum Ändern

  PARAMETERS p_gpnum TYPE sbuspart-buspartnum. "Eingabe Kontaktnummer
  PARAMETERS p_gpname TYPE sbuspart-contact.   "Eingabe Kundennamen
  PARAMETERS p_phone TYPE sbuspart-contphono.  "Eingabe Telefonnummer
  PARAMETERS p_bustyp TYPE sbuspart-buspatyp.  "Eingabe Telefonnummer
SELECTION-SCREEN END OF BLOCK Header.

SELECT
FROM
sbuspart
FIELDS *

 WHERE contact = @p_kunde
INTO TABLE @DATA(lt_flygp).

READ TABLE lt_flygp INTO ls_flygp index 1.

IF sy-subrc = 0 AND p_aen <> abap_true.  "Falls der Kunde exisitiert & wir nicht 'Ändern' Checkbox ausgewählt haben--> Details anzeigen
  WRITE: 'Folgender Kunde wurde in der Datenbank gefunden: ', /, ls_flygp.
  ULINE.
ELSEIF sy-subrc = 4. "Falls es den Kunden nicht gibt dann kommt die Meldung
  WRITE 'Der Kunde exisitiert nicht. Bitte legen Sie den Kunden neu an. '.
ENDIF.


*************************************************************************
"Kunden anlegen -> INSERT
IF p_anl = abap_true.

  ls_flygp = VALUE sbuspart(
  buspartnum = p_gpnum
  contact = p_gpname
  contphono = p_phone
  buspatyp = p_bustyp
   ).

  INSERT sbuspart FROM ls_flygp.
  IF sy-subrc = 0 AND p_anl = abap_true.
    DATA(lv_messageanl) = |Daten wurden angelegt|.
    MESSAGE lv_messageanl TYPE 'I'.
  ENDIF.
ELSEIF p_aen = abap_true.
*************************************************************************
  "Vorhandene Kunden ändern --> UPDATE

  ls_flygp = VALUE sbuspart(
  buspartnum = p_gpnum
  contact = p_gpname
  contphono = p_phone
  buspatyp = p_bustyp
  ).
  UPDATE sbuspart FROM ls_flygp.
  DATA(lv_messageaen) = |Daten wurden geändert|.
  MESSAGE lv_messageaen TYPE 'I'.

  Endif.
