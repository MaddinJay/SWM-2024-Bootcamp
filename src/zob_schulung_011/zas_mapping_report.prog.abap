*&---------------------------------------------------------------------*
*& Report zas_mapping_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_mapping_report.

START-OF-SELECTION.

  PARAMETERS p_gender TYPE int1.
  PARAMETERS p_langu TYPE char1.

  DATA gv_mapping TYPE REF TO zas_mapping.

  gv_mapping = NEW #( ).

  DATA(gv_gender) = gv_mapping->map_gender( p_gender ). "Wenn man nur einen Importparameter hat, muss man das hier nicht mehr angeben
  DATA(gv_langu) = gv_mapping->map_language( p_langu ).

  WRITE: 'Das Geschlecht ist: ', gv_gender.
  WRITE: / 'Die Sprache ist: ', gv_langu.

END-OF-SELECTION.
