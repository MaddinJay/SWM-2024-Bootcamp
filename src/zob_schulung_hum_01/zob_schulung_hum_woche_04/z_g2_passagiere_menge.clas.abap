CLASS z_g2_passagiere_menge DEFINITION
  PUBLIC
  INHERITING FROM z_g2_leerflugzeug_menge
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: seatsocc       TYPE sflight-seatsocc,
          seatsocc_b     TYPE sflight-seatsocc_b,
          seatsocc_f     TYPE sflight-seatsocc_f,
          distance       TYPE spfli-distance,
          distid         TYPE spfli-distid,
          menge_pas      TYPE sflight-seatsocc,
          kerosinp_l     TYPE p DECIMALS 2,
          kerosinmenge_g TYPE p DECIMALS 2.

    CONSTANTS: MI_Convert  TYPE p DECIMALS 2  VALUE '1.61',         "Konstante für die Umrechnung von Meilen in km
               PE_Constant TYPE p DECIMALS 3 VALUE '0.045'.         "Internetrecherche: 4,5 l Kerosin pro Passagier mit Gepäck pro 100 km


    METHODS berechnung_keromenge_personen
      IMPORTING iv_flugnr TYPE spfli-connid                         "müssen importiert werden, da sonst keine Befüllung stattfinden kann
                iv_datum  TYPE sflight-fldate
                iv_fges   TYPE spfli-carrid.

    METHODS get_kerosinp_l
      RETURNING VALUE(rv_kerosinp_l) LIKE kerosinp_l.               "Damit der Wert im Programm mit ausgegeben werden kann

    METHODS anzeige.                                                "Anzeige vom Ergebnis

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS z_g2_passagiere_menge IMPLEMENTATION.

  METHOD berechnung_keromenge_personen.

    SELECT SINGLE
FROM spfli
LEFT JOIN sflight
ON spfli~connid = sflight~connid AND spfli~carrid = sflight~carrid
LEFT JOIN saplane
ON sflight~planetype = saplane~planetype
FIELDS
spfli~connid AS flugnummer,
spfli~carrid AS fluggesellschaft,
spfli~distance AS flugstrecke,
spfli~distid AS distanzart,
sflight~planetype AS flugzeugtyp,
sflight~fldate AS datum,
spfli~fltime AS flugzeit,
sflight~seatsocc AS sitzplaetze_eco,
sflight~seatsocc_b AS sitzplaetze_b,
sflight~seatsocc_f AS sitzplaetze_f

WHERE spfli~connid = @iv_flugnr AND sflight~fldate = @iv_datum AND spfli~carrid = @iv_Fges

INTO @DATA(ls_kero_p).

**********************************************************************
*Berechnung der gesamten Passagieranzahl
**********************************************************************

    Menge_pas = ls_kero_p-sitzplaetze_eco + ls_kero_p-sitzplaetze_b + ls_kero_p-sitzplaetze_f.

**********************************************************************
*Abfrage ob Meilen und Berechnung der Distanz in Kilometer
**********************************************************************

    IF ls_kero_p-distanzart = 'MI'.                                 "falls Flugstrecke in Meilen, erfolgt hier Umrechnung in Kilometer
      ls_kero_p-flugstrecke = ls_kero_p-flugstrecke * MI_Convert.
    ELSE.
      ls_kero_p-flugstrecke = ls_kero_p-flugstrecke.                "bei nicht Meilen also km ist die Flugstecke = Flugstecke
    ENDIF.

**********************************************************************
*Berechnung der benötigten Kerosinmenge anhand der Personen
**********************************************************************
    kerosinp_l = ls_kero_p-flugstrecke * menge_pas * pe_constant.

  ENDMETHOD.



  METHOD anzeige.

    WRITE |Die benötigte Menge Kerosin für die { Menge_pas } Passagiere beträgt { kerosinp_l } Liter |.

  ENDMETHOD.

  METHOD get_kerosinp_l.

    rv_kerosinp_l = kerosinp_l.

  ENDMETHOD.

ENDCLASS.


