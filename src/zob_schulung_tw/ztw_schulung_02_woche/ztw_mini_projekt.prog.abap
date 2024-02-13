*&---------------------------------------------------------------------*
*& Report ztw_mini_projekt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztw_mini_projekt.

DATA: p_name TYPE c LENGTH 25.

p_name = 'Starr'.

SELECT SINGLE *
  FROM scustom
  WHERE name = @p_name
  INTO @DATA(ls_kunde).

IF sy-subrc = 0.
  PARAMETERS: p_id_n TYPE n LENGTH 8 DEFAULT ls_kunde-id,
              p_name_n TYPE c LENGTH 25 LOWER CASE DEFAULT ls_kunde-name,
              p_form_n TYPE c LENGTH 15 LOWER CASE DEFAULT ls_kunde-form,
              p_stre_n TYPE c LENGTH 30 LOWER CASE DEFAULT ls_kunde-street,
              p_code_n TYPE c LENGTH 10 DEFAULT ls_kunde-postcode,
              p_city_n TYPE c LENGTH 25 LOWER CASE DEFAULT ls_kunde-city,
              p_tel_n TYPE c LENGTH 30 DEFAULT ls_kunde-telephone.

  ls_kunde-id = p_id_n.
  ls_kunde-name = p_name_n.
  ls_kunde-form = p_form_n.
  ls_kunde-street = p_stre_n.
  ls_kunde-postcode = p_code_n.
  ls_kunde-city = p_city_n.
  ls_kunde-telephone = p_tel_n.
ELSE.
  MESSAGE 'No customer with name Starr found.' TYPE 'E'.
ENDIF.

START-OF-SELECTION.

  " Selektiere den Kundendatensatz mit dem Namen 'Starr'
  SELECT SINGLE *
    FROM scustom
    INTO ls_kunde
    WHERE name = 'Starr'.

  IF sy-subrc = 0.
    " Wenn der Datensatz erfolgreich ausgewählt wurde, zeige die Parameter an
    CALL SCREEN 100.
  ELSE.
    WRITE: 'Keine Daten für den Namen Starr gefunden.'.
  ENDIF.
**********************************************************************
**********************************************************************
**********************************************************************
