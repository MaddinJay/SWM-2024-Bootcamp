CLASS zob_od_cl_itab_basics DEFINITION
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
    DATA mv_data TYPE TABLE OF itab_data_type.
    DATA iv_data TYPE TABLE OF itab_data_type.
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

    METHODS get_itab
      IMPORTING fill_itab   TYPE itab_data_type
      RETURNING VALUE(rv_data) TYPE itab_data_type.

    METHODS search_itab
      IMPORTING initial_data        TYPE itab_data_type
      RETURNING
                VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.
CLASS zob_od_cl_itab_basics IMPLEMENTATION.
  METHOD fill_itab.
    initial_data = VALUE #(
      ( group = 'A' number = 10 description = 'Group A-2' )
      ( group = 'B' number = 5  description = 'Group B' )
      ( group = 'A' number = 6  description = 'Group A-1' )
      ( group = 'C' number = 22 description = 'Group C-1' )
      ( group = 'A' number = 13 description = 'Group A-3' )
      ( group = 'C' number = 500 description = 'Group C-2' )
    ).
  ENDMETHOD.
  METHOD add_to_itab.
    updated_data = initial_data.
    APPEND VALUE #( group = 'A' number = 19 description = 'Group A-4' ) TO updated_data.
  ENDMETHOD.
  METHOD sort_itab.
    updated_data = initial_data.
    SORT updated_data BY group number DESCENDING.
  ENDMETHOD.
  METHOD search_itab.
    DATA(temp_data) = initial_data.
    result_index = line_index( temp_data[ number = 6 ] ).
    WRITE result_index.
  ENDMETHOD.
  METHOD get_itab.
    rv_data = fill_itab( ).
  ENDMETHOD.

ENDCLASS.

