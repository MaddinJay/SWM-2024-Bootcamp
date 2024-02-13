*&---------------------------------------------------------------------*
*& Report zem_dictionary
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_dictionary.

Select
From zem_db_car
inner join zem_db_owner on zem_db_car~brand = zem_db_owner~brand "and zem_db_car~model = zem_db_owner~model
Fields
zem_db_owner~owner_name,
zem_db_car~brand,
zem_db_car~model,
zem_db_car~jahr,
zem_db_owner~owner_address
into table @Data(lt_tabelle).

cl_demo_output=>display( lt_tabelle ).

Loop at lt_tabelle into Data(ls_struktur).
Write: '|', 'Besitzer:', ls_struktur-owner_name, 'Straße:', ls_struktur-owner_address, 'Automarke:', ls_struktur-brand, 'Automodel:', ls_struktur-model, 'Erscheinungsjahr:', ls_struktur-jahr, /.
Uline.
Endloop.
