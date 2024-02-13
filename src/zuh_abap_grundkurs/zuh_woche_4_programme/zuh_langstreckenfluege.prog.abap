*&---------------------------------------------------------------------*
*& Report zuh_langstreckenfluege
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_langstreckenfluege.
*Aufgabenstellung
*Finden Sie alle Flüge bei denen die Entfernung über 5000 liegt.
*Tabelle: SPFLI

select from spfli
fields *
where distance > 5000
into table @DATA(lt_flug).

cl_demo_output=>display( lt_flug ).
