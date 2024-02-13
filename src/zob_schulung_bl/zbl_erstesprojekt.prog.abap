*&---------------------------------------------------------------------*
*& Report zbl_erstesprojekt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_erstesprojekt.

TABLES sflight.

SELECTION-SCREEN BEGIN OF BLOCK Verbrauch WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_carrid TYPE sflight-carrid OBLIGATORY,
              p_flug   TYPE sflight-connid OBLIGATORY,
              p_datum  TYPE sflight-fldate OBLIGATORY.
SELECTION-SCREEN END OF BLOCK Verbrauch.


DATA(lo_zprojekt_klasse) = NEW zprojekt_klasse( iv_datum = p_datum iv_carrid = p_carrid iv_flug = p_flug ).
lo_zprojekt_klasse->ergebnis(  ).


AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_datum.

  DATA: lt_return TYPE TABLE OF ddshretval,
        ls_return TYPE ddshretval.
  DATA: lt_return2 TYPE STANDARD TABLE OF dynpread.

  lt_return2 = VALUE #( ( fieldname = 'P_FLUG' ) ( fieldname = 'P_CARRID' ) ).

  CALL FUNCTION 'DYNP_VALUES_READ'
    EXPORTING
      dyname     = sy-cprog
      dynumb     = sy-dynnr
    TABLES
      dynpfields = lt_return2.


  DATA: lv_carrid TYPE sflight-carrid,
        lv_flug   TYPE sflight-connid.

  lv_carrid = lt_return2[ fieldname = 'P_CARRID' ]-fieldvalue.
  lv_flug = lt_return2[ fieldname = 'P_FLUG' ]-fieldvalue.

  IF lv_carrid IS INITIAL AND lv_flug IS INITIAL.
    SELECT fldate FROM sflight INTO TABLE @DATA(lt_sflight).
  ELSEIF lv_flug IS INITIAL.
    SELECT fldate FROM sflight WHERE carrid = @lv_carrid INTO TABLE @lt_sflight.
  ELSEIF lv_carrid IS INITIAL.
    SELECT fldate FROM sflight WHERE connid = @lv_flug INTO TABLE @lt_sflight.
  ELSE.
    SELECT fldate FROM sflight WHERE carrid = @lv_carrid AND connid = @lv_flug INTO TABLE @lt_sflight.
  ENDIF.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
      retfield        = 'FLDATE'
      value_org       = 'S'
    TABLES
      value_tab       = lt_sflight
      return_tab      = lt_return
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  READ TABLE lt_return INTO ls_return INDEX 1.
  p_datum = ls_return-fieldval.
