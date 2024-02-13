CLASS z_g2_leerflugzeug_menge DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: Connid          TYPE spfli-connid,
          carrid          TYPE spfli-carrid,
          fldate          TYPE sflight-fldate,
          planetype       TYPE sflight-planetype,
          consum          TYPE saplane-consum,
          fltime          TYPE spfli-fltime,
          cityfrom        TYPE spfli-cityfrom,
          cityto          TYPE spfli-cityto,
          flugdauer_h     TYPE p DECIMALS 2,
          kerosinmenge_kg TYPE p DECIMALS 2,
          kerosinmenge_l  TYPE p DECIMALS 2.

    CONSTANTS: Dichte_Kero TYPE p DECIMALS 2 VALUE '0.80'.     "Kerosindichte in kg/l


    METHODS berechnung_Kerosinmenge
      IMPORTING iv_flugnr TYPE spfli-connid                    "müssen importiert werden, da sonst keine Befüllung stattfinden kann
                iv_datum  TYPE sflight-fldate
                iv_fges   TYPE spfli-carrid.

    METHODS display_kerosinmeng_l.                             "Anzeige vom Ergebnis

    METHODS get_kerosinmenge_l
      RETURNING VALUE(rv_kerosinmenge_l) LIKE kerosinmenge_l.  "Damit der Wert im Programm mit ausgegeben werden kann


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_g2_leerflugzeug_menge IMPLEMENTATION.

  METHOD berechnung_kerosinmenge.

    SELECT SINGLE
 FROM spfli
 LEFT JOIN sflight
 ON spfli~connid = sflight~connid AND spfli~carrid = sflight~carrid
 LEFT JOIN saplane
 ON sflight~planetype = saplane~planetype
 FIELDS
 spfli~connid AS flugnummer,
 spfli~carrid AS fluggesellschaft,
 spfli~cityfrom AS abflughafen,
 spfli~cityto AS ankunftflughafen,
 sflight~planetype AS flugzeugtyp,
 sflight~fldate AS datum,
 saplane~consum  AS verbrauch,
 spfli~fltime AS flugzeit

  WHERE spfli~connid = @iv_flugnr AND sflight~fldate = @iv_datum AND spfli~carrid = @iv_Fges

 INTO @DATA(ls_kerosin).

**********************************************************************
*Berechnung Kerosinmengen
**********************************************************************

    kerosinmenge_kg = ( ls_kerosin-flugzeit / 60 ) * ls_kerosin-verbrauch .    " Berechnung Kerosinmenge in kg; da Zeitangabe in Minuten erfolgt wird durch 60 geteilt
    kerosinmenge_l = kerosinmenge_kg / Dichte_kero.                            " Berechnung Kerosinmenge in Litern

*Cityto und cityfrom kann nur hier definiert werden --> Lokal für die Methode
    cityto = ls_kerosin-ankunftflughafen.
    cityfrom = ls_kerosin-abflughafen.


  ENDMETHOD.


  METHOD display_kerosinmeng_l.

    WRITE: |Das leere Flugzeug benötigt für die Strecke von { cityfrom } nach { cityto } { kerosinmenge_l } Liter Kerosin.| .

  ENDMETHOD.


  METHOD get_kerosinmenge_l.

    rv_kerosinmenge_l = kerosinmenge_l.

  ENDMETHOD.

ENDCLASS.



