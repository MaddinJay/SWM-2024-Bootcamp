*&---------------------------------------------------------------------*
*& Report ZMB_OO
*&---------------------------------------------------------------------*------------------------------------------------------------------*
REPORT zmb_oo.

**********************************************************************
*  CLASS lcl_vehicle Defintion
**********************************************************************

CLASS lcl_vehicle DEFINITION.


  PUBLIC SECTION.

    TYPES: BEGIN OF ts_mytyp,
             feld1 TYPE i,
             feld2 TYPE string,
           END OF ts_mytyp.

 CONSTANTS pi TYPE p DECIMALS 4 LENGTH 3 value '3.1415'.

    DATA mv_make TYPE string.
    DATA mv_model TYPE string.  "data mv_model like mv_make (Alternative)
    DATA ms_lokal TYPE ts_mytyp.
*data mr_ref TYPE REF TO lcl_ship. "mr-ref ist wie ein Zeiger/Pointer der auf einen Speicher zeigt

ENDCLASS.



**********************************************************************
*  CLASS lcl_vehicle Implementation
**********************************************************************

CLASS lcl_vehicle IMPLEMENTATION.
ENDCLASS.

data gs_sruktur type lcl_vehicle=>ts_mytyp.

DATA gr_vehic TYPE REF TO lcl_vehicle.
*BREAK-POINT. -> hier wird ein Initialwert erzeugt, da noch nichts angelegt ist
CREATE OBJECT gr_vehic.
*BREAK-POINT.

gr_vehic->mv_make = 'Ford'.
gr_vehic->mv_model = 'Galaxie 500'.

BREAK-POINT.
