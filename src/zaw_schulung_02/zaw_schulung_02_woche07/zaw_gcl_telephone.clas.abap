CLASS zaw_gcl_telephone DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zaw_gcl_telephone IMPLEMENTATION.

  METHOD clean.
    result = condense( val  = !number from = '()-.+' to   = '' ).
    CONDENSE result NO-GAPS.

    IF strlen( result ) <= 9.             "strlen: Length of string, variable stands in brackets
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " invalid when 11 digits does not start with a 1
    " invalid if area code starts with 1 on valid 11-digit number
    " invalid if exchange code starts with 0 on valid 11-digit number
    " invalid if exchange code starts with 1 on valid 11-digit number
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    IF strlen( result ) = 11 AND result+0(1) > 1 OR result+1(1) <= 1.  "result+0(1) first place of a strings
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " invalid when more than 11 digits
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    IF strlen( result ) > 11.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " valid when 11 digits and starting with 1
    " valid when 11 digits and starting with 1 even with punctuation
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    IF strlen( result ) = 11 AND result+0(1) = 1.
      SHIFT result LEFT DELETING LEADING '1'.
    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " invalid with letters
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    IF result CN '0123456789'.          "CN: Contains not only
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " invalid if area code starts with 0
    " invalid if exchange code starts with 0
    " invalid if exchange code starts with 1

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    IF strlen( result ) < 11 AND result+0(1) <= 1 OR result+3(1) <= 1 .
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
