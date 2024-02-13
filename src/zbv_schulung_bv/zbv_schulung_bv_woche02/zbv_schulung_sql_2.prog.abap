*&---------------------------------------------------------------------*
*& Report zbv_schulung_sql_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbv_schulung_sql_2.

**********************************************************************
**INSERT, UPDATE, DELETE
**********************************************************************
"Beispiel INSERT
"Option 1
INSERT INTO scarr VALUES @( VALUE
        #(
           carrid = 'XX'
           carrname = 'X Flights'
           currcode = 'EUR') ).
IF sy-subrc = 0.
  WRITE 'Insert Option 1 - Alles hat funktioniert!'.
ELSE.
  WRITE 'Insert Option 1 - Das hat nicht geklappt.'.
ENDIF.
