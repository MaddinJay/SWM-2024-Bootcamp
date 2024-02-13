*&---------------------------------------------------------------------*
*& Report zem_join
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_join.
**********************************************************************
*Tabelle SBOOK und SCUSTOM
*Wählen Sie die Spalten für Airline-Code, Flugverbindungsnummer, Flugdatum, Kundenname und Sprache aus.
*Geben Sie maximal 20 Einträge aus.

*Data lt_tabelle type sbook.
*Data lt_tabelle1 type scustom.

Select
From sbook as flugdaten
Inner Join scustom as fluggast
ON flugdaten~customid = fluggast~id
Fields
 flugdaten~carrid, flugdaten~connid, flugdaten~fldate,
      fluggast~name, fluggast~langu
into table @Data(lt_tabelle3)
Up to 20 Rows.

cl_demo_output=>display( lt_tabelle3 ).

**********************************************************************
*Tabelle: SFLIGHT SCARR
* Details aller Flüge und deren entsprechenden Fluggesellschaften aus den Tabellen SFLIGHT und SCARR.

*Select
*From sflight
*inner join  scarr
*on  sflight~carrid = scarr~carrid
*fields
*sflight~carrid, sflight~fldate, scarr~currcode
*into table @Data(lt_tabelle)
*Up to 10 Rows.
*
*cl_demo_output=>display( lt_tabelle ).

**********************************************************************
* Tabelle SPFLI SCARR
*Ausgabe der Fluggesellschaft-Kürzel und Fluggesellschaften-Ausgeschrieben

*
*Select
*From spfli
*inner join  scarr
*on  spfli~carrid = scarr~carrid
*fields
*spfli~carrid, scarr~carrname
*into table @Data(lt_tabelle)
*Up to 10 Rows.
*
*cl_demo_output=>display( lt_tabelle ).


**********************************************************************
*Tabelle SPFLI
*Ausgabe aller Lufthansaflüge ( carrid LH carrid Lufthansa)
*
*
*Select spfli~carrid, scarr~carrname
*From spfli
*Left OUTER JOIN scarr
*on spfli~carrid = scarr~carrid
*Where spfli~carrid = 'LH'      "carrname = 'Lufthansa'
*into table @Data(lt_tabelle2).
*
*cl_demo_output=>display( lt_tabelle2 ).

**********************************************************************
*Statt der Ausgeschriebenen Fluggesellschaft nur die IDs ausgeben

*Select
*From spfli
*right OUTER JOIN scarr
*on spfli~carrid = scarr~carrid
*FIELDS spfli~carrid
*Into TAble @Data(lt_tabelle3).
*
*cl_demo_output=>display( lt_tabelle3 ).

**********************************************************************



*Select
*From sflight
*Cross join scarr
*Fields
*max( seatsmax )
*Group by sflight~carrid
*into table @Data(lt_tabelle2).
*
*cl_demo_output=>display( lt_tabelle2 ).


**********************************************************************
*Tabelle scarr sflight
*maximale Kapazität pro Fluggesellschaft...hier nur für Economy

*Select
*From sflight
*right outer join scarr
*on sflight~carrid = scarr~carrid
*fields
*scarr~carrname,
*sum( seatsmax ) as sitze
*Group by scarr~carrname
*into TABLE @Data(lt_tabelle4).
*
*cl_demo_output=>display( lt_tabelle4 ).


**********************************************************************
*Tabelle: mara, markt  ...Kurztext der Materalien

*Select
*From mara
*INNER JOIN makt
*on mara~matnr = makt~matnr
*fields
*makt~maktx as Kurztext
*Into Table @Data(lt_tabelle5).
*
*cl_demo_output=>display( lt_tabelle5 ).

**********************************************************************
*Tabelle mara, makt, mbew
*Standardpreis und Materialnummern


*Select
*From mara
*inner join mbew
*on mara~matnr = mbew~matnr
*inner join makt
*on mara~matnr = makt~matnr
*Fields
*mbew~stprs as Standardpreis,
*makt~matnr as Materialnummer,
*makt~maktx as Kurztext
*Into Table @Data(lt_tabelle6).
*
*cl_demo_output=>display( lt_tabelle6 ).

**********************************************************************
* Tabelle mara, marc - Dokupflicht in KZDKZ


Select
From mara
Inner join marc
on mara~matnr = marc~matnr
fields
marc~kzdkz as Dokupflich,
mara~matnr as Materialnummer,
mara~aenam as Materialtext
Where kzdkz = 'X'
Into table @Data(lt_tabelle7).

cl_demo_output=>display( lt_tabelle7 ).
