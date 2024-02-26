*&---------------------------------------------------------------------*
*& Report zem_versuche
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_versuche.


Parameters: p_s5(4) type n.

SELECTION-SCREEN: Skip 1.

SELECTION-SCREEN BEGIN OF LINE.

    SELECTION-SCREEN PUSHBUTTON (30) start3 USER-COMMAND fc4.
    SELECTION-SCREEN: POSITION POS_LOW.
    PARAMETERS: p_stonr TYPE zstonr.
    PARAMETERS: p_s4 TYPE string.
  SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN: Skip 1.


  PARAMETERS: p_kdnr   TYPE zdb_sto24-stonr. "DEFAULT lv_stonr OBLIGATORY,
  PARAMETERS: p_grund TYPE zkommentar.
  PARAMETERS: p_kommi TYPE zkommentar,
              p_datum TYPE frmdatum DEFAULT sy-datum.


PARAMETERS: p_tech TYPE znachname.
PARAMETERS: p_stonr1 TYPE zstonr.

SELECTION-SCREEN begin of line.
SELECTION-SCREEN PUSHBUTTON (25) erfasse USER-COMMAND fc5.
selection-SCREEN end of line.

  INITIALIZATION.

 start3 = icon_call_blind_transfer && 'älteste neue Störung'.
 erfasse = icon_transfer && 'Störung erfassen'.

 at SELECTION-SCREEN.

Case sy-ucomm.

    When 'FC4'.

    Select single
    from zdb_sto24
    Fields
    Count( stonr ) as Anzahl
    Where nachname is Initial
    into @Data(lv_anzahl_sto).

      SELECT SINGLE
      FROM zdb_sto24
      FIELDS
      MAX( stonr )
            INTO @DATA(lv_stonr).

      SELECT SINGLE
      FROM zdb_sto24
      FIELDS
       MAX( stonr ) AS max,
       kommentar
      GROUP BY kommentar
      INTO @DATA(ls_komm).



      p_s5 = lv_anzahl_sto.

      p_s4 =  ls_komm-kommentar.

      p_stonr = ls_komm-max.


      When 'FC5'.
      DATA(lo_sto_erfassen) = NEW zmaf_class_sb(  ).

      lo_sto_erfassen->sto_erfassen( ip_kdnr = p_kdnr ip_sgrund = p_grund ip_kommi = p_kommi ip_datum = p_datum ip_tech = p_tech ).

      "message |Die Störung  wurde erfasst| type 'I'.
Endcase.
