*&---------------------------------------------------------------------*
*& Report ZAS_OWNER_GP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_owner_gp.

"Parameterfelder zur Eingabe der Inhalte (MUSSFELDER)
PARAMETERS:
  p_own_n  TYPE string OBLIGATORY,
  p_own_ad TYPE string OBLIGATORY,
  p_brand  TYPE string OBLIGATORY,
  p_model  TYPE string OBLIGATORY,
  p_year   TYPE n LENGTH 4.

START-OF-SELECTION.
  zas_owner_klasse=>hinzfuegen( EXPORTING iv_owner_name = p_own_n iv_owner_address = p_own_ad iv_brand = p_brand iv_model = p_model ).
  "Methode aufgerufen und die Importparameter mit den Eingabeparametern gematcht
  zas_owner_klasse=>carhinzfuegen( EXPORTING iv_brand = p_brand iv_model = p_model iv_year = p_year ).
