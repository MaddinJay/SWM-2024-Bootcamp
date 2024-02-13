*&---------------------------------------------------------------------*
*& Report z_reportzuklasse_wiederholung
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_reportzuklasse_wiederholung.

SELECTION-SCREEN BEGIN OF BLOCK ausgabe WITH FRAME TITLE TEXT-001. "Geben Sie den Landescode ein
  PARAMETERS p_eing TYPE scustom-country. "Eingabe Landescode
SELECTION-SCREEN END OF BLOCK ausgabe.

DATA go_verbindung TYPE REF TO z_2wiederholung_selektion_tl.
go_verbindung = NEW #( iv_eing = p_eing ).
