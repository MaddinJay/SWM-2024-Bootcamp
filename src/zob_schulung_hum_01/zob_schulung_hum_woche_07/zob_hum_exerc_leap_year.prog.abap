*&---------------------------------------------------------------------*
*& Report zob_hum_exerc_leap_year
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_hum_exerc_leap_year.

PARAMETERS p_jahr Type i.
DATA result TYPE abap_bool.


DATA(lo_jahr) = NEW zcl_hum_exerc_leap_year( ).    " lokales Objekt erzeugt und die Klasse instanziiert

result = lo_jahr->leap( EXPORTING year = p_jahr ). " Methode aufrufen


IF result = 'X'. " apap true würde hier auch gehen
  WRITE |Das Jahr { p_jahr } ist ein Schaltjahr!|.
ELSE.
  WRITE |Das Jahr { p_jahr } ist kein Schaltjahr!|.
ENDIF.
