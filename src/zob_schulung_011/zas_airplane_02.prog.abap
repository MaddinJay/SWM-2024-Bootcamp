*&---------------------------------------------------------------------*
*& Report zas_airplane_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_airplane_02.

PARAMETERS: p_name   TYPE string,
            p_plntyp TYPE saplane-planetype.

DATA(go_airplane) = NEW zas_cl_airplane( ). "Referenzvariable und Instanz der Klasse zugleich!

TYPES: BEGIN OF ls_airplane,
         lv_name         TYPE string,
         lv_planetype    TYPE saplane-planetype,
         lv_n_o_airplane TYPE i,
       END OF ls_airplane.
DATA gs_airplane TYPE ls_airplane.
DATA gt_airplane TYPE TABLE OF ls_airplane.

*DATA gt_airplane2 TYPE TABLE OF REF TO zas_cl_airplane.

DATA lv_name2 TYPE string.
DATA lv_planetype2 TYPE saplane-planetype.
DATA lv_n_o_airplane2 TYPE i.

LOOP AT gt_airplane INTO gs_airplane.
  go_airplane->set_airplane_name( iv_name = p_name ).
  go_airplane->set_planetype( iv_planetype = p_plntyp ).

  go_airplane->display_attributes( IMPORTING  ev_name = lv_name2
                                              ev_planetype = lv_planetype2 ).
  zas_cl_airplane=>display_n_o_airplane( IMPORTING iv_n_o_airplane = lv_n_o_airplane2 ).
  gs_airplane-lv_name = lv_name2.
  gs_airplane-lv_planetype = lv_planetype2.
  gs_airplane-lv_n_o_airplane = lv_n_o_airplane2.
  APPEND gs_airplane TO gt_airplane.
  WRITE: gs_airplane-lv_name, gs_airplane-lv_planetype, gs_airplane-lv_n_o_airplane.
  cl_demo_output=>display( gt_airplane ).
ENDLOOP.


*LOOP AT gt_airplane INTO gs_airplane.
*go_airplane->set_airplane_name( iv_name = p_name ).
*go_airplane->set_planetype( iv_planetype = p_plntyp ).
*
*go_airplane->display_attributes( IMPORTING   ev_name = lv_name2
*                                            ev_planetype = lv_planetype2 ).
*zas_cl_airplane=>display_n_o_airplane( IMPORTING iv_n_o_airplane = lv_n_o_airplane2 ).
*
*gs_airplane-lv_name = lv_name2.
*gs_airplane-lv_planetype = lv_planetype2.
*gs_airplane-lv_n_o_airplane = lv_n_o_airplane2.
*APPEND gs_airplane TO gt_airplane.
*WRITE: gs_airplane-lv_name, gs_airplane-lv_planetype, gs_airplane-lv_n_o_airplane.
*
*cl_demo_output=>display( gt_airplane ).
*ENDLOOP.

*gs_airplane = VALUE #( ( lv_name = lv_name2 lv_planetype = lv_planetype2 lv_n_o_airplane = lv_n_o_airplane2 ) ).
*LOOP AT gs_airplane INTO ls_airplane.
*  WRITE: ls_airplane-lv_name, ls_airplane-lv_planetype, ls_airplane-lv_n_o_airplane.
*ENDLOOP.
