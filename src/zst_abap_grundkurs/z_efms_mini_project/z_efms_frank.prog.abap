*&---------------------------------------------------------------------*
*& Report z_efms_frank
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_efms_frank.

TABLES sflight.
TABLES spfli.
TABLES saplane.
" tables scarr.

SELECT
  FROM sflight
  LEFT JOIN spfli ON sflight~connid = spfli~connid AND sflight~carrid = spfli~carrid
  LEFT JOIN saplane ON sflight~planetype =  saplane~planetype

  FIELDS
    sflight~carrid,
    sflight~connid,
    sflight~fldate,
    sflight~seatsocc,
    sflight~seatsocc_b,
    sflight~seatsocc_f,
    saplane~planetype,
    saplane~consum,
    saplane~weight,
    spfli~distance,
    spfli~distid,
    spfli~fltime

INTO TABLE @DATA(lt_gesamt).

PARAMETERS: p_carrid TYPE sflight-carrid,
            p_connid TYPE sflight-connid,
            p_fldate TYPE sflight-fldate.

*"DATA ls_struktur TYPE .
*TYPES: BEGIN OF ls_struktur.
*
*END of ls_struktur.
*
*DATA(ls_struktur) like table of lt_gesamt.


READ TABLE lt_gesamt with KEY fldate = p_fldate connid = p_connid carrid = p_carrid INTO data(ls_struktur).



*
*
cl_demo_output=>display( ls_struktur ).
cl_demo_output=>display( lt_gesamt ).


*  SUM( b~seatsmax ) AS Max_Beleg_Eco,
*  SUM( b~seatsmax_B ) AS Max_Beleg_Bus,
*  SUM( b~seatsmax_F ) AS Max_Beleg_Fir

********************
* Für Rechnung kann Feld aus der Struktur bezeichnet werden
* z.B.


Data lv_stundenverbrauch_leer type saplane-consum.


lv_stundenverbrauch_leer = ( ls_struktur-consum / ls_struktur-weight )." Verbrauch Flug in kg/pro Stunde ohne Passagiere

write lv_stundenverbrauch_leer.
