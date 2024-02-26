*&---------------------------------------------------------------------*
*& Report zfd_efms_frank2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zfd_efms_frank2.

TABLES sflight.
TABLES spfli.
TABLES saplane.
" tables scarr.

CLASS lcl_verbrauch DEFINITION.

  PUBLIC SECTION.

    TYPES: BEGIN OF ty_struktur,
             carrid     TYPE c LENGTH 3,
             connid     TYPE n LENGTH 4,
             fldate     TYPE dats,
             seatsocc   TYPE i,
             seatsocc_b TYPE i,
             seatsocc_f TYPE i,
             planetype  TYPE c LENGTH 10,
             consum     TYPE i,
             weight     TYPE p DECIMALS 4 LENGTH 14,
             distance   TYPE p DECIMALS 4 LENGTH 9,
             distid     TYPE unit,
             fltime     TYPE i,
           END OF ty_struktur.

*    Data


    METHODS: constructor IMPORTING is_struktur TYPE ty_struktur,

      belegte_plaetze IMPORTING iv_seatsocc        TYPE i
                                iv_seatsocc_b      TYPE i
                                iv_seatsocc_f      TYPE i
                      EXPORTING ev_seatsocc_gesamt TYPE i,

      gewicht_passagiere IMPORTING iv_passagiere         TYPE i
                         EXPORTING ev_gewicht_passagiere TYPE i,

      get_plane_weight.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_seatsocc_gesamt TYPE i.
    DATA mv_gewicht_passagiere TYPE i.
    CONSTANTS mc_person TYPE i VALUE 102. " 77 kg (Standardperson) + 25 kg Gepäck bzw. Handgepäck

ENDCLASS.


CLASS lcl_verbrauch IMPLEMENTATION.

  METHOD constructor.

  ENDMETHOD.

  METHOD belegte_plaetze.
    mv_seatsocc_gesamt = iv_seatsocc + iv_seatsocc_b + iv_seatsocc_f.
    ev_seatsocc_gesamt = mv_seatsocc_gesamt.
*    me->gewicht_passagiere( ev_seatsocc_gesamt ).
  ENDMETHOD.

  METHOD gewicht_passagiere.
    mv_gewicht_passagiere = iv_passagiere * mc_person.
    ev_gewicht_passagiere = mv_gewicht_passagiere .

  ENDMETHOD.

  METHOD get_plane_weight.

  ENDMETHOD.

ENDCLASS.

PARAMETERS: p_carrid TYPE sflight-carrid,
            p_connid TYPE sflight-connid,
            p_fldate TYPE sflight-fldate.

START-OF-SELECTION.

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

  READ TABLE lt_gesamt WITH KEY fldate = p_fldate connid = p_connid carrid = p_carrid INTO DATA(ls_struktur).

*Data go_verbrauch type ref to lcl_verbrauch.
*  go_verbrauch = NEW #( is_struktur = ls_struktur-carrid
*  connid     = ls_struktur-connid
*  fldate     = ls_struktur-
*  seatsocc   = ls_struktur-
*  seatsocc_b = ls_struktur-
*  seatsocc_f = ls_struktur-
*  planetype  = ls_struktur-
*  consum     = ls_struktur-
*  weight     = ls_struktur-
*  distance   = ls_struktur-
*  distid     = ls_struktur-
*  fltime     = ls_struktur-  )

cl_demo_output=>display( ls_struktur ).
*cl_demo_output=>display( lt_gesamt ).












*SELECT single
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
*where sflight~fldate = @p_fldate and sflight~connid = @p_connid and sflight~carrid = @p_carrid
*INTO @DATA(ls_struktur).


  "DATA ls_struktur TYPE .
*TYPES: BEGIN OF ls_struktur.
*
*END of ls_struktur.
*
*DATA(ls_struktur) like table of lt_gesamt.




*READ TABLE lt_gesamt WITH KEY lt_gesamt-fldate = iv_fldate lt_gesamt-connid = iv_connid lt_gesamt-carrid = iv_carrid INTO ls_struktur.



*
*



*  SUM( b~seatsmax ) AS Max_Beleg_Eco,
*  SUM( b~seatsmax_B ) AS Max_Beleg_Bus,
*  SUM( b~seatsmax_F ) AS Max_Beleg_Fir
