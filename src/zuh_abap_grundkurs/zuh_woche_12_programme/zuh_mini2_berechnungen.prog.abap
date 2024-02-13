*&---------------------------------------------------------------------*
*& Report zuh_mini2_berechnungen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuh_mini2_berechnungen.


* Parameter eingaben *

Data: p_nach            type zmul_de_nachname,
      p_znr             TYPE zmul_de_znr,
            p_zst       TYPE zmul_de_zst,
            p_datum     TYPE zmul_de_abldat,
            p_kdnr      type zmul_de_kdnr.




p_nach = 'Riehmann'.

p_znr = 'DE9000012'.
p_zst = '38070.0'.
p_datum = '20240315'.
p_kdnr =  0000000001.


Data: ls_struktur type          zmul_db_zst,
      lt_tabelle  type table of zmul_db_zst,

      lv_status   type          zmul_de_status.

Data:  iv_jahr_verb type         i,
       iv_jahr      type         i,
       lv_vergleich type         p DECIMALS 2.


START-OF-SELECTION.
Data(lo_class1) = NEW z_mul_class1_miniprojekt( ).

lv_status = lo_class1->zst_pruefen( ip_kdnr      = p_kdnr
                                    ip_zaehlernr = p_znr
                                    ip_zaehlerst = p_zst
                                    ip_datum     = p_datum ).


Perform zmul_form_1plausi using lv_status p_datum p_zst p_znr p_kdnr.

Form zmul_form_1plausi using lv_status p_datum p_zst p_znr p_kdnr.

IF lv_status = 'P'.

ls_struktur-bearb_status = 'P'.
ls_struktur-ablesedatum  = p_datum.
ls_struktur-zaehlerstand = p_zst.
ls_struktur-zaehlernr    = p_znr.
ls_struktur-kundennr     = p_kdnr.

modify zmul_db_zst from ls_struktur.

Endif.

Endform.

START-OF-SELECTION.
Data(lo_class2) = NEW zem_class2_miniprojekt(  ).

lo_class2->anzeige_aktueller_verbrauch( ip_kdnr = p_kdnr ).

lo_class2->ermittlung_gesamtverbrauch( Importing rv_jahr = iv_jahr
                                                 rv_jahr_verb = iv_jahr_verb ).


Perform zmul_form_plausi2 using iv_jahr iv_jahr_verb.

Form zmul_form_plausi2 using iv_jahr iv_jahr_verb.

lv_vergleich = ( iv_jahr * 100 / iv_jahr_verb ) - 100.


If lv_vergleich > 25.

Write: |Abweichung zum Gesamtverbrauch nach neuer Ablesung|.
Write: |= + { lv_vergleich } %|. skip.
Write: |Bearbeitungsstatus wird auf W gesetzt. Bitte Kund*in informieren|.

ls_struktur-bearb_status = 'W'.
ls_struktur-ablesedatum  = p_datum.
ls_struktur-zaehlerstand = p_zst.
ls_struktur-zaehlernr    = p_znr.
ls_struktur-kundennr     = p_kdnr.

modify zmul_db_zst from ls_struktur.


Elseif lv_vergleich < 0.

ls_struktur-bearb_status = 'F'.
ls_struktur-ablesedatum  = p_datum.
ls_struktur-zaehlerstand = p_zst.
ls_struktur-zaehlernr    = p_znr.
ls_struktur-kundennr     = p_kdnr.

modify zmul_db_zst from ls_struktur.

Write: |Abweichung zum Gesamtverbrauch nach neuer Ablesung|.
Write: |= -{ lv_vergleich } %|. skip.
Write: |Der Bearbeitungsstatus wird auf Freigegebren gesetzt|.

Else.

ls_struktur-bearb_status = 'F'.
ls_struktur-ablesedatum  = p_datum.
ls_struktur-zaehlerstand = p_zst.
ls_struktur-zaehlernr    = p_znr.
ls_struktur-kundennr     = p_kdnr.

modify zmul_db_zst from ls_struktur.

Write / 'Der Zählerstand wurde freigegeben'.

Endif.

Endform.





*  Select
*From zmul_db_zst
*Fields
*Min( zaehlerstand ) as kleinster_zaehlerstand,
*max( zaehlerstand ) as hoechster_zaehlerstand,
*Min( ablesedatum ) as aeltestes_AblDatum,
*Max( ablesedatum ) as neuestes_AblDatum
*Where kundennr = @p_kdnr
*Into @Data(ls_minmax).
*
*Data lv_ges_verb type i.
*Data lv_ges_zeit type i.
*Data lv_verb_jahr type i.
*Data lv_verb_gw type zmul_de_gwantl.
*
*lv_ges_verb = ls_minmax-hoechster_zaehlerstand - ls_minmax-kleinster_zaehlerstand.
*
*lv_ges_zeit = ls_minmax-neuestes_abldatum - ls_minmax-aeltestes_abldatum.
*
*Write: |In { lv_ges_zeit } hast Du { lv_ges_verb } kWh verbraucht|.












*SELECT
*FROM zmul_db_kd
*FIELDS *
*INTO TABLE @DATA(lt_kunde).
*cl_demo_output=>display( lt_kunde ).
*
*SELECT
*FROM zmul_db_zst
*FIELDS *
*INTO TABLE @DATA(lt_zaehler).
*cl_demo_output=>display( lt_zaehler ).
*
*
*SELECT
*FROM zmul_DB_ZST AS zaehler
*LEFT JOIN zmul_DB_KD AS kunde
*ON zaehler~kundennr = kunde~kundennr
*FIELDS
*kunde~nachname AS name,
*kunde~vorname AS vorname,
*zaehler~zaehlernr AS zaehlernr,
*zaehler~zaehlerstand AS zaehlerst
*
**WHERE kunde~nachname = @p_name AND kunde~vorname = @p_vorname AND zaehler~zaehlernr = @p_zaehlernr
*ORDER BY zaehler~ablesedatum
*INTO TABLE @DATA(lt_eingabe).
*cl_demo_output=>display( lt_eingabe ).
*
*SELECT SINGLE
*FROM zmul_DB_ZST AS zaehler
*LEFT JOIN zmul_DB_KD AS kunde
*ON zaehler~kundennr = kunde~kundennr
*FIELDS
*kunde~nachname AS name,
*kunde~vorname AS vorname,
*zaehler~zaehlernr AS zaehlernr,
*zaehler~ablesedatum AS datum,
*zaehler~zaehlerstand AS zaehlerstand
*
*
**WHERE kunde~nachname = @p_name AND kunde~vorname = @p_vorname AND zaehler~zaehlernr = @p_zaehlernr
*
*INTO @DATA(ls_eingabe1).
*cl_demo_output=>display( ls_eingabe1 ).
*
*
**** Berechnungen Stimmigkeit
*
*IF p_zaehlerst < ls_eingabe1-zaehlerstand.
*  WRITE :/'Zählerstand zu niedrig, bitte überprüfen'.
*  EXIT.
*  IF p_zaehlerst > ls_eingabe1-zaehlerstand + 20000.
*    WRITE :/'Zählerstand zu hoch, bitte überprufen'.
*    EXIT.
*  ELSE.
** daten zur Tabelle hinzufügen
*    WRITE :/'Danke, Ihr Zählerstand wurde überprüft'.
*
*  ENDIF.
*ENDIF.
