*&---------------------------------------------------------------------*
*& Report zfd_cds_view_anlegen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_cds_view_anlegen.

parameters: p_rcurr type s_currcode DEFAULT 'EUR',
            p_text(10) type c default 'Hallo'.

select from zfd_cds_carrier( p_curr = @p_rcurr, p_text = @p_text ) " innerhalb einer DB Abfrage müssen Variablen mit @ gekennzeichnet werden.
Fields
  carrid,
  connid,
  carrname,
  currcode,
  cityfrom,
  cityto,
  textfield

 into table @DATA(lt_fluege).

 cl_demo_output=>display( lt_fluege ).
