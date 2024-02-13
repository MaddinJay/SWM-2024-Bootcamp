*&---------------------------------------------------------------------*
*& Report z_efms_gesamt
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_efms_gesamt.

SELECTION-SCREEN begin of block rahmen with frame title text-001.
PARAMETERS: p_carrid TYPE sflight-carrid OBLIGATORY MODIF ID sc1,
            p_connid TYPE sflight-connid OBLIGATORY MODIF ID sc1,
            p_fldate TYPE sflight-fldate OBLIGATORY MODIF ID sc1.
Selection-screen end of block rahmen.

SELECTION-SCREEN begin of block rahmen2 with frame title text-002.
PARAMETERS: p_kosten as CHECKBOX USER-COMMAND ddd.
Selection-screen end of block rahmen2.

SELECTION-SCREEN begin of block rahmen3 with frame title text-003.
PARAMETERS p_literp type p decimals 2 MODIF ID sc2 DEFAULT '0.38'.
Selection-screen end of block rahmen3.

AT SELECTION-SCREEN OUTPUT.
  IF p_kosten EQ abap_true.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC2'.
        screen-active = 1.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ELSE.
    LOOP AT SCREEN.
      IF screen-group1 = 'SC2'.
        screen-active = 0.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDIF.

START-OF-SELECTION.

z_efms_class_treibstoffbedarf=>verbrauch( iv_connid = p_connid iv_carrid = p_carrid iv_fldate = p_fldate ).


if p_kosten = abap_true.
  z_efms_class_treibstoffbedarf=>tankkosten( p_literp ).
endif.
