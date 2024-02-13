*&---------------------------------------------------------------------*
*& Report z_efms_michael
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_efms_michael.


PARAMETERS: p_carrid TYPE sflight-carrid,
            p_connid TYPE sflight-connid,
            p_fldate TYPE sflight-fldate.

*************
*Methode verbrauchleer gibt den Treibstoffverbrauch pro kg/Stunde bei Leerflug aus****


zem_class_treibstoffverbrauch=>verbrauchleer( iv_connid = p_connid
                                                           iv_carrid = p_carrid
                                                           iv_fldate = p_fldate ).

*Data rv_leerflug type saplane-consum.
*rv_leerflug = zem_class_treibstoffverbrauch=>verbrauchleer( iv_connid = p_connid
*                                                           iv_carrid = p_carrid
*                                                           iv_fldate = p_fldate ).
*
*write rv_leerflug.



*TABLES sflight.
*TABLES spfli.
*TABLES saplane.
*" tables scarr.
*
*SELECT
*  FROM sflight
*  LEFT JOIN spfli ON sflight~connid = spfli~connid AND sflight~carrid = spfli~carrid
*  LEFT JOIN saplane ON sflight~planetype =  saplane~planetype
*
*  FIELDS
*    sflight~carrid,
*    sflight~connid,
*    sflight~fldate,
*    sflight~seatsocc,
*    sflight~seatsocc_b,
*    sflight~seatsocc_f,
*    saplane~planetype,
*    saplane~consum,
*    saplane~weight,
*    spfli~distance,
*    spfli~distid,
*    spfli~fltime
*
*INTO TABLE @DATA(lt_gesamt).


*READ TABLE lt_gesamt with KEY fldate = p_fldate connid = p_connid carrid = p_carrid INTO data(ls_struktur).
*
*cl_demo_output=>display( ls_struktur ).
*cl_demo_output=>display( lt_gesamt ).





*CLASS zem_class_treibstoffverbrauch DEFINITION
*
*  Public.
*
*  PUBLIC SECTION.
*
*  Class-Methods Verbrauchleer
*  Importing iv_connid type sflight-connid
*            iv_carrid type sflight-carrid
*            iv_fldate type saplane
*  RETURNING VALUE(rv_leerflug) type saplane-custum
*
*
*  PROTECTED SECTION.
*  PRIVATE SECTION.
*
*ENDCLASS.
