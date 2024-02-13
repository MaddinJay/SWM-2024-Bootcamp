CLASS zmb_lcl_carrier DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  Data: Pilot type string,
        Stewardess type string,
        Bodencrew type string,
        Tickets type string,
        Landeerlaubnis type string,
        Strecken type c.

    Methods: planung, buchhaltung, pilotenausbildung, betankung.





  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmb_lcl_carrier IMPLEMENTATION.
  METHOD betankung.

  ENDMETHOD.

  METHOD buchhaltung.

  ENDMETHOD.

  METHOD pilotenausbildung.

  ENDMETHOD.

  METHOD planung.

  ENDMETHOD.

ENDCLASS.
