CLASS zst_class_treibstoffverbrauch DEFINITION

  Public.

  PUBLIC SECTION.

Class-Methods Verbrauchleer
  Importing iv_connid type sflight-connid
            iv_carrid type sflight-carrid
            iv_fldate type sflight-fldate.
*RETURNING VALUE(rv_leerflug) type saplane-consum.   "kann bei Methodenaufruf direkt angegeben werden.

Class-Methods AktTreibstoffbedarf.

  PROTECTED SECTION.
  PRIVATE SECTION.

  Class-Data clv_fltime type spfli-fltime.


  Class-Data rv_leerflug type i.  "nur wenn kein Returning Parameter festgelegt wurde)
  Class-Data rv_leerflug2 type i.

ENDCLASS.



CLASS zst_class_treibstoffverbrauch IMPLEMENTATION.

  METHOD verbrauchleer.


SELECT
  FROM sflight
  LEFT JOIN spfli ON sflight~connid = spfli~connid AND sflight~carrid = spfli~carrid
  LEFT JOIN saplane ON sflight~planetype = saplane~planetype

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

    Into table @Data(lt_gesamt).

READ TABLE lt_gesamt with KEY fldate = iv_fldate connid = iv_connid carrid = iv_carrid INTO data(ls_struktur).

 IF sy-subrc <> 0.
    DATA(lv_messageanl) = |Angegebener Flug ist nicht vorhanden. Bitte überprüfen Sie Ihre Angaben|.
    MESSAGE lv_messageanl TYPE 'I'.
 Endif.

rv_leerflug = ( ls_struktur-consum / ls_struktur-weight ) * ls_struktur-weight.
rv_leerflug2 = rv_leerflug * ls_struktur-fltime.

Write: |Ausgewählter Flug: { ls_struktur-carrid }{ ls_struktur-connid } am { ls_struktur-fldate }|.
Write / ls_struktur-fldate using EDIT MASK mask mm/dd/yyyy.

Uline.

Write: /, 'Treibstoffbedarf in pro kg Fluggewicht:', rv_leerflug, 'kg'.



Skip.

Write: |Treibstoffbedarf (Leerflug) für { ls_struktur-fltime } Minuten Flugzeit:|, rv_leerflug2, 'kg'.   "kann auch im Report erfolgen. Dann muss aber Returningparameter rv_leerflug erfolgen.


  ENDMETHOD.


  METHOD akttreibstoffbedarf.

*  rv_leerflug = rv_leerflug * clv_fltime.
**
**  Write rv_leerflug.

  ENDMETHOD.

ENDCLASS.
