CLASS zob_berechnung DEFINITION

 PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: mv_ergebnis  TYPE p.

    METHODS constructor IMPORTING iv_datum  TYPE sflight-fldate
                                  iv_carrid TYPE sflight-carrid
                                  iv_flug   TYPE sflight-connid.

    METHODS ergebnis EXPORTING ev_ergebnis TYPE p.

  PROTECTED SECTION.
  PRIVATE SECTION.




ENDCLASS.



CLASS ZOB_Berechnung IMPLEMENTATION.


  METHOD constructor.
    SELECT SINGLE
    FROM SflIGHT
    LEFT JOIN spfli
    ON sflight~connid = spfli~connid
    INNER JOIN saplane
    ON SflIGHT~planetype = saplane~planetype
    FIELDS
    sflight~connid,
    sflight~fldate,
    sflight~seatsocc,
    sflight~seatsocc_b,
    sflight~seatsocc_f,
    spfli~cityfrom,
    saplane~consum,
    saplane~weight,
    spfli~fltime
    WHERE sflight~connid = @iv_flug AND sflight~fldate = @iv_datum AND sflight~carrid = @iv_carrid
    INTO @DATA(ls_flug).

    DATA(lv_passagier) = ls_flug-seatsocc + ls_flug-seatsocc_b + ls_flug-seatsocc_f.
    mv_ergebnis = ( ls_flug-fltime * ( ls_flug-consum / 60 ) ) * ( 1 + ( lv_passagier * 80 ) / ls_flug-weight ).
  ENDMETHOD.

  METHOD ergebnis.
    if mv_ergebnis = 0.
    DATA(lv_message) = |Flug ist nicht vorhanden.|.
    MESSAGE lv_message TYPE 'I'.
    EXIT.
    ENDIF.
    ev_ergebnis = mv_ergebnis.
    WRITE: 'Der Verbrauch in Kilogramm beträgt: ', ev_ergebnis.
  ENDMETHOD.
ENDCLASS.
