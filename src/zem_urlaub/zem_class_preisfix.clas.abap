CLASS zem_class_preisfix DEFINITION
  PUBLIC
*INHERITING FROM zem_class_tarif

  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA mv_fixpreis TYPE p DECIMALS 3.

    Data lt_fixpreis type table of zem_fixpreis.


    METHODS fixerteil RETURNING VALUE(rv_fixpreis) TYPE zem_dt_centkwh.

    METHODS abgabe2 IMPORTING iv_verbrauch TYPE i
                    returning Value(lt_fixpreis) type zem_fixpreis.

    METHODS abgabe IMPORTING iv_verbrauch TYPE i.

  PRIVATE SECTION.

ENDCLASS.

CLASS zem_class_preisfix IMPLEMENTATION.

  METHOD fixerteil.

**********************************************************************
* Abruf der summe aller fixen Preisbestandteile...
* Wert wird von Klasse zem_class_tarif aufgenommen um Tarif zu ermitteln.

    SELECT SINGLE
    FROM zem_fixpreis
    FIELDS
    SUM( centkwh )
    INTO @DATA(mv_fixpreis).


    rv_fixpreis = mv_fixpreis.

  ENDMETHOD.

  METHOD abgabe2. "Variante 2 / ...Variante 1 = Methode "abgabe" (siehe unten)

**********************************************************************
*Ermittelt anhand abgerufener Daten und Verbrauch (Import) die abzuführenden Beträge aus fixen Preisbestandteile
**********************************************************************

*Variante 1.

**********************************************************************
* Zunächst werden nur Umlagen aufgerufen und über einen Loop ausgegegeben.
* Grund: es gibt mehrere Umlagen die eigens gruppiert werden sollen

    SELECT
    FROM zem_fixpreis
    FIELDS
    name,
    gesetz,
    centkwh
    WHERE preisid = 'UML'
    INTO TABLE @DATA(lt_umlage).


    DATA ev_abg_info TYPE string.
    DATA ev_umlage TYPE p DECIMALS 2.

    WRITE: /, 'Auflistung, der im Netto-Betrag enthaltenen Umlagen:'. ULINE.

    LOOP AT lt_umlage INTO DATA(ls_umlage).

      ev_umlage = ( ls_umlage-centkwh * iv_verbrauch ) / 100. "Data(LV_umlage) = ls_abgaben-centkwh + ls_abgaben-centkwh.
      ev_abg_info = |- { ls_umlage-name }: { ev_umlage } Euro lt. { ls_umlage-gesetz }|.

      WRITE: ev_abg_info, /.

    ENDLOOP.

    WRITE: /, 'Weitere Abgaben fixer verbrauchsabhängiger Preisbestandteile:'.
    ULINE.

**********************************************************************
* Hier werden ALLE relevanten Felder der fixen Preisbestandteile in eine interne Tabelle überführt.

    SELECT
    FROM zem_fixpreis
    FIELDS
    preisid,
    gesetz,
    centkwh
    INTO TABLE @DATA(lt_abgaben).

**********************************************************************
* Felder der verschiedenen PreisIDs werden einzeln ausgelesen und in eine interne Strucktur geschrieben

    READ TABLE lt_abgaben WITH KEY preisid = 'ABG' INTO DATA(ls_abgabe).

    DATA ev_abgabe TYPE p DECIMALS 2.
    ev_abgabe = ( ls_abgabe-centkwh * iv_verbrauch ) / 100.

    WRITE: /, |- Konzessionsagabe: { ev_abgabe } Euro lt. { ls_abgabe-gesetz }|.

**********************************************************************

    READ TABLE lt_abgaben WITH KEY preisid = 'STEU' INTO DATA(ls_stromsteuer).

    DATA ev_steuer TYPE p DECIMALS 2.
    ev_steuer = ( ls_stromsteuer-centkwh * iv_verbrauch ) / 100.
    WRITE: /, |- Stromsteuer:      { ev_steuer } Euro lt. { ls_stromsteuer-gesetz }|.


**********************************************************************
    READ TABLE lt_abgaben WITH KEY preisid = 'VNB' INTO DATA(ls_vnb).

    DATA ev_vnb TYPE p DECIMALS 2.
    ev_vnb = ( ls_vnb-centkwh * iv_verbrauch ) / 100.
    WRITE: /, |- AP Netzentgelt:   { ev_vnb } Euro lt. { ls_vnb-gesetz }|.


  ENDMETHOD.


  METHOD abgabe. "Variante 1 / Variante 2 = Methode "abgabe2" (siehe oben)

**********************************************************************
* Schreibt alle Felder zu den fixen Preisbestandteilen in einer interne Tabelle.
* Ausgabe: Loop über die Tabelle mit entprechenden Bedingungen zur Preis ID sollte
**********************************************************************

    SELECT
    FROM zem_fixpreis
    FIELDS *
    ORDER BY preisid
    INTO TABLE @DATA(lt_fixpreis).

    DATA ev_abg_info TYPE string.
    DATA ev_abgabe TYPE p DECIMALS 2.
    DATA ev_abgabe_sum TYPE p DECIMALS 2.

    SKIP 2.

    ULINE.
    WRITE: 'Informationen zu verbrauchsabhängigen Preisbestandteilen "nicht priviligierter Letztverbarucher"'.
    Write: |Die Euro-Beträge entsprechen den eingegebenen Verbrauch in Höhe von { iv_verbrauch } kwh:|.
    ULINE.

**********************************************************************


* Loop über Tablle. Ausgabe hängt von Preis ID ab.
* Abzuführende Beträge, anhand des Verbrauchs, werden in der internen Tabelle ergänzt und bei Ausführung angezeigt.

    LOOP AT lt_fixpreis INTO DATA(ls_abgabe).                          "Loop über Tabelle lt_fixpreis

      ev_abgabe     = ( ls_abgabe-centkwh * iv_verbrauch ) / 100.
      ev_abgabe_sum = ( ev_abgabe_sum + ev_abgabe ).

      IF ls_abgabe-preisid = 'UML'.                                    "Ausgabe hängt von Preis ID ab
        ev_abg_info = |{ ev_abgabe } Euro werden lt. { ls_abgabe-gesetz } der zu fördernden Maßnahme zugefügt.|.
        WRITE: / |{ ls_abgabe-name }-Umlage ({ ls_abgabe-centkwh } cent/kwh):|, / ev_abg_info, /.

        ls_abgabe-summebetrag = ev_abgabe.                             "ermittelter Betrag wird in Tabelle ergänzt
        modify lt_fixpreis from ls_abgabe.
        Modify zem_fixpreis from ls_abgabe.

      ELSEIF ls_abgabe-preisid = 'ABG'.
        ev_abg_info = |{ ev_abgabe } Euro werden lt.{ ls_abgabe-gesetz } von der Gemeinde erhoben.|.
        WRITE: / |Konzessionssabgabe ({ ls_abgabe-centkwh } cent/kwh):|, / ev_abg_info, /.

        ls_abgabe-summebetrag = ev_abgabe.
        modify lt_fixpreis from ls_abgabe.
        Modify zem_fixpreis from ls_abgabe.

      ELSEIF ls_abgabe-preisid = 'STEU'.
        ev_abg_info = |{ ev_abgabe } Euro fließen lt. { ls_abgabe-gesetz } in den Bundeshaushalt.|.
        WRITE: / |Stromsteuer ({ ls_abgabe-centkwh } cent/kwh):|, / ev_abg_info, /.

        ls_abgabe-summebetrag = ev_abgabe.
        modify lt_fixpreis from ls_abgabe.
        Modify zem_fixpreis from ls_abgabe.

      ELSEIF ls_abgabe-preisid = 'VNB'.
        ev_abg_info = |{ ev_abgabe } Euro betreffen behördlich genehmigte Netzentgelte lt. { ls_abgabe-gesetz } der SWM Infrastruktur.|.
        WRITE: / |verbrauchsabhängiges Netzentgelt ({ ls_abgabe-centkwh } cent/kwh):|, / ev_abg_info, /.

        ls_abgabe-summebetrag = ev_abgabe.
        modify lt_fixpreis from ls_abgabe.
        Modify zem_fixpreis from ls_abgabe.

      ENDIF.

    ENDLOOP.

cl_demo_output=>display( lt_fixpreis ).                         "Anzeige Tabelle mit ermittelten Beträge

**********************************************************************
*Summe der abzuführenden Beträge

    ULINE. WRITE 'Summe:'.

    WRITE:|Bei einem Verbrauch von { iv_verbrauch } kWh werden { ev_abgabe_sum } Euro auf "nicht priviligierten Letzverbraucher" umgelegt|.
    Uline.
    SKIP.

    WRITE: / |Weitere Informationen zur Verwaltung und Verwendung der Gelder stellt Ihnen u.a.|,
             |die BNA, das BMWK oder der BDEW zur Verfügung|.




  ENDMETHOD.



ENDCLASS.
