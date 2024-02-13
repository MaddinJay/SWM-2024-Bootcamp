CLASS z_efms_class_verbrauch DEFINITION

  PUBLIC.

  PUBLIC SECTION.

    CLASS-METHODS verbrauch
      IMPORTING iv_connid TYPE sflight-connid
                iv_carrid TYPE sflight-carrid
                iv_fldate TYPE sflight-fldate.

    class-METHODS tankkosten
      importing iv_literpreis type p.

*RETURNING VALUE(rv_leerflug) type saplane-consum.   "kann bei Methodenaufruf direkt angegeben werden.


  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-DATA clv_fltime TYPE spfli-fltime.


    CLASS-DATA rv_flug TYPE i.  "nur wenn kein Returning Parameter festgelegt wurde)
    CLASS-DATA rv_flug2 TYPE i.
    CLASS-DATA rv_liter TYPE i.
    CLASS-DATA rv_tankkosten TYPE p decimals 2.
    CLASS-DATA rv_seatsocc_gesamt TYPE i.
    CLASS-DATA rv_gewicht_passagiere TYPE i.
    CLASS-DATA rv_passagier TYPE i.
    CLASS-DATA rv_passagier2 TYPE i.
    CONSTANTS mc_person TYPE i VALUE 102. " 77 kg (Standardperson) + 25 kg Gepäck bzw. Handgepäck

ENDCLASS.


CLASS z_efms_class_verbrauch IMPLEMENTATION.

  METHOD verbrauch.


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

        INTO TABLE @DATA(lt_gesamt).

    READ TABLE lt_gesamt WITH KEY fldate = iv_fldate connid = iv_connid carrid = iv_carrid INTO DATA(ls_struktur).

    IF sy-subrc <> 0.
      DATA(lv_messagean2) = |Angegebener Flug ist nicht vorhanden. Bitte überprüfen Sie Ihre Angaben|.
      MESSAGE lv_messagean2 TYPE 'I'.

      DATA(lv_messageanl) = |Angegebener Flug ist nicht vorhanden. Bitte überprüfen Sie Ihre Angaben|.
      MESSAGE lv_messageanl TYPE 'E'.
    ENDIF.
*******************************
* Berechnungen
*******************************
    rv_seatsocc_gesamt = ls_struktur-seatsocc + ls_struktur-seatsocc_b + ls_struktur-seatsocc_f.
    " Berechnung der Passagiere bzw. belegten Plätze

    rv_gewicht_passagiere = rv_seatsocc_gesamt * mc_person.
    " Berechnung des Gewicht aller Passagiere mit Gepäck

    rv_flug = ( ls_struktur-consum *  ( rv_gewicht_passagiere + ls_struktur-weight ) / ls_struktur-weight ).
    " Berechnung des Verbrauchs pro Stunde: Flugzeug + Passagiere

    rv_flug2 = rv_flug * ls_struktur-fltime.
    " Gesamtverbrauch mit Flugzeit

    rv_liter = '0.8' * rv_flug2.
    " Umrechnung von KG in Litern

    rv_passagier = ( ls_struktur-consum / ls_struktur-weight ) * mc_person.
    rv_passagier2 = rv_passagier *'0.8'.


    WRITE: |Ausgewählter Flug: { ls_struktur-carrid }{ ls_struktur-connid } am { ls_struktur-fldate }|.

    ULINE.

    WRITE: /, 'Treibstoffbedarf in pro kg Fluggewicht:', rv_flug, 'kg'.



    SKIP.

    WRITE: |Treibstoffbedarf für { ls_struktur-fltime } Minuten Flugzeit:|, rv_flug2, 'kg'.   "kann auch im Report erfolgen. Dann muss aber Returningparameter rv_leerflug erfolgen.

    WRITE: |Der Flug { ls_struktur-carrid }{ ls_struktur-connid } am { ls_struktur-fldate+6(2) }.{ ls_struktur-fldate+4(2) }.{ ls_struktur-fldate(4) } benötigt:|, rv_flug2, 'kg'.
    WRITE: /, |Der Flug { ls_struktur-carrid }{ ls_struktur-connid } am { ls_struktur-fldate+6(2) }.{ ls_struktur-fldate+4(2) }.{ ls_struktur-fldate(4) }  benötigt:|, rv_liter, 'Liter'.
    WRITE: /, |Pro Passagier fällt ein zusätzlicher Verbrauch von { rv_passagier } KG bzw. von { rv_passagier2 } Liter an |.


  ENDMETHOD.


  METHOD tankkosten.
   rv_tankkosten = rv_liter * iv_literpreis.
   write: |Die Tankkosten belaufen sich auf { rv_tankkosten } Euro |.
  ENDMETHOD.

ENDCLASS.
