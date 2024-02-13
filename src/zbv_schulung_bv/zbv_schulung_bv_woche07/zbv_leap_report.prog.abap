*&---------------------------------------------------------------------*
*& Report zbv_leap_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_leap_report.

PARAMETERS p_year TYPE i.

DATA go_year TYPE ref to zcl_bv_leap.
DATA result TYPE abap_bool.

go_year = NEW #( ).

result = go_year->leap( year = p_year ).

IF result = 'X'.                                "X weil in der Klasse abap_true und abap_false benutzt wurden, wenn das Ergebnis ein X hat (abap_true) ist es ein Schaltjahr, sonst nicht
WRITE |Das Jahr { p_year } ist ein Schaltjahr|.
ELSE.
WRITE |Das Jahr { p_year } ist kein Schaltjahr|.

ENDIF.
