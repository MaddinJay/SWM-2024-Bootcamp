*&---------------------------------------------------------------------*
*& Report z_report_app
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_report_app.


PARAMETERS: p_kdnr   TYPE zkdnr OBLIGATORY,
            p_sgrund TYPE zkommentar OBLIGATORY,
            p_kommi  TYPE zkommentar,
            p_datum  TYPE frmdatum DEFAULT sy-datum OBLIGATORY.


DATA(lo_sto_erfassen) = NEW z_class_sb(  ).

lo_sto_erfassen->sto_erfassen( ip_kdnr = p_kdnr ).

z_class_sb=>sto_abrufen( ip_kdnr = p_kdnr ).
