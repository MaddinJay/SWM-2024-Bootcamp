CLASS ltcl_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
    for1return FOR TESTING RAISING cx_static_check.

    methods:
    for2return for testing raising cx_static_check.

    Methods:
    for3return for testing raising cx_static_check.

    Methods:
    for15return for testing raising cx_static_check.

    Methods:
    for6return for testing raising cx_static_check.

    Methods:
    for10return for testing raising cx_static_check.

    Methods:
    for30return for testing raising cx_static_check.

    Methods:
    for1_to_1 for testing raising cx_static_check.

ENDCLASS.


CLASS ltcl_fizzbuzz IMPLEMENTATION.

  METHOD for1return.
    DATA cut TYPE REF TO zem_class_fizzbuzz.

    cut = NEW #(  ).

    DATA(result) = cut->fizzbuzz( 1 ).

    cl_abap_unit_assert=>assert_equals( msg = 'für 1 wird 1 ausgegeben' exp = '1' act = result ).


  ENDMETHOD.

  Method for2return.

  Data cut type ref to zem_class_fizzbuzz.

  cut = new #(  ).

  Data(result) = cut->fizzbuzz( 2 ).

  cl_abap_unit_assert=>assert_equals( msg = 'für 2 wird 2 ausgegeben' exp = '2' act = result ).


endmethod.


  METHOD for3return.

  Data cut type ref to zem_class_fizzbuzz.

  cut = new #(  ).

  Data(result) = cut->fizzbuzz( 3 ).

  cl_abap_unit_assert=>assert_equals( msg = 'für 3 wird FIZZ ausgegeben' exp = 'FIZZ' act = result ).

  ENDMETHOD.

  METHOD for15return.

  DAta cut type ref to zem_class_fizzbuzz.

  cut = new #(  ).

  Data(result) = cut->fizzbuzz( 15 ).

  cl_abap_unit_assert=>assert_equals( msg = 'für 15 wird FIZZBUZZ ausgegeben' exp = 'FIZZBUZZ' act = result ).

  ENDMETHOD.



  METHOD for6return.

  Data cut type ref to zem_class_fizzbuzz.

  cut = new #(  ).

  Data(result) = cut->fizzbuzz( 6 ).

  cl_abap_unit_assert=>assert_equals( msg = 'für 6 wird 6 ausgegeben' exp = 'FIZZ' act = result ).

  ENDMETHOD.

  METHOD for10return.

  Data cut type ref to zem_class_fizzbuzz.

  Cut = new #(  ).

  Data(result) = cut->fizzbuzz( 10 ).

  cl_abap_unit_assert=>assert_equals( msg = 'FÜR 10 wird 10 ausgegeben' exp = 'BUZZ' act = result ).


  ENDMETHOD.

  METHOD for30return.

  Data cut type ref to zem_class_fizzbuzz.

  Cut = new #(  ).

  Data(result) = cut->fizzbuzz( 30 ).

  cl_abap_unit_assert=>assert_equals( msg = 'FÜR 10 wird 10 ausgegeben' exp = 'FIZZBUZZ' act = result ).

  ENDMETHOD.

  METHOD for1_to_1.

  Data mo_cut type ref to zem_class_fizzbuzz.

  mo_cut = New #( ).

  Data(lt_result) = mo_cut->convert( 1 ).


    cl_abap_unit_assert=>assert_equals( exp = VALUE zcl_bv_fizzbuzz=>tt_list( ( number = 1 converted_number = '1' ) )
                                        act = lt_result ).


  ENDMETHOD.

ENDCLASS.















*
