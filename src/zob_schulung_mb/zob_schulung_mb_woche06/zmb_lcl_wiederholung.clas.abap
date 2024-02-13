CLASS zmb_lcl_wiederholung DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

  Class-Methods: abruf importing iv_eingabe type scustom-country.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmb_lcl_wiederholung  IMPLEMENTATION.

  METHOD abruf.



*Select
*From scustom
*fields *
*Where COUNTRY = @iv_eingabe
*order by CITY, country, STREET
*into table @Data(lt_tabelle).
*
**cl_demo_output=>display( lt_tabelle ).
*
*Loop at lt_tabelle into Data(ls_struktur).
*Write: ls_struktur-country, ls_struktur-city, ls_struktur-street.
*Endloop.


If iv_eingabe is not initial.
Select
From sbook
left join scustom on sbook~customid = scustom~id
Fields
sbook~customid,
scustom~id,
scustom~name,
sbook~LOCCURAM,
sbook~connid,
scustom~country
where Country = @iv_eingabe
Into table @DAta(lt_2tabelle).
else.

select from sbook
left join scustom on sbook~customid = scustom~id
fields
sbook~customid,
scustom~id,
scustom~name,
sbook~LOCCURAM,
sbook~connid,
scustom~country
into table @lt_2tabelle.
endif.

*cl_demo_output=>display( lt_2Tabelle ).


Loop at lt_2tabelle into Data(ls_2struktur).
Write: '|', 'KundenId:', ls_2struktur-id, 'Name:', ls_2struktur-name, 'Flugnummer:', ls_2struktur-connid, 'Kosten:', ls_2struktur-loccuram, 'Land:', ls_2struktur-country, '|', /.

endloop.

endmethod.
ENDCLASS.


