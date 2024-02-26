CLASS zmaf_class_sb DEFINITION
  PUBLIC
  CREATE PUBLIC .
  PUBLIC SECTION.
    DATA ls_sto24 TYPE zdb_sto24.

    METHODS: sto_erfassen       IMPORTING ip_kdnr   TYPE zkdnr
                                          ip_sgrund TYPE zkommentar
                                          ip_kommi  TYPE zkommentar
                                          ip_datum  TYPE frmdatum
                                          ip_tech   TYPE znachname.

    METHODS: tech_zuweisen IMPORTING ip_tech  TYPE znachname
                                     ip_stonr TYPE zstonr.


    METHODS: status_erledigt IMPORTING ip_stonr TYPE zstonr. "Um manuell den Status auf erledigt setzen zu können


    METHODS: quick_complete IMPORTING ip_stonr2      TYPE zstonr
                            RETURNING VALUE(ep_tech) TYPE znachname.

    CLASS-METHODS sto_abrufen." IMPORTING ip_kdnr TYPE zkdnr.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zmaf_class_sb IMPLEMENTATION.
  METHOD status_erledigt.
    UPDATE zdb_sto24 SET bearb_status = 'ERLEDIGT' WHERE stonr = ip_stonr.   "status wird anhand des Import 'stonr' auf erledigt gesetzt.
  ENDMETHOD.

  METHOD sto_abrufen.
    SELECT
          FROM zdb_sto24  LEFT JOIN zdb_custom24 ON zdb_sto24~kundennr = zdb_custom24~kdnr

       FIELDS  zdb_sto24~stonr, zdb_sto24~sto_grund, zdb_sto24~kundennr, zdb_sto24~datum,
        zdb_sto24~uhrzeit, zdb_sto24~kommentar, zdb_sto24~nachname AS Techniker, zdb_sto24~bearb_status,
        zdb_custom24~vorname, zdb_custom24~nachname, zdb_custom24~kontakt, zdb_custom24~email


        INTO TABLE @DATA(lt_sto).

    TRY.
        DATA: lo_salv TYPE REF TO cl_salv_table.



        cl_salv_table=>factory( IMPORTING
                                  r_salv_table = lo_salv
                                CHANGING
                                  t_table      = lt_sto ).

        lo_salv->get_functions( )->set_all( abap_true ).                                                "Grundfunktionen
        lo_salv->get_display_settings(  )->set_list_header( 'Eingang Störungs-App' ).                   "Überschrift,..statt Report-Name
        lo_salv->get_display_settings(  )->set_striped_pattern( abap_true ).                            "Zebramuster
        lo_salv->get_selections(  )->set_selection_mode(  if_salv_c_selection_mode=>row_column ).       "Auswahlspalte
        lo_salv->get_sorts(  )->add_sort( columnname = 'STONR' sequence = if_salv_c_sort=>sort_down ).  "Absteigend nach der STONR sortieren
        lo_salv->get_columns(  )->set_optimize( abap_true ).                                            "Optimale Spaltenbreite, Abstand = Inhalt

        LOOP AT lo_salv->get_columns(  )->get(  ) ASSIGNING FIELD-SYMBOL(<c>).                          "Loop über alle Zeilen
          DATA(o_col) = <c>-r_column.

          IF <c>-columnname = 'STONR' OR <c>-columnname = 'KUNDENNR' OR <c>-columnname = 'DATUM'.       "je nach tech.Spaltennamen,
            o_col->set_alignment( if_salv_c_alignment=>centered ).                                      "wird ausrichtung bestimmt
          ENDIF.                                                                                             "left, centered, right

       If <c>-columnname = 'TECHNIKER'.
        o_col->set_short_text( |Techniker| ).                                                           "Angezeigter Spaltentext
        o_col->set_medium_text( | Techniker | ).
        o_col->set_long_text( |  Techniker | ).
      Endif.


        ENDLOOP.

        DATA(lo_func) = lo_salv->get_functions( ).
        lo_salv->display( ).                                                                             "Anzeige der ALV

      CATCH cx_salv_msg.
      CATCH cx_salv_existing.
      CATCH cx_salv_data_error.
      CATCH cx_salv_not_found.

    ENDTRY.
  ENDMETHOD.

  METHOD sto_erfassen.
    SELECT SINGLE
    FROM zdb_custom24
    FIELDS sperr_status, kontakt, email
    WHERE kdnr = @ip_kdnr
    INTO  @DATA(lt_sperrstatus).



    SELECT SINGLE
    FROM zdb_sto24
    FIELDS  MAX( stonr )
    INTO @DATA(lv_sto).

    lv_sto = lv_sto + 1.
    ls_sto24-kundennr = ip_kdnr.
    ls_sto24-sto_grund = ip_sgrund.
    ls_sto24-kommentar = ip_kommi.
    ls_sto24-datum = ip_datum.
    ls_sto24-uhrzeit = sy-uzeit + '3600'.
    ls_sto24-stonr = lv_sto.
    ls_sto24-nachname = ip_tech.

    "Automatische Prüfung, ob der Sperrstatus beim Kunden gesetzt ist oder nicht
    IF lt_sperrstatus-sperr_status = 'X' AND ip_sgrund = 'KEIN STROM'.
      DATA(lv_message) = |{ icon_locked }Der Zähler ist gesperrt. Bitte melden Sie sich über folgenden Kontakt beim Kunden: { lt_sperrstatus-kontakt } oder { lt_sperrstatus-email } |.
      MESSAGE lv_message TYPE 'I'.
      MESSAGE lv_message TYPE 'S'.

      ls_sto24-bearb_status = 'KUNDE INFORMIERT'.
      MODIFY zdb_sto24 FROM ls_sto24.
*      IF sy-subrc = 0.
*        WRITE 'Der Befehl MODIFY (Kunde informiert) war erfolgreich'.
*      ELSE.
*        WRITE 'Der Befehl MODIFY (Kunde informiert) war nicht(!) erfolgreich'.
*      ENDIF.

    ELSE.
      ls_sto24-bearb_status = 'NEU'.
      MODIFY zdb_sto24 FROM ls_sto24.

      DATA(lv_message2) = |{ icon_checked }Die Störung ist unter der Nummer { ls_sto24-stonr } erstellt! |.
      MESSAGE lv_message2 TYPE 'I'.

*      IF sy-subrc = 0.
*        WRITE 'Der Befehl MODIFY (Neu) war erfolgreich'.
*      ELSE.
*        WRITE 'Der Befehl MODIFY (Neu) war nicht(!) erfolgreich'.
*      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD tech_zuweisen.
    SELECT SINGLE
    FROM zdb_sto24
    FIELDS *
    WHERE stonr = @ip_stonr
    INTO @DATA(ls_sto24).

    ls_sto24-nachname = ip_tech.
    ls_sto24-bearb_status = 'IN BEARBEITUNG'.

    MODIFY zdb_sto24 FROM ls_sto24.


*    IF sy-subrc = 4.
*      DATA(lv_message3) = |{ icon_column_right }Die Störung konnte nicht zugewiesen werden.|.
*      MESSAGE lv_message3 TYPE 'I'.
*    ENDIF.
  ENDMETHOD.

  METHOD quick_complete.

**********************************************************************
* Hier können neue Vorgänge schnell nacheinander an verschiedene verfügbare Techniker verteilt werden
**********************************************************************

    SELECT SINGLE                             "Prüfen ob Techniker verfügbar ist
    FROM zdb_technik24
    FIELDS
    nachname
    WHERE v_status = 'X'
    INTO @DATA(lv_tech).

    IF sy-subrc = 4.
      MESSAGE |Es sind im Moment keine Techniker verfügbar!| TYPE 'I'.

    ELSE.

      SELECT SINGLE                               "Störung abrufen ....
         FROM zdb_sto24
         FIELDS *
         WHERE stonr = @ip_stonr2
         INTO @DATA(ls_sto24).                         ".....

      ls_sto24-nachname = lv_tech.
      ls_sto24-bearb_status = 'IN BEARBEITUNG'.

      MODIFY zdb_sto24 FROM ls_sto24.                "...und mit geänderten Status zurückmelden

      UPDATE zdb_technik24 SET v_status = ' ' WHERE nachname = lv_tech. "Techniker wird nach weiterleitung
      "auf "nicht verfügbar" gestellt.
    ENDIF.

    ep_tech = lv_tech.


  ENDMETHOD.

ENDCLASS.
