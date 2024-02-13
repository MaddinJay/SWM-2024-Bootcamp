*&---------------------------------------------------------------------*
*& Report zem_class_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_class_uebung.

*Type-pools icon. "ICON_GREEN_LIGHT.


CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.

 Data iv_name type string.
 Data iv_planetype type saplane-planetype.


*    METHODS:
*      set_aritplane_name IMPORTING iv_name      TYPE string,
*      set_plantype       IMPORTING iv_planetype TYPE saplane-planetype.


   Methods: constructor importing   iv_name Type string
                                    iv_model type i.


    class-Methods DISPLAY_N_O_AIRPLANES.

   Methods display_attributes.



   Methods get_n_o_airplanes
   RETURNing VALUE(rv_count) type i.



  PRIVATE SECTION.

    DATA: mv_name      TYPE string,
          mv_planetype TYPE saplane-planetype.


    CLASS-DATA: gv_n_o_airplanes TYPE i.

ENDCLASS.


CLASS lcl_airplane IMPLEMENTATION.



  METHOD display_attributes.

  Write: icon_green_light,
 'Planetype:', mv_name, '|', 'Name:', mv_planetype. Uline.

  ENDMETHOD.


Method DISPLAY_N_O_AIRPLANES.

Write: 'Nr.:', gv_n_o_airplanes.

Endmethod.



  METHOD constructor.

  mv_name = iv_name.
  mv_planetype = iv_model.

  Add 1 to gv_n_o_airplanes.


  ENDMETHOD.

  METHOD get_n_o_airplanes.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

DATA go_airplane TYPE REF TO lcl_airplane.
Data lt_tabelle type table of ref to lcl_airplane.

Create Object go_airplane
Exporting iv_name = 'Luftpanzer'
          iv_model = '69'.
*Append go_airplane to lt_tabelle.


go_airplane->display_attributes( ).



**DATA ls_v2 TYPE REF TO lcl_airplane.
**DATA ls_v3 TYPE REF TO lcl_airplane.
*Data gv_avg_fuel type i.
*
*Data lv_tabelle type table of ref to lcl_airplane.


*Create OBJECT ls_v1.      "alte Schreibweise
*ls_v1->iv_name = 'LH'.
*ls_v1->iv_planetype = '90-1'.
*Append ls_v1 to lv_tabelle.
*
*cl_demo_output=>display( lv_tabelle ).

*
*lcl_airplane=>DISPLAY_N_O_AIRPLANES(  ).
*ls_v1 = NEW #(  ).
*lcl_airplane=>DISPLAY_N_O_AIRPLANES(  ).
*
*
**
*
**
*ls_v1->display_attributes(  ).
*
*gv_avg_fuel = ls_v1->get_n_o_airplanes(  ).
*
*Write gv_avg_fuel.


*Loop at lv_tabelle into ls_v1.
*
*Endloop.




*ls_v1 = NEW #(  ).         "neue Schreibweise .. nur für Data nicht Class-Data
*ls_v1->iv_name = 'LH'.
*ls_v1->iv_planetype = 'blum'.
*Append ls_v1 to lv_tabelle.

*c_demo_output=>display( lv_tabelle ).
