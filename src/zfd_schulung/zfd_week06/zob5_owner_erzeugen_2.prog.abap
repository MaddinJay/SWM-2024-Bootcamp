*&---------------------------------------------------------------------*
*& Report zob5_owner_erzeugen_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob5_owner_erzeugen_2.

Data go_owner type REF TO zob5_cl_check1_car.
go_owner = new #( 'ELVIN' ).
*go_owner->car_reparieren(  ).
go_owner->car_check(  ).
