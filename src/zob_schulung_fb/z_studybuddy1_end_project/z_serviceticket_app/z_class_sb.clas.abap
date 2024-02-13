CLASS z_class_sb DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: sto_erfassen       IMPORTING ip_kdnr TYPE zkdnr.

    METHODS: tech_zuweisen.


    METHODS: status_setzen.


    CLASS-METHODS sto_abrufen IMPORTING ip_kdnr TYPE zkdnr.




  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_class_sb IMPLEMENTATION.
  METHOD status_setzen.

  ENDMETHOD.

  METHOD sto_abrufen. "Daten werden entsprechend der Kundennummer erfolgreich abgerufen
    SELECT
    FROM zdb_sto24
    FIELDS *
    WHERE kundennr = @ip_kdnr
    INTO TABLE @DATA(lt_sto).
    cl_demo_output=>display( lt_sto ).

    IF sy-subrc = 0.
      WRITE 'Der Befehl war erfolgreich'.
    ELSE.
      WRITE 'Der Befehl war nicht(!) erfolgreich'.
    ENDIF.
  ENDMETHOD.

  METHOD sto_erfassen.




  ENDMETHOD.

  METHOD tech_zuweisen.

  ENDMETHOD.

ENDCLASS.
