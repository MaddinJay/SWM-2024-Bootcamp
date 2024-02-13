CLASS zcl_od_verbrauchsdaten DEFINITION
  PUBLIC
  CREATE PUBLIC .

  " Frage 1: Können wir die Annahme treffen, dass Kunden jeden Monat Zählerstände eingeben -> Ja
  " Frage 2: Lieber "Januar" oder Datum 01.01.2024? -> Ablesedatum xx.xx.xxxx
  " Frage 3: Lieber "von bis" oder monatliche Kosten -> monatlich


  PUBLIC SECTION.
    DATA: lv_kdnr       TYPE i,
          lv_vmonat     TYPE string,
          lv_auftragsnr TYPE i,
          lv_verbrauch  TYPE i,
          lv_kosten     TYPE p DECIMALS 2,
          cv_preis      TYPE p DECIMALS 2 VALUE '0.29',
          lv_status     TYPE bool.

    METHODS: getVerbrauchsdaten IMPORTING iv_vmonat     TYPE string "xx.xx.xxxx
                                          iv_auftragsnr TYPE i
                                          iv_verbrauch  TYPE i
                                          iv_kosten     TYPE p
                                          iv_preis      TYPE p
                                          iv_status     TYPE bool.

    METHODS: berechnungPreisProMonat IMPORTING iv_verbrauch     TYPE i
                                               iv_preis         TYPE p
                                     RETURNING VALUE(rv_kosten) TYPE i. "Wieso geht p nicht?

    METHODS: statusBestaetigen IMPORTING iv_status TYPE bool.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_od_verbrauchsdaten IMPLEMENTATION.
  METHOD getverbrauchsdaten.

  ENDMETHOD.

  METHOD berechnungpreispromonat.

  ENDMETHOD.

  METHOD statusbestaetigen.

  ENDMETHOD.

ENDCLASS.
