*&---------------------------------------------------------------------*
*& Report zob_mb_exercism_leapyears
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_exercism_leapyears.

DATA result TYPE abap_bool.




PARAMETERS p_jahr TYPE i.

DATA(lo_jahr) = NEW zcl_mb_leapyears( ).    " lokales Objekt erzeugt und die Klasse instanziiert

result = lo_jahr->leap( EXPORTING year = p_jahr ). " Methode aufrufen


IF result = 'X'. " apap true würde hier auch gehen
  WRITE |Das Jahr { p_jahr } ist ein Schaltjahr!|.
ELSE.
  WRITE |Das Jahr { p_jahr } ist kein Schaltjahr!|.
ENDIF.
