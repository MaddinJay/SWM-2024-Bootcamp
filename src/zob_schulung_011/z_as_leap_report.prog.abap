*&---------------------------------------------------------------------*
*& Report z_as_leap_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_leap_report.

PARAMETERS p_jahr TYPE i.

START-OF-SELECTION.
  DATA(go_jahr) = NEW z_as_leap( ).

  DATA(go_result) = go_jahr->leap( EXPORTING year = p_jahr  ).

  IF go_result = abap_true.
    WRITE |Das Jahr { p_jahr } ist ein Schaltjahr!|.
    else.
    WRITE |Das Jahr { p_jahr } ist kein Schaltjahr!|.
  ENDIF.

END-OF-SELECTION.
