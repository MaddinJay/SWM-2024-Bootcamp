*&---------------------------------------------------------------------*
*& Report zuh_order_by
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_order_by.

*Geben Sie alle Buchungen aus, sortieren Sie diese nach der Zeitzone.
*Tabelle: sairport

select from sairport
 fields * order by time_zone into table @DATA(lt_Kunden).

cl_demo_output=>display( lt_kunden ).
