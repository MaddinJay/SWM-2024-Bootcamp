*&---------------------------------------------------------------------*
REPORT z_efms_basti.


START-OF-SELECTION.
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

PARAMETERS: p_carrid TYPE sflight-carrid,
            p_connid TYPE sflight-connid,
            p_fldate TYPE sflight-fldate.


*READ TABLE lt_gesamt with KEY fldate = p_fldate connid = p_connid carrid = p_carrid INTO data(ls_struktur).


zst_class_verbrauch=>verbrauch( iv_connid = p_connid iv_carrid = p_carrid iv_fldate = p_fldate ).

*cl_demo_output=>display( ls_struktur ).
*cl_demo_output=>display( lt_gesamt ).
