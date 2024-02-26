*&---------------------------------------------------------------------*
*& Report z_selection_sto2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_selection_sto2.

Selection-Screen BEGIN OF BLOCK Stoerung WITH FRAME TITLE Text-001.
PARAMETERS: p_kdnr   TYPE zkdnr OBLIGATORY,
            p_sgrund TYPE zkommentar OBLIGATORY,
            p_kommi  TYPE zkommentar,
            p_datum  TYPE frmdatum DEFAULT sy-datum OBLIGATORY.
SELECTION-Screen END OF BLOCK stoerung.


Selection-Screen BEGIN OF BLOCK Techniker WITH FRAME TITLE Text-002.
TYPES: BEGIN OF ls_tech,
         nachname TYPE znachname,
         skill    TYPE ztechnskill,
       END OF ls_tech.
SELECTION-Screen END OF BLOCK Techniker.


DATA: it_tech    TYPE STANDARD TABLE OF ls_tech,
      ls_technik TYPE ls_tech.

DATA: g_id      TYPE vrm_id,
      it_values TYPE vrm_values,
      wa_values LIKE LINE OF it_values.


SELECTION-SCREEN begin of block rahmen2 with frame title text-002.
PARAMETERS: p_tech as CHECKBOX USER-COMMAND ddd.


PARAMETERS p_tech_z type znachname AS LISTBOX VISIBLE LENGTH 20 MODIF ID sc2.
Selection-screen end of block rahmen2.

SELECTION-SCREEN begin of block rahmen3 with frame title text-003.
PARAMETERS: p_radio1 RADIOBUTTON GROUP app,
            p_radio2  RADIOBUTTON GROUP app,
            p_radio3 RADIOBUTTON GROUP app.
Selection-screen end of block rahmen3.

*** Radiobutton 1 -> Störungen anzeigen
*** Radiobutton 2 -> Störung abschließen
*** Radiobutton 3 -> Status Kunde informiert setzen

AT SELECTION-SCREEN OUTPUT.
  IF p_tech EQ abap_true.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC2'.
        screen-active = 1.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ELSE.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC2'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.

SELECT
  FROM zdb_technik24
  FIELDS
  nachname
  WHERE v_status = 'X'
  INTO TABLE @it_tech.

  LOOP AT it_tech INTO ls_technik.
    wa_values-key = ls_technik-nachname.
    wa_values-text = ls_technik-nachname.
    APPEND wa_values TO it_values.
    CLEAR wa_values.
  ENDLOOP.

  g_id = 'P_TECH_Z'.
  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING
      id              = g_id
      values          = it_values.
*    EXCEPTIONS
*      id_illegal_name = 1
*      OTHERS          = 2.

  DATA: declaration_string TYPE znachname.

  declaration_string = p_tech_z.
  WRITE: declaration_string.


  DATA(lo_sto_erfassen) = NEW zmaf_class_sb(  ).

  lo_sto_erfassen->sto_erfassen( ip_kdnr = p_kdnr ip_sgrund = p_sgrund ip_kommi = p_kommi ip_datum = p_datum ).

  z_class_sb=>sto_abrufen( ip_kdnr = p_kdnr ).

  lo_sto_erfassen->tech_zuweisen( ip_tech = declaration_string ).
