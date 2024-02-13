*&---------------------------------------------------------------------*
*& Report zob_od_unterprogramm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_unterprogramm.
*FORM bigger_nummber USING zahl1 TYPE int1
*                          zahl2 TYPE int1
*      CHANGING result TYPE int1.
*
*  IF Zahl1 > zahl2.
*    result = zahl1.
*  ELSE.
*    result = zahl2.
*  ENDIF.
*
*ENDFORM.
*
*START-OF-SELECTION.




*  DATA: lv_result TYPE int1.
*  PERFORM bigger_nummber USING 5 1 CHANGING lv_result.
*  WRITE lv_result.

*START-OF-SELECTION.
*DATA: lv_result TYPE int4.
*
*      CALL FUNCTION 'Z_OD_POTENZRECHNER'
*      EXPORTING
*      ip_basis = 2
*      ip_exponent = 2
*      IMPORTING
*      ep_result = lv_result.
*      WRITE lv_result.

*DATA: fibonacci_sumand1 TYPE i.
*DATA: fibonacci_sumand2 TYPE i.
*DATA: fibonacci_summe TYPE i.

*DATA: lv_result TYPE i.
*CALL FUNCTION 'Z_OD_FIBONACCI'
*  EXPORTING
*    fibonacci_sumand1 = 0
*    fibonacci_sumand2 = 1
*  IMPORTING
*    fibonacci_summe   = lv_result.
*WRITE lv_result.


*    TABLES KNA1, KNVK, VBAK

*PARAMETERS: p_knr type KUNNR.

SELECTION-SCREEN BEGIN OF BLOCK O WITH FRAME.
PARAMETERS p_gpname TYPE NAME1_GP OBLIGATORY LOWER CASE.
REPLACE ALL OCCURRENCES OF '*' IN p_gpname WITH '%'. "Sternchen Suchhilfe
SELECTION-SCREEN END OF BLOCK O.

START-OF-SELECTION.

SELECT
     k~KUNNR as Kundenummer,
     k~LAND1 as Land,
     k~NAME1 as Vorname,
     k~NAME2 as Name,
     k~ORT01 as Ort,
     k~STRAS as Strasse,
     kp~PARNR as Partnernummer,
     kp~NAMEV as Ansprechpartnervorname,
     kp~NAME1 as Ansprechpartnername,
     kp~ABTNR as Abteilung,
     v~VBELN as VDokumente

     FROM kna1 AS k
     INNER JOIN vbak AS v
     ON k~kunnr = v~kunnr
     INNER JOIN knvk AS kp
     ON k~kunnr = kp~kunnr
     where kp~name1 = @p_gpname
     INTO TABLE @DATA(t_result).


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    i_callback_program = sy-repid
  TABLES
    t_outtab           = t_result
  EXCEPTIONS
    program_error      = 1
    OTHERS             = 2.

IF sy-subrc = 0.
  write 'gut gemacht'." Handle the error accordingly
ENDIF.
