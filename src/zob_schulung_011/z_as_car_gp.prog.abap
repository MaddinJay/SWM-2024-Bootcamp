*&---------------------------------------------------------------------*
*& Report z_as_car_gp
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_as_car_gp.
TABLES zobas_t_car_011.

"Parameterfelder zur Eingabe der Inhalte (MUSSFELDER)
PARAMETERS:
  p_own_n  TYPE string.
*  p_own_ad TYPE string,
*  p_brand  TYPE string,
*  p_model  TYPE string,
*  p_year   TYPE n LENGTH 4,
*  p_kmch type zem_de_restkm,
*  p_last type zem_de_lastkm,
*  P_fahrg type zem_de_fahrgestell.
*
*
*START-OF-SELECTION.
*
*
*zob2_cl_car=>hinzfuegen( iv_brand = p_brand iv_model = p_model iv_year = p_year iv_restkm = p_kmch ).
*
*zob2_cl_car=>owner( iv_model = p_model iv_brand = p_brand iv_address = p_own_ad iv_name = p_own_n iv_kmlast = p_last iv_fahrg = p_fahrg ).
  "Methode aufgerufen und die Importparameter mit den Eingabeparametern gematcht

  "Überprüfen, ob das Hinzufügen der Inhalte erfolgreich war oder nicht

Start-of-SELECTION.

Data lo_1 type ref to zem_cl_check_car.

lo_1 = NEW #( iv_p_own_n = p_own_n ).

END-OF-SELECTION.
