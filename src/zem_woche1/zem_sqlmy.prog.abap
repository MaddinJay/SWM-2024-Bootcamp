*&---------------------------------------------------------------------*
*& Report zem_sqlmy
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_sqlmy.

*Data lt_tabelle like table of spfli.
*
*Select
*From spfli
*Fields *
*For all ENTRIES in @lt_tabelle
*WHERE carrid = @lt_tabelle-carrid
*Into Table @lt_tabelle.
*
*cl_demo_output=>display( lt_tabelle ).
*
*Select
*From spfli
*fields
*avg( fltime as dec( 10,0 ) ) as durch "durchschnitt einer Spalte ausgeben. 10,0 ganze Zahlen
*Into @Data(lt_tabelle1).
*
*cl_demo_output=>display( lt_tabelle1 ).
*
*Select
*From spfli
*fields
*sum( fltime ) as Summe " Summe einer Spalte 'lfltime' ausgeben.
*Into @Data(lt_tabelle2).
*
*cl_demo_output=>display( lt_tabelle2 ).



Select Single
from spfli
fields connid
INTO @dATA(ls_1).

cl_demo_output=>display( ls_1 ).
