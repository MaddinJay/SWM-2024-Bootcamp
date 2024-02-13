*Erstellt eine neue Instanz-Klasse (besteht nur aus Instanz-Attributen und -Methoden).
*Diese enthält: Ein Attribut "gs_owner", dies ist eine Struktur des Typen der OWNER_Tabelle. Eine Konstruktormethode
*welche den Namen des Besitzers übermittelt bekommt. Der Konstruktor ermittelt den entsprechenden Eintrag des Besitzers
*aus der OWNER Tabelle und schreibt diesen in gs_owner.

**********************************************************************
*Eine Methode welcher das Auto prüft. Dafür muss zuerst die km Zahl bis zur nächsten Reparatur ermittelt werden.
*Das Modell des Autos liest die Methode aus der gs_owner. Sollte die km Zahl des Autos die km zur nächsten Reparatur
*erreicht oder überschritten haben, wird das Auto repariert.
*Eine Methode zum reparieren des Autos, die Methode setzt die km Zahl der letzten Reparatur auf 0.
*Ruft die neue Klasse auf. Übergebt ihr einen Besitzer und prüft das Auto.
*Hinweis: es macht Sinn die km Zahlen der letzten Reparatur der Tabelle abzuändern.

*6. Klassen Erben:
*Erstellt eine neu Klasse ZOB#_CL_CHECK1_CAR.
*Diese Klasse erbt von der Klasse ZOB#_CL_CHECK_CAR.
*Als 1st Class Besitzer wird ein Auto welches repariert werden muss, nicht repariert, sondern stattdessen ersetzt.
*Zusätzlich wird das alte Auto abgeholt und das neue Auto zum Besitzer gefahren.
*Redefiniert die Methode zum reparieren des Autos.
*Ändert die Fahrgestellnummer des Besitzers und setzt die km Zahl der letzten Reparatur auf 1.
*Zusatz:
*Redefiniert die Methode zum Prüfen des Autos.
*Immer wenn eine Auto geprüft wird, werden zusätzlich die km Stände (km seit letzter Reparatur) aller anderen Autos um 100 erhöht.
*Hinweis: Mit super->Methodennamen( Parameter der Methode) kann man die Muttermethode aufrufen.



CLASS zaw_cl_check_car DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor IMPORTING iv_sname TYPE zaw_de_owner_name
                                  iv_fname TYPE zaw_de_owner_name.

    METHODS carcheck.
    METHODS reparieren.


  PROTECTED SECTION.
    DATA gs_owner TYPE zaw_t_owner.

  PRIVATE SECTION.
ENDCLASS.


CLASS zaw_cl_check_car IMPLEMENTATION.

  METHOD constructor.

    SELECT SINGLE
    FROM zaw_t_owner
    FIELDS
    *
    WHERE owner_name = @iv_sname AND owner_firstname = @iv_fname
    INTO @DATA(gs_owner).

    cl_demo_output=>display( gs_owner ).

  ENDMETHOD.

  METHOD carcheck.

    SELECT SINGLE
    FROM zaw_t_car
    FIELDS
    nextcheck
    WHERE brand = @gs_owner-brand AND model = @gs_owner-model
    INTO @DATA(lv_next) .

    WRITE: lv_next.

    IF gs_owner-lastcheck >= lv_next.
      reparieren(  ).
    ENDIF.

  ENDMETHOD.

  METHOD reparieren.
    UPDATE
    zaw_t_owner
    SET lastcheck = 0
    WHERE owner_name = @gs_owner-owner_name AND owner_firstname = @gs_owner-owner_firstname.

    IF sy-subrc = 0.

      WRITE: 'Kilometerstand nach Reparatur auf Null gesetzt.'.

    ELSE.
      WRITE: 'Keine Reparatur erforderlich.'.

    ENDIF.
  ENDMETHOD.

ENDCLASS.
