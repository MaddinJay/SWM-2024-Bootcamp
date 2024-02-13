*&---------------------------------------------------------------------*
*& Report zfd_wiederholung_praxis
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_wiederholung_praxis.

DATA ls_scustom TYPE scustom.

PARAMETERS p_land TYPE string.

START-OF-SELECTION.

*  IF p_land <> ''.
*    SELECT
*      FROM scustom
*      FIELDS *
*      WHERE country = @p_land
*      ORDER BY country ASCENDING,
*      city ASCENDING,
*      street ASCENDING
*        INTO TABLE @DATA(lt_tabelle).
*
*    cl_demo_output=>display( lt_tabelle ).
*    LOOP AT lt_tabelle INTO ls_scustom.
*      WRITE: / ls_scustom-name, ls_scustom-country, ls_scustom-city, ls_scustom-street.
*      CLEAR ls_scustom.
*    ENDLOOP.
*
*  ELSE.
*    SELECT
*  FROM scustom
*  FIELDS *
*  ORDER BY country ASCENDING,
*  city ASCENDING,
*  street ASCENDING
*    INTO TABLE @DATA(lt_tabelle1).
*
*    cl_demo_output=>display( lt_tabelle1 ).
*
*    LOOP AT lt_tabelle1 INTO ls_scustom.
*      WRITE: / ls_scustom-name, ls_scustom-country, ls_scustom-city, ls_scustom-street.
*      CLEAR ls_scustom.
*    ENDLOOP.
*
*  ENDIF.

Data gr_custo type ref to zfd_cl_wdh_praxis.
CREATE OBJECT gr_custo EXPORTING iv_land = p_land.
