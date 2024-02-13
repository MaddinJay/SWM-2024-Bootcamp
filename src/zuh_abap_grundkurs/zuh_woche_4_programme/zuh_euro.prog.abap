*&---------------------------------------------------------------------*
*& Report zuh_euro
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_euro.

*Aufgabenstellung
*Geben Sie alle Fluggesellschaften aus, dessen Währung 'EUR ist.
*Tabelle: SCARR

select from scarr fields * where currcode LIKE 'EUR' into table @DATA(lt_Kunden).

cl_demo_output=>display( lt_kunden ).
