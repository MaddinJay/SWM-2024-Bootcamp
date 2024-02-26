CLASS zcl_abfs_cl_emon DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    METHODS:
      get_info_vbdat_fuer_MA IMPORTING iv_knr TYPE zabfs_db_mon-kundennummer,
      get_Info_fuer_Kunde IMPORTING iv_knr TYPE zabfs_db_mon-kundennummer,
      get_dbkund IMPORTING iv_knr          TYPE zabfs_db_mon-kundennummer " Methode für Anzeige der Kundenstammdaten für MA aus zabfs_db_kund
                 RETURNING VALUE(rv_kunde) TYPE zabfs_db_kund,
      set_dbmon_best,
      set_dbmon " Import des Zählerstandes
        IMPORTING iv_knr  TYPE zabfs_db_mon-kundennummer
                  iv_znr  TYPE zabfs_db_mon-zaehlernummer
                  iv_zst  TYPE zabfs_db_mon-zaehlerstand
                  iv_date TYPE zabfs_db_mon-datum,
      get_hoechste_auftragsnr IMPORTING iv_knr  TYPE zabfs_db_mon-kundennummer, " Hier wird aus der zabfs_db_mon die höchste Auftragsnummer aller Kunden ausgelesen.
      verbrauchs_berechnung,
      get_dbmon IMPORTING iv_knr TYPE zabfs_db_mon-kundennummer,
      plausi_pruef. " Plausibilitätsprüfung, ob Zählerstand größer ist, als der letzte Zählerstand

  PRIVATE SECTION.
    DATA:
      ms_kunde                   TYPE zabfs_db_kund,
      mv_zst_neu                 TYPE i,
      mv_zst_alt                 TYPE i,
      ms_eintragkunde            TYPE zabfs_db_mon,
      mt_eintraegekunden         TYPE TABLE OF zabfs_db_mon,
      mt_info_fuer_kunde         TYPE TABLE OF zabfs_db_mon,
      mv_hoechste_auftragsnummer TYPE n length 10.

    CONSTANTS mc_preis_kwh TYPE p DECIMALS 2 VALUE '0.38'.


ENDCLASS.



CLASS zcl_abfs_cl_emon IMPLEMENTATION.
  METHOD set_dbmon.
    me->get_hoechste_auftragsnr( iv_knr ).

    INSERT INTO zabfs_db_mon VALUES @( VALUE
            #(
                kundennummer = iv_knr
                auftragsnummer = mv_hoechste_auftragsnummer + 1  " Hier wird die bisher höchste Auftragsnummer um eins erhöht.
                zaehlernummer = iv_znr
                zaehlerstand = iv_zst
                datum = iv_date
              )
              ).
    WRITE: 'Zählerstand erfasst!'.

  ENDMETHOD.

  METHOD get_hoechste_auftragsnr.
    SELECT
    FROM zabfs_db_mon
    FIELDS
      MAX( auftragsnummer )
    INTO @mv_hoechste_auftragsnummer.

  ENDMETHOD.

  METHOD verbrauchs_berechnung.

    mt_eintraegekunden[ 1 ]-verbrauch = mv_zst_neu - mv_zst_alt.
    mt_eintraegekunden[ 1 ]-preis = mc_preis_kwh * mt_eintraegekunden[ 1 ]-verbrauch.
*    cl_demo_output=>display( mt_eintraegekunden ).

  ENDMETHOD.

  METHOD get_dbmon.
    SELECT
    FROM zabfs_db_mon
    FIELDS *
    WHERE zabfs_db_mon~kundennummer = @iv_knr " AND zabfs_db_mon~zaehlernummer = @iv_znr
    INTO TABLE @mt_eintraegekunden.
    SORT mt_eintraegekunden DESCENDING BY datum.

  ENDMETHOD.

  METHOD plausi_pruef.
    mv_zst_neu = mt_eintraegekunden[ 1 ]-zaehlerstand. " mv_zst_neu ist der neuste, ungeprüfte Zählerstand.
    mv_zst_alt = mt_eintraegekunden[ 2 ]-zaehlerstand. " mv_zst_alt ist der neuste, geprüfte Zählerstand.

    IF mv_zst_neu > mv_zst_alt.
      mt_eintraegekunden[ 1 ]-bestaetigung = 'X'.
      me->verbrauchs_berechnung(  ).
      WRITE |Beim Kunden { mt_eintraegekunden[ 1 ]-kundennummer } wurde der Zählerstand { mv_zst_neu } erfolgreich geprüft.|.
      WRITE |Der Preis wurde berechnet.|.

    ELSE.
      WRITE |Beim Kunden { mt_eintraegekunden[ 1 ]-kundennummer } ist der Zählerstand { mv_zst_neu } unplausibel.|.
      WRITE |Bitte um Prüfung mit Kunde!|.
    ENDIF.

  ENDMETHOD.

  METHOD set_dbmon_best.
    ms_eintragkunde = mt_eintraegekunden[ 1 ].
    UPDATE zabfs_db_mon FROM ms_eintragkunde.
  ENDMETHOD.

  METHOD get_dbkund.

    SELECT
      FROM zabfs_db_kund
      FIELDS *
      WHERE  zabfs_db_kund~kundennummer = @iv_knr
    INTO @ms_kunde.
    ENDSELECT.
    rv_kunde = ms_kunde.

  ENDMETHOD.

  METHOD get_info_fuer_kunde.

    SELECT
      FROM zabfs_db_mon AS a
      LEFT JOIN zabfs_db_kund AS b
      ON a~kundennummer = b~kundennummer
      FIELDS
      a~kundennummer,
      b~vorname,
      b~nachname,
*      b~verbrauchsstelle,
*      b~telefon,
      a~auftragsnummer,
      a~zaehlernummer,
      a~zaehlerstand,
      a~verbrauch,
      a~preis,
      a~datum

      WHERE a~kundennummer = @iv_knr
      INTO TABLE @DATA(mt_info_fuer_kunde).
*    cl_demo_output=>display( mt_info_fuer_kunde ).

    DATA: o_salv TYPE REF TO cl_salv_table.

    cl_salv_table=>factory( IMPORTING
                              r_salv_table = o_salv
                            CHANGING
                              t_table      = mt_info_fuer_kunde ).
    DATA(lo_func) = o_salv->get_functions( ). " Get the instance of alv toolbal button
    lo_func->set_default( if_salv_c_bool_sap=>true ).
    o_salv->display( ).


  ENDMETHOD.

  METHOD get_info_vbdat_fuer_ma.
    SELECT
    FROM zabfs_db_mon
    FIELDS *
    WHERE zabfs_db_mon~kundennummer = @iv_knr " AND zabfs_db_mon~zaehlernummer = @iv_znr
    INTO TABLE @mt_info_fuer_kunde.
    SORT mt_info_fuer_kunde DESCENDING BY datum.
    cl_demo_output=>display( mt_info_fuer_kunde ).

  ENDMETHOD.

ENDCLASS.
