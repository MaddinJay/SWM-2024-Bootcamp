*&---------------------------------------------------------------------*
*& Report zst_pruefung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_pruefung.

SELECTION-SCREEN BEGIN OF BLOCK abc.
  PARAMETERS: p_knr    TYPE z02_t_edm-kundennummer OBLIGATORY,
              p_auftr  TYPE z02_t_edm-auftragsnummer OBLIGATORY,
              p_vorna  TYPE z02_t_edm-vorname OBLIGATORY,
              p_nachna TYPE z02_t_edm-nachname OBLIGATORY,
              p_tel    TYPE z02_t_edm-telefonnummer OBLIGATORY,
              p_email  TYPE z02_t_edm-email OBLIGATORY,
              p_datum  TYPE z02_t_edm-datum DEFAULT sy-datum OBLIGATORY,
              p_zst    TYPE z02_t_edm-zst OBLIGATORY,
              p_aprs   TYPE z02_t_edm-arbeitspreis OBLIGATORY DEFAULT '33.77' MODIF ID sp1.
SELECTION-SCREEN END OF BLOCK abc.

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF screen-Group1 = 'SP1'.
      screen-input = '0'.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.


START-OF-SELECTION.                         "Muss nach AT SELECTION-SCREEN OUTPUT hingeschrieben werden, damit das Programm danach startet
  INSERT INTO z02_t_edm VALUES @(  VALUE
           #( kundennummer = p_knr
              auftragsnummer = p_auftr
              vorname = p_vorna
              nachname = p_nachna
              telefonnummer = p_tel
              email = p_email
              datum = p_datum
              zst = p_zst
              arbeitspreis = p_aprs ) ).

IF sy-subrc = 0.
DATA(lv_message) = |Der Zählerstand { p_zst } kWh wurde erfolgreich übermittelt!|.
Message lv_message TYPE 'I'.
  ELSE.
  DATA(lv_message2) = |Der Zählerstand { p_zst } kWh ist bereits vorhanden!|.
Message lv_message2 TYPE 'W'.
  ENDIF.

START-OF-SELECTION.

  TYPE-POOLS:slis.

  DATA go_alv type ref to cl_salv_table.


  SELECT
  FROM z02_t_edm
  FIELDS *
*  WHERE
*  kundennummer = @p_knr AND auftragsnummer = @p_auftr
  INTO TABLE @DATA(lt_energie).

cl_salv_table=>factory( IMPORTING r_salv_table = go_alv
                                        CHANGING  t_table      = lt_energie ).

go_alv->display( ).
