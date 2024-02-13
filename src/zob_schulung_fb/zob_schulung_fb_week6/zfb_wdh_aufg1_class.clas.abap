CLASS zfb_wdh_aufg1_class DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

  Class-Methods: Abruf importing iv_eingabe type string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zfb_wdh_aufg1_class IMPLEMENTATION.

  METHOD abruf.

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

ENDCLASS.
