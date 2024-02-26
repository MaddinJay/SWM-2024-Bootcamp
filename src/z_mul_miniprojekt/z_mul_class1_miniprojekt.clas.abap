CLASS z_mul_class1_miniprojekt DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: zst_pruefen IMPORTING
                                   ip_zaehlernr     TYPE zmul_de_znr
                                   ip_zaehlerst     TYPE zmul_de_zst
                                   ip_datum         TYPE zmul_de_abldat
                                   ip_kdnr          TYPE zmul_de_kdnr

                         RETURNING VALUE(rv_status) TYPE zmul_de_status.


    METHODS: zst_plausi     IMPORTING iv_jahr                 TYPE i
                                      iv_jahr_verb            TYPE i

                            RETURNING VALUE(rv_plausi_status) TYPE zmul_de_status.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_mul_class1_miniprojekt IMPLEMENTATION.

  METHOD zst_pruefen.

*** Berechnungen Stimmigkeit


    DATA: lv_verb  TYPE i,
          lv_verb3 TYPE i,
          lv_zeit  TYPE i,
          lv_zeit3 TYPE i.



    SELECT
    FROM zmul_DB_ZST AS zaehler
    LEFT JOIN zmul_DB_KD AS kunde
    ON zaehler~kundennr = kunde~kundennr
    FIELDS
    kunde~nachname AS name,
    kunde~vorname AS vorname,
    zaehler~zaehlernr AS zaehlernr,
    zaehler~ablesedatum AS datum,
    zaehler~zaehlerstand AS zaehlerstand,
    zaehler~ist_verbrauch AS verbrauch,
    zaehler~ableseart AS Ableseart,
    zaehler~bearb_status as Status
    WHERE zaehler~kundennr = @ip_kdnr

    INTO TABLE @DATA(ls_eingabe1).
    cl_demo_output=>display( ls_eingabe1 ).

    SELECT
    FROM zmul_db_zst
    FIELDS
    zaehlerstand,
    ablesedatum,
    bearb_status
    WHERE Kundennr = @ip_kdnr
    ORDER BY ablesedatum DESCENDING
    INTO TABLE @DATA(lt_tabelle).

*cl_demo_output=>display( lt_tabelle ).

    READ TABLE lt_tabelle INDEX 1 INTO DATA(ls_struktur).
    READ TABLE lt_tabelle INDEX 2 INTO DATA(ls_struktur2).
    READ TABLE lt_tabelle INDEX 3 INTO DATA(ls_struktur3).

    lv_verb = ls_struktur-zaehlerstand - ls_struktur2-zaehlerstand.
    lv_zeit = ls_struktur-ablesedatum - ls_struktur2-ablesedatum.

    lv_verb3 = ls_struktur-zaehlerstand - ls_struktur3-zaehlerstand.
    lv_zeit3 = ls_struktur-ablesedatum - ls_struktur3-ablesedatum.


    IF ip_zaehlerst < ls_struktur2-zaehlerstand.
      DATA(lm_zuniedrig) = |Zählerstand { ip_zaehlerst } kWh ist niedriger als der letzte.|. ULINE.
      MESSAGE lm_zuniedrig TYPE 'I'.

      WRITE: |Der Zählerstand ist niedriger als der letzte.|, /.
      WRITE: |Er wird zu Dokumentationzwecken dennoch mit Bearbeitungsstatus W erfasst.|.
      WRITE: |Bitte über Report löschen, wenn Eingabe falsch war|. ULINE.

      rv_status = 'W'.

      EXIT.

    ELSEIF ip_zaehlerst > ls_struktur2-zaehlerstand.

      rv_status = 'P'.

     Exit.

    ENDIF.

  ENDMETHOD.


  METHOD zst_plausi.

**********************************************************************
*Vergleich Hochrechnung bis Ablesung // mit Hochrechnung mit Ablesung
**********************************************************************

    DATA lv_vergleich TYPE p DECIMALS 2.


    lv_vergleich = ( iv_jahr * 100 / iv_jahr_verb  ) - 100.


    IF lv_vergleich > 25.

      rv_plausi_status = 'W'.

      Uline.

      WRITE: / |Abweichung zum geschätzen Gesamtverbrauch nach neuer Ablesung:|.
      Uline.
      WRITE:    icon_red_light.
      WRITE:   |= + { lv_vergleich } %|. SKIP.
      Write:   |Der Zählerstand ist unplauibel.  |.
      Uline.
      WRITE:   |Er wird zu Dokumentationzwecken dennoch mit Bearbeitungsstatus W erfasst. |.




    ELSEIF lv_vergleich < 0.

      rv_plausi_status = 'F'.

      ULINE. ULINE.

      WRITE: / |Abweichung zum Gesamtverbrauch nach neuer Ablesung:|. SKIP.
      WRITE:   icon_green_light.
      WRITE:   |= { lv_vergleich } % (Energiespartip nicht akut)|.
      ULINE.
      WRITE:   |Der gem. Zählerstand ist plausibel. Der Bearbeitungsstatus wird auf F gesetzt|.
      ULINE.

    ELSE.

      rv_plausi_status = 'P'.

      ULINE.

      WRITE: / |Abweichung zum geschätzen Gesamtverbrauch nach neuer Ablesung|. Skip.
      WRITE:   icon_yellow_light.
      WRITE:   |= + { lv_vergleich } %. Potenzial zum Energiesparen|.
      Uline.
      WRITE:   |Der gem. Zählerstand ist plausibel. Bearbeitungsstatus wird auf F gesetzt|.
      ULINE.

    ENDIF.


  ENDMETHOD.

ENDCLASS.
