CLASS ztl_cl_car DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS eintrag
      IMPORTING
        iv_brand   TYPE zobtl_t_car_tl-brand
        iv_model   TYPE zobtl_t_car_tl-model
        iv_jahr    TYPE zobtl_t_car_tl-jahr
        iv_service TYPE zobtl_t_car_tl-service

      EXPORTING
        ev_eintrag TYPE string .     "statische Methode erzeugt + unten implementiert
    CLASS-METHODS owner

      IMPORTING
        iv_name      TYPE zobtl_t_owner_tl-owner_name
        iv_adress    TYPE zobtl_t_owner_tl-owner_adress
        iv_brand     TYPE zobtl_t_car_tl-brand
        iv_model     TYPE zobtl_t_car_tl-model
        iv_jahr      TYPE zobtl_t_car_tl-jahr
*        iv_leservice TYPE zobtl_t_owner_tl-leservice
        iv_fin       TYPE zobtl_t_owner_tl-fin

      EXPORTING
        ev_owner     TYPE string .

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ztl_cl_car IMPLEMENTATION.


  METHOD eintrag.

    "Datendeklaration inkl. Eintrag in die Struktur
    DATA(ls_car) = VALUE zobtl_t_car_tl(

    brand = iv_brand
    model = iv_model
    jahr =  iv_jahr
    service = iv_service

    ).

    INSERT zobtl_t_car_tl FROM ls_car.

    ev_eintrag = ls_car.


  ENDMETHOD.


  METHOD owner.

    "Datendeklaration inkl. Eintrag in die Struktur
    DATA(ls_owner) = VALUE zobtl_t_owner_tl(

          owner_name = iv_name
          owner_adress = iv_adress
          brand = iv_brand
          model = iv_model
          jahr =  iv_jahr
          leservice = 0
          fin = iv_fin

          ).

    INSERT zobtl_t_owner_tl FROM ls_owner.

    ev_owner = ls_owner.

  ENDMETHOD.
ENDCLASS.
