*&---------------------------------------------------------------------*
*& Report zob_mb_sql_extra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_sql_extra.

*Geben Sie die Anzahl der gebuchten Flüge eines Kunden aus. Tabelle SBOOK.


select
from spfli
fields
carrid,
connid,
countryfr,
countryto

where countryfr = 'US' and countryto = 'US'

into table @data(lt_USA).

cl_demo_output=>display( lt_USA ).
