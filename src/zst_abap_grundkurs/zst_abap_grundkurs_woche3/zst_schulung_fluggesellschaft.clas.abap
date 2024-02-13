CLASS zst_schulung_fluggesellschaft DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  Data: Name Type string,
        Kuerzel Type C LENGTH 2,
        Jahr Type d.

        METHODS: Flugplan_erstellen.
  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA: Gaeste Type i,
        personal Type i.

        Methods: Wartung_plan, Wartung, Sicherung, Recruiting.
ENDCLASS.




CLASS zst_schulung_fluggesellschaft IMPLEMENTATION.
  METHOD flugplan_erstellen.

  ENDMETHOD.

  METHOD recruiting.

  ENDMETHOD.

  METHOD sicherung.

  ENDMETHOD.

  METHOD wartung.

  ENDMETHOD.

  METHOD wartung_plan.

  ENDMETHOD.

ENDCLASS.
