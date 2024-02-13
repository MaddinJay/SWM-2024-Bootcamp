*&---------------------------------------------------------------------*
*& Report zobas_t_car_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zobas_t_car_report.

PARAMETERS: p_brand TYPE zobas_t_car_011-brand,
            p_model TYPE zobas_t_car_011-model,
            p_jahr  TYPE zobas_t_car_011-jahr,
            p_owner TYPE zobas_t_owner011-owner_name,
            p_ownad TYPE zobas_t_owner011-owner_address.


START-OF-SELECTION.

  zobas_t_car=>carhinzufuegen( EXPORTING iv_brand = p_brand iv_model = p_model iv_jahr = p_jahr ).
  zobas_t_car=>ownerhinzufuegen( EXPORTING iv_owner_name = p_owner iv_owner_address = p_ownad iv_brand = p_brand iv_model = p_model ).

END-OF-SELECTION.
