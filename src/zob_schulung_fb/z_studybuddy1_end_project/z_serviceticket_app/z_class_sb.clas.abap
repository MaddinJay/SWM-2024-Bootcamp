CLASS z_class_sb DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: sto_erfassen       IMPORTING ip_kdnr   TYPE zkdnr
                                          ip_sgrund TYPE zkommentar
                                          ip_kommi  TYPE zkommentar
                                          ip_datum  TYPE frmdatum.

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

    DATA lt_sto24 TYPE TABLE OF zdb_sto24.

    DATA ls_sto24 TYPE zdb_sto24.
*    lt_sto24 = VALUE #( BASE lt_sto24 ( kundennr = ip_kdnr sto_grund = ip_sgrund kommentar = ip_kommi datum = ip_datum ) ).
    ls_sto24-kundennr = ip_kdnr.
    ls_sto24-sto_grund = ip_sgrund.
    ls_sto24-kommentar = ip_kommi.
    ls_sto24-datum = ip_datum.
    MODIFY zdb_sto24 FROM ls_sto24.


  ENDMETHOD.

  METHOD tech_zuweisen.

  ENDMETHOD.

ENDCLASS.
