*&---------------------------------------------------------------------*
*& Report zem_instanzflug
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_instanzflug.


CLASS lcl_airplane DEFINITION.

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_name      TYPE string
                                  iv_planetype TYPE saplane-planetype
                                  iv_weight    TYPE saplane-weight
                                  iv_tankcap   TYPE saplane-tankcap
                       EXCEPTIONS planetype_no.



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
    mv_name = iv_name.
    mv_planetype = iv_planetype.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
    mv_weight = iv_weight.
    mv_tankcap = iv_tankcap.

    "Lesen Sie einen einzelnen Datensatz aus der DB Tabelle SAPLANE für den angegebenen Flugzeugtyp
    SELECT
    FROM saplane
    FIELDS weight, planetype
    WHERE planetype = @iv_planetype
    INTO TABLE @DATA(gt_airplane).
    cl_demo_output=>display( gt_airplane ).

    "Attribute entsprechend der Implementation geändert
*    UPDATE saplane SET weight = @iv_weight, tankcap = @iv_tankcap WHERE planetype = @iv_planetype.
*
*    "Datensatz ausgelesen
*    cl_demo_output=>display( gt_airplane ).

  ENDMETHOD.

ENDCLASS.

**********************************************************************
**********************************************************************

START-OF-SELECTION.

  DATA: gv_airplane            TYPE REF TO lcl_airplane,
        gt_airplane            TYPE TABLE OF REF TO lcl_airplane,
        gv_number_of_airplanes TYPE i.

**********************************************************************
* InstanzConstructor implementieren
**********************************************************************
*  gv_airplane = NEW #(
*  iv_name = 'Airbus'
*  iv_planetype = '737-800'
*  iv_weight = 1200
*  iv_tankcap = 21500
*).

**********************************************************************
*Exception
**********************************************************************
Create OBJECT gv_airplane
Exporting
iv_planetype = '737-800'
iv_name = 'ss '
iv_weight = '15'
iv_tankcap = '23'
EXCEPTIONS
planetype_no = 1.

IF sy-subrc >< 0.
Write: 'Ach du Sch***'.
Endif.







**********************************************************************
* statischer Methodenaufruf
**********************************************************************
  lcl_airplane=>display_n_o_airplanes( ).

**********************************************************************
* InstanzMethodenaufruf
**********************************************************************
  gv_airplane->display_attributes( ).


END-OF-SELECTION.
