*&---------------------------------------------------------------------*
*& Report z_fb_tag3_modular_uebung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_fb_tag3_modular_uebung.

FORM zob_fb_bigger USING  number_1 TYPE int1
                          number_2 TYPE int1
                          "lv_text  Type string

CHANGING result TYPE int1.

IF number_1 > number_2.
result = number_1.
ELSE.
result = number_2.
ENDIF.

ENDFORM.

*** Rufen Sie Ihr Unterprogramm auf und geben Sie das Ergebnis aus. ***

START-OF-SELECTION.
DATA: lv_result TYPE int1,
      number_1 Type int1 value 5,     "Festwert kann über Value mitgegeben werden*
      number_2 Type int1.

PERFORM zob_fb_bigger

USING number_1 2 "'SAP ABAP'         "USING nimmt alle variablen mit so wie oben definiert im FORM
                                    "unter USING Deklaration
CHANGING lv_result.

WRITE lv_result.
"WRITE lv_text.

*** Wenn Sie Perform über der Implementierung (FORM) schreiben können Sie START-OF-SELECTION weglassen. ***
