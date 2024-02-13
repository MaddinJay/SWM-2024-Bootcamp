FUNCTION z_aw_kalkulator.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_KALK1) TYPE  I
*"     REFERENCE(IV_KALK2) TYPE  I
*"     REFERENCE(IV_KALK3) TYPE  C
*"  EXPORTING
*"     REFERENCE(EV_ERG) TYPE  I
*"  EXCEPTIONS
*"      NULLDIVISION
*"      OPERATOR_UNGUELTIG
*"----------------------------------------------------------------------

  CASE iv_kalk3. "Rechenoperation soll geprüft werden.
    WHEN '+'. "Additon
      ev_erg = iv_kalk1 + iv_kalk2.
    WHEN '-'. "Subtraktion
      ev_erg = iv_kalk1 - iv_kalk2.
    WHEN '*'. "Multiplikation
      ev_erg = iv_kalk1 * iv_kalk2.
    WHEN '/'. "Division
      IF iv_kalk2 = 0. "Wenn Divisor Null ist
        RAISE Nulldivision. "Ausnahme auslösen
      ELSE.
        ev_erg = iv_kalk1 / iv_kalk2.
      ENDIF.
    WHEN OTHERS. "Keins der Rechenzeichen wird verwendet
      RAISE operator_ungueltig. "Ausnahme auslösen
  ENDCASE.

WRITE: 'Ergebnis: ' , ev_erg.

ENDFUNCTION.
