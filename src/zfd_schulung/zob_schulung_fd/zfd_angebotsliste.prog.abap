*&---------------------------------------------------------------------*
*& Include zfd_angebotsliste
*&---------------------------------------------------------------------*

CLASS lcl_angebotsliste DEFINITION.

  PUBLIC SECTION.
    METHODS on_truck_available FOR EVENT truck_available OF lcl_truck importing ev_string sender.
    METHODS constructor.

ENDCLASS.




CLASS lcl_angebotsliste IMPLEMENTATION.
  METHOD on_truck_available.
  data lr_truck TYPE REF TO lcl_truck.
    WRITE / '**************************'.
    WRITE / 'Truck ist verfügbar'.
    WRITE / ev_string.
    lr_truck = sender.
    lr_truck->display_attributes(  ).
    WRITE / '**************************'.
  ENDMETHOD.


  METHOD constructor.
    SET HANDLER on_truck_available FOR ALL INSTANCES ACTIVATION 'X'.
  ENDMETHOD.

ENDCLASS.
