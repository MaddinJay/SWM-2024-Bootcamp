CLASS zfd_cl_members DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_string       TYPE String
                                   iv_trennzeichen TYPE string.
    METHODS: get_highest_ID.
    METHODS: setDB.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_string TYPE string.
    DATA mv_feld1 TYPE string. "DW, muss nicht global sein, wird nur in einer Methode verwendet
    DATA mv_feld2 TYPE string. "Dw, s.o.
    DATA mv_feld3 TYPE string. "Dw, s.o.
    DATA mv_feld4 TYPE string. "Dw, s.o.
    DATA gs_struc TYPE zfd_st_members.
    DATA mv_highest_id TYPE i.
    DATA mv_trennzeichen TYPE string. "DW, string ist ein etwas großer Typ für ein Trennzeichen char1 würde reichen
ENDCLASS.



CLASS zfd_cl_members IMPLEMENTATION.
  METHOD constructor.
  "DW, Kommentar fehlt, was macht die Methode
    mv_trennzeichen = iv_trennzeichen. " setzen der Import Variablen  als Klassen Variablen
    mv_string = iv_string.
    REPLACE ALL OCCURRENCES OF ` ` IN mv_string WITH ''. " Entfernen der Leerzeichen
    "DW, deine Lösung ist nicht falsch
    "DW, allerdings kann 'unnötige Leerzeichen' verschieden interpretiert werden
    "DW, hat eine Person zwei Vornamen, würde in deinem Fall dieser zusammengeschrieben in der Tabelle landen

    me->get_highest_id( ). "DW, würde ich an dieser Stelle nicht aufrufen
    "DW, Wenn du nochmal eine Klasse instanziierst, bevor du die setdb Methode aufrufst,
    "DW, haben beide Klassen die gleiche Nummer für die nächste freie Id
  ENDMETHOD.

  METHOD setdb.
  "DW, Kommentar fehlt, was macht die Methode
    SPLIT mv_string AT mv_trennzeichen INTO: mv_feld1 mv_feld2 mv_feld3 mv_feld4. " Split anhand des importierten  Trennzeichens
    "DW, einfacher gleich in die ds_struc schreiben -> ... INTO: gs_struc-name gs_struc-vorname ...
    "DW, dann kannst du dir die mv_-Felder sparen
    gs_struc-name = mv_feld1.  "Zuweisung in die Struktur.
    gs_struc-vorname = mv_feld2.
    gs_struc-ort = mv_feld3.
    gs_struc-eintritt = mv_feld4.
    gs_struc-id = mv_highest_id + 1. " Erhohen der ID um 1 -> DW, hier hätte ich jetzt die Methode get_highest_id/get_next_id aufgerufen

    INSERT zfd_members FROM gs_struc. " Schreiben in die DB Tab.
    IF sy-subrc = 0.
      WRITE: / 'Daten erfolgreich eingefügt'. "DW, Ausgaben sollten nicht in einer Methode erfolgen,
        "DW, stattdessen sollte ein Rückgabewert der Methode vom Programm interpretiert werden
    ELSE.
      WRITE: / 'Fehler beim Einfügen der Daten'.
    ENDIF.

  ENDMETHOD.

  METHOD get_highest_id.
  "DW, sehr schön kurze Methode
  "DW, gut wäre auch wenn du hier das + 1 schon drauf rechnest => get_next_id,
  "Dw, dann muss man sich an anderer Stelle keine Gedanken um das drauf addieren machen
    SELECT MAX( id ) FROM zfd_members INTO mv_highest_id. " Die höchste ID der DB Tab holen! -> DW, ist super als Methodenbeschreibung
  ENDMETHOD.

ENDCLASS.
