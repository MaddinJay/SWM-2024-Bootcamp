*&---------------------------------------------------------------------*
*& Report z_ob_gruppenarbeit_soe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_ob_gruppenarbeit_soe.

TABLES scounter.

SELECTION-SCREEN BEGIN OF SCREEN 100.

  PARAMETERS: p_suche  TYPE scounter-carrid  OBLIGATORY,
              p_suche2 TYPE scounter-airport OBLIGATORY.



SELECTION-SCREEN END OF SCREEN 100.

SELECTION-SCREEN BEGIN OF SCREEN 200.
  PARAMETERS: p_no RADIOBUTTON GROUP r_g1,
              p_ja RADIOBUTTON GROUP r_g1.
SELECTION-SCREEN END OF SCREEN 200.

SELECTION-SCREEN BEGIN OF SCREEN 300.
  PARAMETERS: p_flugg  TYPE string OBLIGATORY,
              p_flugha TYPE string OBLIGATORY.
SELECTION-SCREEN END OF SCREEN 300.

DATA: BEGIN OF ls_tabelle,
        carrid  LIKE scounter-carrid,
        airport LIKE scounter-airport,
      END OF ls_tabelle.

START-OF-SELECTION.
  CALL SELECTION-SCREEN 100.



  SELECT
    FROM
      scounter
    FIELDS
      carrid,
      airport
        WHERE carrid = @p_suche AND airport = @p_suche2
    INTO @ls_tabelle.
  ENDSELECT.

  IF sy-subrc = 0.
    WRITE ls_tabelle.
  ELSE.
    CALL SELECTION-SCREEN 200.

    IF p_no = 'X'.
      WRITE 'Danke'.
      EXIT.
    ELSE.
      CALL SELECTION-SCREEN 300.
      DATA(ls_scounter_insert) = VALUE scounter(
      carrid = p_flugg
      countnum = 00099
      airport = p_flugha
      ).
      INSERT INTO scounter VALUES ls_scounter_insert.
      IF sy-subrc = 0.
        WRITE 'OK'.
      ELSE.
        WRITE 'NICHT OK'.
      ENDIF.
    ENDIF.
  ENDIF.
