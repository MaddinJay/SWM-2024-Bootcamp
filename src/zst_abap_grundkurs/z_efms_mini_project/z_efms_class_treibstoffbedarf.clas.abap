CLASS z_efms_class_treibstoffbedarf DEFINITION


PUBLIC.

  PUBLIC SECTION.

**********************************************************************
* Öffentliche Methode mit Import-Parametern aus Hauptprogramm z_efms_gesamt.
**********************************************************************

    CLASS-METHODS verbrauch                             "um Flug eindeutig zu identifizieren. Import über Eingabefelder.
      IMPORTING iv_connid TYPE sflight-connid           "Fluggesellschaft zweistellig
                iv_carrid TYPE sflight-carrid           "Flugnummer
                iv_fldate TYPE sflight-fldate.          "Flugdatum

*RETURNING VALUE(rv_leerflug) type saplane-consum.      "falls Ausgabe im Hauptprogramm erfolgen soll. Kann bei Methodenaufruf direkt angegeben werden, rv_leerflug = class=>methode ().

    CLASS-METHODS tankkosten
      IMPORTING iv_literpreis TYPE p.                   "Literpreis Kerosin, wenn sich Nutzer Tankkosten zeigen lässt.


**********************************************************************
* Datendeklaration Private Section --- für Berechnung Treibstoffbedarf + Kosten
**********************************************************************

  PRIVATE SECTION.

    CLASS-DATA mv_liter TYPE p DECIMALS 1.                   "Anpassung (kg auf liter)
    CLASS-DATA mv_faktor TYPE p DECIMALS 2.                  "Anpassung (Kurz Mittel Langstreck)

    CLASS-DATA mv_flug TYPE p DECIMALS 1.                   "Verbrauch pro Stunde..
    CLASS-DATA mv_flug2 TYPE p DECIMALS 1.                  "..angepasst

    CLASS-DATA mv_seatsocc_gesamt TYPE p DECIMALS 1.        "Belegte Sitze und Gewichte ...
    CLASS-DATA mv_gewicht_passagiere TYPE p DECIMALS 1.

    CLASS-DATA mv_kgbedarf TYPE p DECIMALS 1.                "Treibstoffbedarf Gesamt + Einzel ....
    CLASS-DATA mv_pbedarf TYPE p DECIMALS 1.
    CLASS-DATA mv_passagier TYPE p DECIMALS 1.
    CLASS-DATA mv_passagier2 TYPE p DECIMALS 1.


    CLASS-DATA mv_tankkosten TYPE p DECIMALS 2.               "Tankkosten....


CONSTANTS mc_person TYPE i VALUE 102. " 77 kg (Standardperson) + 25 kg Gepäck bzw. Handgepäck

ENDCLASS.


CLASS z_efms_class_treibstoffbedarf IMPLEMENTATION.


  METHOD verbrauch.


**********************************************************************
* Auslesen ausgewählten Flug in Struktur ls_struktur
*  Felder für Berechnung des Treibstoffbedarfs - Datenbanken spfli, sflight, saplane ,
**********************************************************************

    SELECT SINGLE
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
        spfli~distid,           "Längenangabe (meilen oder km)
        spfli~fltime
*saplane~tankcap                "Optional, für Berechnung verbleibender Kapazität

        WHERE sflight~fldate = @iv_fldate AND sflight~connid = @iv_connid AND sflight~carrid = @iv_carrid    "Eingaben des Nutzers in Hauptprogramm

        INTO @DATA(ls_struktur).


*Hinweis, wenn kein Flug ausgelesen werden konnte
**********************************************************************

    IF sy-subrc <> 0. "    Hinweis, wenn kein Flug aus den Danken ausgelesen werden konnte.
      DATA(lv_messageanl) = |Der ausgewählte Flug ist nicht vorhanden.     Bitte überprüfen Sie Ihre Angaben.|.
      MESSAGE lv_messageanl TYPE 'E' DISPLAY LIKE 'I'.
    ENDIF.


* Anpassungsfaktor anhand Flugdistanz emitteln
* (Kurz-, Mittel-, Langstrecke) - je nach Angabe in Meilen oder km.
**********************************************************************

    IF ls_struktur-distid = 'MI'.                           "Anpassung für Meilen

      IF ls_struktur-distance < '621.3710'.
        mv_faktor = '1.8'.                                  "Kurzstrecke

      ELSEIF ls_struktur-distance > '1864.1140'.            "Langstrecke
        mv_faktor = '1.1'.

      ELSE. mv_faktor = '1.4'.                              "Mittelstrecke

      ENDIF.

    ELSEIF ls_struktur-distid = 'KM'.                        "Anpassung für Kilometer

      IF ls_struktur-distance < '1000'.                      "...
        mv_faktor = '1.8'.

      ELSEIF ls_struktur-distance > '3000'.                  "....
        mv_faktor = '1.1'.

      ELSE. mv_faktor =  '1.4'.                                ".....

      ENDIF.

    ENDIF.

**********************************************************************
* Berechnungen Treibstoffbedarf gesamt + für eine einzelne Person
**********************************************************************

    mv_seatsocc_gesamt = ls_struktur-seatsocc + ls_struktur-seatsocc_b + ls_struktur-seatsocc_f.
    " Berechnung der Passagiere bzw. belegten Plätze

    mv_gewicht_passagiere = mv_seatsocc_gesamt * mc_person.
    " Berechnung des Gewicht aller Passagiere mit Gepäck

    mv_flug = ( ls_struktur-consum *  ( mv_gewicht_passagiere + ls_struktur-weight ) / ls_struktur-weight ).
    " Berechnung des Verbrauchs pro Stunde: Flugzeug + Passagiere

    mv_flug2 = mv_flug * mv_faktor * ( ls_struktur-fltime / 60 ).     "Umrechnung Minuten zu Stunden
    " Gesamtverbrauch mit Flugzeit mit Faktor für Kurz- / Mittel- / Langstrecke

    mv_liter = '0.8' * mv_flug2.
    " Umrechnung von KG in Litern


    mv_passagier = ( ls_struktur-consum / ls_struktur-weight ) * mc_person.
    "Einzelne Person

    mv_passagier2 = mv_passagier *'0.8'.
    "Umrechnung von KG in Liter


*      DATA: mv_tankcap  TYPE p DECIMALS 1,
*            mv_tankcapl TYPE p DECIMALS 2.
*
*      mv_tankcap = ls_struktur-tankcap - mv_liter.

**********************************************************************
* Ausgabe : Info zu Auswahl -> Gesamtverbrauch -> Einzelverbrauch
**********************************************************************

    WRITE: |Ausgewählter Flug: { ls_struktur-carrid }{ ls_struktur-connid } am { ls_struktur-fldate+6(2) }.{ ls_struktur-fldate+4(2) }.{ ls_struktur-fldate(4) }|,

            '--', 'Flugzeugtyp:', ls_struktur-planetype.

    ULINE.


    WRITE: /, |Der Flug { ls_struktur-carrid }{ ls_struktur-connid } am { ls_struktur-fldate+6(2) }.{ ls_struktur-fldate+4(2) }.{ ls_struktur-fldate(4) } benötigt:|,
               mv_flug2,'KG'.

    WRITE: /, |Der Flug { ls_struktur-carrid }{ ls_struktur-connid } am { ls_struktur-fldate+6(2) }.{ ls_struktur-fldate+4(2) }.{ ls_struktur-fldate(4) } benötigt:|,
                mv_liter,'Liter'.

    WRITE: /, |Pro Passagier fällt ein zusätzlicher Verbrauch von { mv_passagier } KG bzw. von { mv_passagier2 } Liter an |.

    SKIP.

    ULINE. ULINE.

**********************************************************************
*Optional, Ausgabe Bedarf pro kg Fluggewicht + Gesamtverbrauch mit Angabe der Flugzeit + Tank-Kapazität

*WRITE: /, 'Treibstoffbedarf in pro kg Fluggewicht:', rv_flug, 'kg'.          "Optional, Ausgabe Treibstoff/kg + Flugzeit mit Gesamtverbrauch

*WRITE: /, |Treibstoffbedarf für { ls_struktur-fltime } Minuten Flugzeit:|, rv_flug2, 'kg'.   "Optional, Flugzeit mit Gesamtverbrauch


*WRITE: 'Maximale Treibstroffmenge für Flugzeugtyp:', ls_struktur-tankcap, 'Liter', /.
*WRITE: icon_green_light, 'Freie Kapazität:', mv_tankcap, 'Liter', /.


*    IF mv_tankcap < 20.                       "Test ob nicht zuviel getankt wird.
*      WRITE: 'bis hierher und nicht weiter'.
*    ENDIF.

  ENDMETHOD.

  METHOD tankkosten.                            "Methode Kerosinkosten anhand Literpreis und Treibstoffbedarf
    mv_tankkosten = mv_liter * iv_literpreis.
    WRITE: |Die Tankkosten belaufen sich auf { mv_tankkosten } Euro |.
  ENDMETHOD.
ENDCLASS.
