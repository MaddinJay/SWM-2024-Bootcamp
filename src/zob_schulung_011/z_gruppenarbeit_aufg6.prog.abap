*&---------------------------------------------------------------------*
*& Report z_gruppenarbeit_aufg6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_gruppenarbeit_aufg6.

CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING  iv_name      TYPE string
                                   iv_planetype TYPE saplane-planetype
                                   iv_weight    TYPE saplane-weight
                                   iv_tankcap   TYPE saplane-tankcap
                        EXCEPTIONS planetype_not_existing.  " Klassiche Exception

    METHODS: display_attributes "öffentliche Instanzmethode
      EXPORTING ev_name      TYPE string
                ev_planetype TYPE saplane-planetype.

    CLASS-METHODS display_n_o_airplanes. "statische Methode

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mv_name      TYPE string, "(privates Instanzattribut), mv = member variable
          mv_planetype TYPE saplane-planetype, "(privates Instanzattribut), mv = member variable
          mv_weight    TYPE saplane-weight,
          mv_tankcap   TYPE saplane-tankcap.
    CLASS-DATA gv_n_o_airplanes TYPE i. "(privates statisches Attribut)

ENDCLASS.

**********************************************************************
**********************************************************************

CLASS lcl_airplane IMPLEMENTATION.

  METHOD display_attributes.
    ev_name = mv_name.
    ev_planetype = mv_planetype.
    WRITE: /'Airplane Name: ', mv_name.
    WRITE: /'Planetype: ', mv_planetype.
    WRITE: /'Weight: ', mv_weight.
    WRITE: /'Tankcap: ', mv_tankcap.

  ENDMETHOD.

  METHOD display_n_o_airplanes.
    WRITE: / 'Number of Airplanes: ', gv_n_o_airplanes.
  ENDMETHOD.

  METHOD constructor.
    SELECT SINGLE
    FROM saplane
    FIELDS weight, tankcap
    WHERE planetype = @iv_planetype "'146-300'
    INTO @DATA(ls_airplane).
*    cl_demo_output=>display( ls_airplane ).

    IF sy-subrc <> 0.
      RAISE planetype_not_existing. "=> Raus aus Methode
    ELSE.
      mv_name = iv_name.
      mv_weight = ls_airplane-weight.
      mv_planetype = iv_planetype.
      mv_tankcap = ls_airplane-tankcap.
      gv_n_o_airplanes = gv_n_o_airplanes + 1.
    ENDIF.
    "Lesen Sie einen einzelnen Datensatz aus der DB Tabelle SAPLANE für den angegebenen Flugzeugtyp



    "Attribute entsprechend der Implementation geändert
*    UPDATE saplane SET weight = @iv_weight, tankcap = @iv_tankcap WHERE planetype = @iv_planetype.

    "Datensatz ausgelesen
*    cl_demo_output=>display( gt_airplane ).
*    RAISE wrong_call.
  ENDMETHOD.

ENDCLASS.

**********************************************************************
**********************************************************************

START-OF-SELECTION.

  DATA: gv_airplane            TYPE REF TO lcl_airplane,
        gs_airplane            TYPE saplane,
        gt_airplane            TYPE TABLE OF REF TO lcl_airplane,
        gv_number_of_airplanes TYPE i.

**********************************************************************
* InstanzConstructor implementieren
**********************************************************************
  gv_airplane = NEW #(
  iv_name = 'Airbus'
  iv_planetype = '146-300' "gs_airplane-planetype "
  iv_weight = gs_airplane-weight
  iv_tankcap = gs_airplane-tankcap ).
*  IF sy-subrc <> 0.
*  ENDIF.


**********************************************************************
* statischer Methodenaufruf
**********************************************************************
  lcl_airplane=>display_n_o_airplanes( ).

**********************************************************************
* InstanzMethodenaufruf
**********************************************************************
  gv_airplane->display_attributes( ).


END-OF-SELECTION.
