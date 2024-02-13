CLASS zcl_hum_exercism_itab_basics DEFINITION
 PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
      RETURNING
        VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
      IMPORTING initial_data        TYPE itab_data_type
      RETURNING
                VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
      IMPORTING initial_data        TYPE itab_data_type
      RETURNING
                VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
      IMPORTING initial_data        TYPE itab_data_type
      RETURNING
                VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hum_exercism_itab_basics IMPLEMENTATION.
  METHOD fill_itab.  "Initialbefüllung, Tabelle = Value#
   initial_DATA = VALUE #( ( group = 'A' number = 10  description = 'Group A-2' )
    ( group = 'B' number = 5   description = 'Group B' )
    ( group = 'A' number = 6   description = 'Group A-1' )
    ( group = 'C' number = 22  description = 'Group C-1' )
    ( group = 'A' number = 13  description = 'Group A-3' )
    ( group = 'C' number = 500 description = 'Group C-2' ) ).

  ENDMETHOD.

  METHOD add_to_itab.   "Append, ansonsten wird die Tabelle gelöscht und es steht nur ein Eintrag drin.
    updated_data = initial_data.
   Append  Value #( group = 'A' number = 19 description = 'Group A-4' ) to updated_data.

  ENDMETHOD.

  METHOD sort_itab.
    updated_data = initial_data.
    sort updated_data by group ASCENDING number DESCENDING.

  ENDMETHOD.

  METHOD search_itab. " einen bestimmten Eintrag suchen
    DATA(temp_data) = initial_data.
    result_index = line_index( temp_data[ number = 6 ] ).
  ENDMETHOD.

ENDCLASS.

