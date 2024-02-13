CLASS zmb_lcl_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS hinzufuegen "Import der Parameter für Auto
      IMPORTING
        !iv_marke  TYPE string
        !iv_modell TYPE string
        !iv_jahr   TYPE n
        !iv_km     TYPE n.
    CLASS-METHODS hinzufuegen_o "Import der Parameter Owner
      IMPORTING
        !iv_owner         TYPE string
        !iv_adres         TYPE char35
        !iv_model         TYPE string
        !iv_fahrgestellnr TYPE string
        !iv_KMSEITSERVICE TYPE n.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmb_lcl_car IMPLEMENTATION.


  METHOD hinzufuegen.
    INSERT INTO  zobmb_t_car_003 VALUES @( VALUE
                                     #( brand = iv_marke
                                       model = iv_modell
                                       jahr = iv_jahr
                                       kmbisservice = iv_km ) ).

  ENDMETHOD.


  METHOD hinzufuegen_o.

    INSERT INTO zobmb_t_owner003 VALUES @( VALUE
                                         #( owner_name = iv_owner
                                           owner_address = iv_adres
                                           model = iv_model
                                           fahrgestellnr = iv_fahrgestellnr
                                           kmseitservice = iv_KMSEITSERVICE ) ).


  ENDMETHOD.
ENDCLASS.
