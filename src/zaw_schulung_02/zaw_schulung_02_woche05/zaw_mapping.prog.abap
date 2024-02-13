*&---------------------------------------------------------------------*
*& Report zaw_mapping
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zaw_mapping.

START-OF-SELECTION.

  PARAMETERS: p_gender TYPE int1 OBLIGATORY,
              p_langu  TYPE char1 OBLIGATORY.

if p_gender > 3 or p_gender < 1.
message |{ p_gender } ist nicht in Auswahl| type 'W' display like 'I'.
endif.

if p_langu <> 'D' or p_langu <> 'F' or p_langu <> 'E'.
message |{ p_gender } ist nicht in Auswahl| type 'W' display like 'I'.
endif.

  DATA go_mapping TYPE REF TO zas_mapping. "Deklarieren

  go_mapping = NEW #( ). "Instanziieren

  DATA(gv_gender) = go_mapping->map_gender( p_gender ).  " -> Wenn es nur einen Import-Parameter gibt, dann muss dieser nicht extra angegeben werden.
  DATA(gv_langu) = go_mapping->map_language( p_langu ). "Methodenaufruf

  WRITE: |Geschlecht: { gv_gender }|.
  WRITE: / |Sprache: { gv_langu }|.

END-OF-SELECTION.
