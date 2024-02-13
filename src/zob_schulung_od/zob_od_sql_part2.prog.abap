*&---------------------------------------------------------------------*
*& Report zob_od_sql_part2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_od_sql_part2.
*select * from scustom where FORM not like ' '
*INTO TABLE @DATA(lt_tabelle).
*
*cl_demo_output=>display( lt_tabelle ).

*SELECT
*sb~carrid AS airlinecode,
*sb~connid AS flugnummer,
*sb~fldate AS flugdatum,
*sc~name AS Kundenname,
*sc~langu AS Sprache
*FROM sbook as sb INNER JOIN scustom as sc ON sb~customid = sc~id
*INTO TABLE @DATA(lt_flights)
*UP TO 20 ROWS.
*cl_demo_output=>display( lt_flights ).

*
*SELECT sp~carrid AS Airlinecode,
*sc~carrname AS Flugeselschaft,
*sp~fltime AS Flugzeit,
*sp~distance AS Flugstrecke
*     FROM spfli AS sp
*     LEFT OUTER JOIN scarr AS sc ON sp~carrid = sc~carrid
*WHERE sp~distance > 500
*GROUP BY sp~carrid, sc~carrname, sp~fltime, sp~distance
*ORDER BY sp~fltime DESCENDING
* INTO TABLE @DATA(lt_flights).
*cl_demo_output=>display( lt_flights ).


**Lufthansa
*
*SELECT sp~carrid AS Airlinecode,
*sc~carrname AS Flugeselschaft,
*sp~fltime AS Flugzeit,
*sp~distance AS Flugstrecke
*     FROM spfli AS sp
*     LEFT OUTER JOIN scarr AS sc ON sp~carrid = sc~carrid
*WHERE sp~FLTYPE = ' ' and sp~carrid ='LH'
*GROUP BY sp~carrid, sc~carrname, sp~fltime, sp~distance
*ORDER BY sp~fltime DESCENDING
* INTO TABLE @DATA(lt_flights).
*cl_demo_output=>display( lt_flights ).

*Linienflüge

*SELECT sp~carrid AS Airlinecode, sp~connid AS Linienflug, sp~fltype AS Typ,
*sc~carrname AS Flugeselschaft
*     FROM spfli AS sp
*     LEFT OUTER JOIN scarr AS sc ON sp~carrid = sc~carrid
*     WHERE sp~fltype = ' '
*GROUP BY sp~carrid, sp~connid, sc~carrname, sp~fltype
* INTO TABLE @DATA(lt_flights).
*cl_demo_output=>display( lt_flights ).

***********************************************************************
*Finden Sie die maximale Kapazität jeder Fluggesellschaft. Tabelle: SCARR, SFLIGHT
***********************************************************************

*SELECT
*max( sf~SEATSMAX ),
*max( sf~SEATSMAX_B ),
*max( sf~SEATSMAX_F )
*     FROM sflight AS sf
*     LEFT OUTER JOIN scarr AS sc ON sf~carrid = sc~carrid
**GROUP BY sf~carrid, sf~connid, sc~carrname
* INTO TABLE @DATA(lt_flights).
**cl_demo_output=>display( lt_flights ).



SELECT db_car~abrandt,
       db_car~amodel,
       db_car~prodyear,
       db_aowner~autobesitzer
     FROM zob_od_dtb_car AS db_car
     LEFT JOIN zob_od_dtb_owner AS db_aowner
     ON db_car~abrandt = db_aowner~abrandt
     and db_car~amodel = db_aowner~amodel

WHERE db_aowner~autobesitzer IS NOT NULL
GROUP BY db_car~abrandt, db_car~amodel, db_car~prodyear, db_aowner~autobesitzer
INTO TABLE @DATA(lt_auto).


cl_demo_output=>display( lt_auto ).
