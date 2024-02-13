*&---------------------------------------------------------------------*
*& Report ZHELLOWORLD
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHELLOWORLD.

    FROM tabelle1 AS tab2
    INNER JOIN tabelle2 AS tab1
        ON tab1 = tab2
    FIELDS
        tab2~spalt1,
        tab3~spalte1
    INTO TABLE @DATA(lt_join_specific).

cl_demo_output=>display( lt_join_specific ).
