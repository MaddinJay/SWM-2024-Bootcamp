*&---------------------------------------------------------------------*
*& Report zmini_projekt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmini_projekt.

TABLES sflight.

SELECTION-SCREEN BEGIN OF BLOCK Verbrauch WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_carrid TYPE sflight-carrid OBLIGATORY, "sflight-fldate wurde als Datentyp verwendet, damit Suchhilfe verwendet werden kann.
              p_flug   TYPE sflight-connid OBLIGATORY,
              p_datum  TYPE sflight-fldate OBLIGATORY.
SELECTION-SCREEN END OF BLOCK Verbrauch.


DATA(lo_zprojekt_klasse) = NEW zprojekt_klasse( iv_datum = p_datum iv_carrid = p_carrid iv_flug = p_flug ). "Importwerte können so nur für Constructor-Methode angegeben werden.
lo_zprojekt_klasse->ergebnis(  ). " -> ist Instanzmethode, => ist statische Methode


**********************************************************************
**Suchhilfe für Datum
**********************************************************************
AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_datum. "Grenzt Menge ein abhängig von der Benutzereingabe

  DATA: lt_return TYPE TABLE OF ddshretval, "Tabellen und Strukturen deklarieren
        ls_return TYPE ddshretval.
  DATA: lt_return2 TYPE STANDARD TABLE OF dynpread.

  lt_return2 = VALUE #( ( fieldname = 'P_FLUG' ) ( fieldname = 'P_CARRID' ) ). "lt_return2 eine VALUE einfügen

  CALL FUNCTION 'DYNP_VALUES_READ' "Liest Werte aus einem Selektionsbild
    EXPORTING
      dyname     = sy-cprog "Aktuelles Programm
      dynumb     = sy-dynnr "Aktuelle Dynpro-Nummer
    TABLES
      dynpfields = lt_return2. "Importiert Tabelle, ändert sie und exportiert sie


  DATA: lv_carrid TYPE sflight-carrid, "Variablen deklarieren
        lv_flug   TYPE sflight-connid.

  lv_carrid = lt_return2[ fieldname = 'P_CARRID' ]-fieldvalue. "Variablen eine fieldvalue geben / Variable wird eine Spalte aus der Tabelle lt_return2 als Value gegeben
  lv_flug = lt_return2[ fieldname = 'P_FLUG' ]-fieldvalue.

  IF lv_carrid IS INITIAL AND lv_flug IS INITIAL. " If-Befehl für alle möglichen Fälle.
    SELECT fldate FROM sflight INTO TABLE @DATA(lt_sflight).
  ELSEIF lv_flug IS INITIAL.
    SELECT fldate FROM sflight WHERE carrid = @lv_carrid INTO TABLE @lt_sflight.
  ELSEIF lv_carrid IS INITIAL.
    SELECT fldate FROM sflight WHERE connid = @lv_flug INTO TABLE @lt_sflight.
  ELSE.
    SELECT fldate FROM sflight WHERE carrid = @lv_carrid AND connid = @lv_flug INTO TABLE @lt_sflight.
  ENDIF.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST' "Baustein für VALUE-Help-Fenster befüllen
    EXPORTING
      retfield        = 'FLDATE'
      value_org       = 'S'
    TABLES
      value_tab       = lt_sflight
      return_tab      = lt_return
    EXCEPTIONS
      parameter_error = 1
      no_values_found = 2
      OTHERS          = 3.

  READ TABLE lt_return INTO ls_return INDEX 1. "Zeile Nummer 1 wird aus der Tabelle in die Struktur ausgelesen.
  p_datum = |{ ls_return-fieldval+6(4) }{ ls_return-fieldval(2) }{ ls_return-fieldval+3(2) }|. "ls_return-fieldval ist eine Zeile aus der Tabelle und fieldval die Spalte. Wir nehmen variable, gehen 6 zeichen nach rechts und nehmen die ersten 4 Zeichen
