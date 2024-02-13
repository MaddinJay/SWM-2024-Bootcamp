*&---------------------------------------------------------------------*
*& Report z_tl_flug_verbrauch
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_tl_flug_verbrauch.
TABLES spfli. "Tabelle verbinden

START-OF-SELECTION.
  SELECTION-SCREEN BEGIN OF SCREEN 100 TITLE TEXT-001 AS WINDOW.
    PARAMETERS: p_flug TYPE spfli-connid OBLIGATORY.   "Bitte wählen Sie einen Flug aus
  SELECTION-SCREEN END OF SCREEN 100.

START-OF-SELECTION.
  CALL SELECTION-SCREEN 100 USING SELECTION-SET 100.

*  SELECT SINGLE
*  FROM
*  spfli
*  FIELDS   *
*  WHERE connid = @p_flug
*  INTO @DATA(ls_spfli).

  "Formel Verbrauch:
  "Verbrauch (in Litern) = Flugdistanz x (Flugzeug/Verbrauch pro km + Passagier/Verbrauch pro km && Gepäck/Verbrauch pro km => 0,036pro Passagier&Gepäck/km)
  DATA: BEGIN OF ls_spfli2,
          lv_verbrauch    TYPE p DECIMALS 2,
          lv_flugdistanz  TYPE spfli-distance,
          lv_verbrauch_km TYPE saplane-consum,
          lv_passagier    TYPE p DECIMALS 3 VALUE '0.036', "Wert von 2018Jahr--> Pro Passagier pro KM
        END OF ls_spfli2,
        lt_spfli2 LIKE TABLE OF ls_spfli2.

  READ TABLE lt_spfli2 INDEX 1 INTO ls_spfli2.
  "lv_gepaeck TYPE i. "braucht man das?
*  lv_verbrauch_km = lv_verbrauch_km DIV 100.


  SELECT
    FROM saplane
    JOIN sflight ON saplane~planetype = sflight~planetype
    JOIN spfli ON sflight~carrid = spfli~carrid
    FIELDS spfli~connid, spfli~carrid, saplane~consum
    WHERE spfli~connid = @p_flug
    INTO  TABLE @DATA(lt_spfli3).

    ls_spfli2-lv_verbrauch = ls_spfli2-lv_flugdistanz * 2.
    WRITE: 'Verbrauch dieses Fluges: ', ls_spfli2-lv_verbrauch.


*  IF sy-subrc = 0.
*    ls_spfli2-lv_verbrauch = ls_spfli2-lv_flugdistanz * ( ls_spfli2-lv_verbrauch_km + ls_spfli2-lv_passagier ).
*    WRITE: 'Verbrauch dieses Fluges: ', ls_spfli2-lv_verbrauch.
*  ENDIF.
