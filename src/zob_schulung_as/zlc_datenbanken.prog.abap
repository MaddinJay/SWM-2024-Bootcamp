*&---------------------------------------------------------------------*
*& Report ZLC_DATENBANKEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlc_datenbanken.

DATA: gt_spfli TYPE TABLE OF spfli, "TYPE TABLE OF -> Wir brauchen den Tabellentypen
      gs_spfli TYPE spfli.
PARAMETERS p_carrid TYPE spfli-carrid.

SELECT SINGLE * FROM spfli INTO gs_spfli WHERE carrid = 'LH'. "Bei SELECT SINGLE ist INTO Table (gt_spfli) nicht zulässig!
SELECT * FROM spfli INTO TABLE gt_spfli. "Selektiert alle Inhalte aus der Tabelle SPFLI in die Tabelle gt_spfli

IF sy-subrc <> 0.
WRITE 'FEHLER!!!'.
ELSE.
LOOP AT gt_spfli INTO gs_spfli.     "Erstellt einen Loop in der Tabelle gt_spfli in die Struktur gs_spfli
  WRITE: gs_spfli-cityfrom, gs_spfli-cityto, gs_spfli-distance, /.
ENDLOOP.
ENDIF.
