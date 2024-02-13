*&---------------------------------------------------------------------*
*& Report zbl_leapy
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbl_leapy.

PARAMETERS p_year type i.

data lv_result TYPE abap_bool.
data lo_leapi type REF TO  zblcl_leapclass.

lo_leapi = New #(  ).
lo_leapi->leap( exporting year = p_year
                ).

if lv_result = abap_true.
  write: |Das Jahr { p_year } ist ein Schaltjahr.|.
else.
  write: |Das Jahr { p_year } ist kein Schaltjahr.|.

endif.
