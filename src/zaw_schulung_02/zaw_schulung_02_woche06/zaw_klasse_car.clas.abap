CLASS zaw_klasse_car DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS: car IMPORTING iv_brand TYPE zaw_de_carbrand
                                 iv_model TYPE zaw_de_carmodel
                                 iv_jahr  TYPE zaw_de_year_prod
                                 iv_next  TYPE zaw_persid.

    CLASS-METHODS: owner IMPORTING iv_fname   TYPE zaw_de_owner_name
                                   iv_sname   TYPE zaw_de_owner_name
                                   iv_address TYPE zaw_de_owner_address
                                   iv_brand   TYPE zaw_de_carbrand
                                   iv_model   TYPE zaw_de_carmodel
                                   iv_last    TYPE zaw_persid
                                   iv_ident   TYPE zaw_gk_personalnummer.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zaw_klasse_car IMPLEMENTATION.


  METHOD car.

    DATA ls_new TYPE zaw_t_car.

    INSERT INTO zaw_t_car VALUES @( VALUE #(
                        model = iv_model
                        brand = iv_brand
                        prodyear = iv_jahr
                        nextcheck = iv_next
                        ) ).

    IF sy-subrc = 0.

      WRITE: / 'Eintrag in DB CAR ist erfolgt.'.

    ELSE.

      WRITE: / 'Eintrag in DB CAR ist nicht möglich!'.

    ENDIF.


  ENDMETHOD.

  METHOD owner.

    DATA ls_new2 TYPE zaw_t_owner.

    INSERT INTO zaw_t_owner VALUES @( VALUE #(
                        owner_name = iv_sname
                        owner_firstname = iv_fname
                        owner_address = iv_address
                        brand = iv_brand
                        model = iv_model
                        lastcheck = iv_last
                        ident = iv_ident
                         ) ).


    IF sy-subrc = 0.

      WRITE: 'Eintrag in DB OWNER ist erfolgt.'.

    ELSE.
      WRITE: 'Eintrag in DB OWNER ist nicht möglich!'.

    ENDIF.

  ENDMETHOD.


ENDCLASS.
