CLASS zfd_cl_wdh_praxis DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_1,
             name      TYPE c LENGTH 25,
             country   TYPE c LENGTH 3,
             city      TYPE c LENGTH 25,
             street    TYPE c LENGTH 30,
             bookid    TYPE n LENGTH 8,
             customid  TYPE n LENGTH 8,
             loccuram  TYPE i,
             loccurkey TYPE c LENGTH 5,
             amount    TYPE i,
           END OF ty_1.

    DATA ms_struc TYPE ty_1.
    DATA mt_tabelle TYPE TABLE OF ty_1.
    METHODS: constructor IMPORTING iv_land TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zfd_cl_wdh_praxis IMPLEMENTATION.
  METHOD constructor.
    IF iv_land <> ''.
      SELECT
      FROM scustom AS a
      LEFT OUTER JOIN sbook AS b
      ON a~id = b~customid
      FIELDS
             a~name,
             a~country,
             a~city,
             a~street,
*             b~bookid,
             b~customid,
*             b~loccuram,
             b~loccurkey,
          SUM( b~loccuram ) AS amount
      WHERE country = @iv_land
      GROUP BY name, country, city, street, customid, loccurkey", loccuram
      ORDER BY country ASCENDING,
      city ASCENDING,
      street ASCENDING
      INTO CORRESPONDING FIELDS OF TABLE @mt_tabelle.

      cl_demo_output=>display( mt_tabelle ).
      LOOP AT mt_tabelle INTO ms_struc.
        WRITE: /  ms_struc-name, ms_struc-city, ms_struc-street,
        / ms_struc-bookid, ms_struc-loccurkey,
        / ms_struc-amount.
        CLEAR ms_struc.
      ENDLOOP.

    ELSE.

      SELECT
    FROM scustom
    FIELDS *
    ORDER BY country ASCENDING,
    city ASCENDING,
    street ASCENDING
      INTO CORRESPONDING FIELDS OF TABLE @mt_tabelle.

      cl_demo_output=>display( mt_tabelle ).

      LOOP AT mt_tabelle INTO ms_struc.
        WRITE: /  ms_struc-name, ms_struc-city, ms_struc-street,
        / ms_struc-bookid, ms_struc-loccuram, ms_struc-loccurkey.
        CLEAR ms_struc.
      ENDLOOP.


    ENDIF.



  ENDMETHOD.

ENDCLASS.
