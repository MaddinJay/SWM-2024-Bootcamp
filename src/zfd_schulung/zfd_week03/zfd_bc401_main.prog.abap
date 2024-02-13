*&---------------------------------------------------------------------*
*& Report zfd_bc401_main
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_bc401_main.

INCLUDE ZFD_airplane1.

*******************************
* Start Hauptprogramm
*******************************
PARAMETERS: p_para1 TYPE saplane-planetype.

DATA go_plane TYPE REF TO lcl_airplane.
DATA lt_tabelle TYPE TABLE OF REF TO lcl_airplane.

START-OF-SELECTION.

*  DATA  ls_plane TYPE saplane.
*
*  SELECT SINGLE
*  FROM saplane
*  FIELDS weight, tankcap, planetype
*  WHERE planetype = 'FOKKER 100'
*  INTO CORRESPONDING FIELDS OF @ls_plane.

*  lcl_airplane=>display_n_o_airplanes( ).

*  go_plane = NEW #( iv_name = 'Die Dachau'
*                    iv_planetype = 'MD11'
*                    iv_planeweight = ls_plane-weight
*                    iv_planetankcap = ls_plane-tankcap
*  ).
  CREATE OBJECT go_plane
    EXPORTING
      iv_name                = 'Die Dachau'
      iv_planetype           = p_para1
*     iv_planeweight         = ls_plane-weight
*     iv_planetankcap        = ls_plane-tankcap
    EXCEPTIONS
      planetype_not_existing = 1.

  IF sy-subrc <> 0.
    WRITE 'keine Daten zum Planetype gefunden'.
    Exit.
  ENDIF.

  " alte Variante Objekte zu kreieren:   CREATE OBJECT go_plane.
*                      " oder Data(go_plane) = New lcl_airplane( ).
*  APPEND go_plane TO lt_tabelle.

  go_plane->display_attributes( ).
*  go_plane->set_airplane_name(
*    EXPORTING iv_name = lv_para1 ).
*  go_plane->set_planetype(
*    EXPORTING iv_planetype = 'BOING 474' ).
*  go_plane->display_attributes( ).

*  APPEND go_plane TO lt_tabelle.


*  lcl_airplane=>display_n_o_airplanes( ).  " Statischer Methodenaufruf

  DATA gv_number TYPE i.
*  lcl_airplane=>display_n_o_airplanes( IMPORTING ev_n_o_airplanes = gv_number ).

  DATA gv_number_of_airplanes TYPE i.
*  gv_number_of_airplanes = go_plane->get_n_o_airplanes(  ). " Funktionaler Methodenaufruf

*  WRITE:  /'Counter ist gleich: ', gv_number_of_airplanes.

*  go_plane->get_n_o_airplanes_exp(
*    IMPORTING
*      ev_count = gv_number_of_airplanes
*      ).                                                    " Instanzmethodenaufruf.

*  WRITE:  /'Counter ist gleich: ', gv_number_of_airplanes.

*  cl_demo_output=>display( lt_tabelle ).
