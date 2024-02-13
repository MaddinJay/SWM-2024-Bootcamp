CLASS zem_class_wiederholung DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

  Class-Methods: Abruf importing iv_eingabe type string.

  Class-methods: kosten importing iv_land type c.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEM_CLASS_WIEDERHOLUNG IMPLEMENTATION.


  METHOD abruf.
*
*Data: Begin of ls_struktur,
*       country type S_COUNTRY,
*       city type s_city,
*       street type s_street,
*       Kosten type i,
*       End of ls_struktur.
*
*Data: lt_tabelle like table of ls_struktur.
*
*ls_struktur-kosten = '20'.
*Append ls_struktur to lt_tabelle.


Select
From scustom
fields *
Where COUNTRY = @iv_eingabe
order by CITY, country, STREET
into table @Data(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).

Loop at lt_tabelle into Data(ls_struktur).
Write: ls_struktur-country, ls_struktur-city, ls_struktur-street.
Endloop.

  ENDMETHOD.


  METHOD kosten.

  IF iv_land IS INITIAL.

  SELECT
  FROM sbook
  LEFT JOIN scustom ON sbook~customid = scustom~id
  FIELDS
  sbook~customid,
  scustom~id,
  scustom~name,
  sbook~loccuram,
  sbook~connid,
  scustom~country
*Order by scustom~id DESCENDING
  INTO TABLE @DATA(lt_2tabelle)
  UP TO 10 ROWS.

ELSE.

SELECT
  FROM sbook
  LEFT JOIN scustom ON sbook~customid = scustom~id
  FIELDS
  sbook~customid,
  scustom~id,
  scustom~name,
  sbook~loccuram,
  sbook~connid,
  scustom~country
  WHERE country = @iv_land
*Order by scustom~id DESCENDING
  INTO TABLE @lt_2tabelle
  UP TO 10 ROWS.

ENDIF.

*Cl_demo_output=>display( lt_2Tabelle ).


LOOP AT lt_2tabelle INTO DATA(ls_2struktur).
  WRITE: '|', 'KundenId:', ls_2struktur-id, 'Name:', ls_2struktur-name, '|', 'Flugnummer:', ls_2struktur-connid, 'Kosten:', ls_2struktur-loccuram, 'Euro', '|'.
  ULINE.
ENDLOOP.

  ENDMETHOD.
ENDCLASS.
