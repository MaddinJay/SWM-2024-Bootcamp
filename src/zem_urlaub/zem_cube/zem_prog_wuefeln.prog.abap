*&---------------------------------------------------------------------*
*& Report zem_prog_wuefeln
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zem_prog_wuefeln.

SELECTION-SCREEN BEGIN OF BLOCK eingabe WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_auge1 TYPE string DEFAULT 'Rot'    OBLIGATORY,
              p_auge2 TYPE string DEFAULT 'Blau'   OBLIGATORY,
              p_auge3 TYPE string DEFAULT 'Hund'   OBLIGATORY,
              p_auge4 TYPE string DEFAULT 'Messer' OBLIGATORY.

SELECTION-SCREEN END OF BLOCK eingabe.

START-OF-SELECTION.

  DATA lv_erg TYPE string.
  DATA lv_erg_doku TYPE string.

  DATA(lo_cube) = NEW zem_class_cube_erg(  ).
  DATA(lo_erg) = NEW zem_class_spiel_doku(  ).

**********************************************************************
*Würfeln mit 4 seiten(Crazy..´n Würfel mit 4 Seiten) (namen für seiten/augen frei wählbar) - Klasse: ZEM_CLASS_CUBE_ERG - Methode: wuerfeln

  lo_cube->wuerfeln(  iv_auge1 = p_auge1
                      iv_auge2 = p_auge2
                      iv_auge3 = p_auge3
                      iv_auge4 = p_auge4 ).

**********************************************************************
*Ergebnis des Würfelspiels aus Klasse ZEM_CLASS_CUBE_ERG - Methode: get_erg

  lv_erg = lo_cube->get_erg(  ).

  WRITE: |{ lv_erg } gewinnt!|.

  ULINE.


**********************************************************************
* ++++++ JETZT KOMMT DER TEIL WO GESPIELT WERDEN KANN +++++++
**********************************************************************

**********************************************************************
* Verarbeitung und Ergebnis durch Optionalen Tipp - Ausgabe in ABAP-LISTE

SELECTION-SCREEN BEGIN OF BLOCK spiel WITH FRAME TITLE TEXT-002.

    PARAMETERS: p_spiel AS CHECKBOX.    """"""""""""

  SELECTION-SCREEN BEGIN OF BLOCK tip WITH FRAME.

    PARAMETERS: p_name TYPE string OBLIGATORY DEFAULT 'Dummy'.  """""""
    PARAMETERS: p_tip  TYPE string OBLIGATORY DEFAULT 'Rot'.   """""""

  SELECTION-SCREEN END OF BLOCK tip.

    IF p_spiel = abap_true.

      lo_erg->spieldoku2( iv_erg = lv_erg
                          iv_name = p_name
                          iv_tip = p_tip ).

      IF lv_erg = p_tip.

        WRITE: /, |{ p_name } hat richtig getippt.|. ULINE. SKIP.

      ELSE.
        WRITE: /, |{ p_name } hat falsch getippt.|. ULINE. SKIP.

      ENDIF.

    ENDIF.


**********************************************************************
* Dokumentation Tipp-Ergebnis in der Datenbank ZEM_RESULT
* + Anzeig Kopie der eingefügten bzw. geänderten Zeile
* Klasse ZEM_CLASS_SPIEL_DOKU

  SELECTION-SCREEN BEGIN OF BLOCK opt WITH FRAME TITLE TEXT-004.

      SELECTION-SCREEN BEGIN OF BLOCK doku WITH FRAME.

        PARAMETERS: p_doku AS CHECKBOX.  """"""""""""

      SELECTION-SCREEN END OF BLOCK doku.

      IF p_doku = abap_true AND p_spiel = abap_true.

        lv_erg_doku = lv_erg.

        lo_erg->dokumentieren( iv_erg = lv_erg_doku iv_name = p_name iv_tip = p_tip ).

      ELSEIF p_doku = abap_true.

        DATA(mm_kein_tip) = |Bitte aktivieren Sie die Tippfunktion wenn, dass Ergebnis dokumentiert werden soll|.
        MESSAGE mm_kein_tip TYPE 'I'.

        WRITE 'Dein Ergegbnis wurde nicht in der Datenbank dokumentiert'. ULine.

      ELSE.
        WRITE 'Das Ergegbnis wird nicht in der Datenbank dokumentiert'. Uline.

      ENDIF.

**********************************************************************
*Löschen eines Datensatzes...
*Spieler wird vollständig gelöscht, da er bei neuen Spiel aut. neu hinzugefügt wird


    SELECTION-SCREEN BEGIN OF BLOCK del WITH FRAME.

     PARAMETERS: p_delete AS CHECKBOX.   """""""""""

    SELECTION-SCREEN END OF BLOCK del.

 SELECTION-SCREEN END OF BLOCK opt.
SELECTION-SCREEN END OF BLOCK spiel.

  IF p_delete = abap_true.

    DELETE FROM zem_result WHERE spielername = p_name.

    IF sy-subrc = 0.
      ULINE. WRITE |{ p_name } wurde erfolgreich von der Datenbank entfernt.|.

      IF P_delete = abap_true AND sy-subrc = 4.
        DATA(mm_not_found) = |{ p_name } konnte nicht in der Datenbank gefunden werden|.
        MESSAGE mm_not_found TYPE 'I'.
      ENDIF.
    ENDIF.

  ENDIF.


**********************************************************************
**********************************************************************

**********************************************************************
*Andere Optionen für Würfenspiel. - 1. Funktionsbaustein FUBA (SE37)
*                                   2. Unterprogramm (Form)

**********************************************************************
* 1. Funktionbaustein - FUBA - SE37
**********************************************************************


      Call Function 'ZEM_FUBA_ZUFALL'
    Exporting
       iv_name1 = 'Grün'
       iv_name2 = 'Blau'
       iv_name3 = 'Rot'
       iv_name4 = 'Gelb'.


**********************************************************************
* 2. Unterprogramm (FORM)
**********************************************************************

Perform zem_form_zufall. "z.B. using p_name1 p_name2 p_name3 p_name4. //Falls Import = Using // Export: changing

Form zem_form_zufall. "z.B. using p_name1 p_name2 p_name3 p_name4. --- Falls Import = Using // Export: changing

DATA: BEGIN OF ls_struktur,
        name TYPE string,
      END OF ls_struktur.

DATA lt_tabelle LIKE TABLE OF ls_struktur.

DATA lv_name TYPE string.

DATA(lv_name1)   = 'Derya'.
DATA(lv_name2)   = 'Hülya'.
DATA(lv_name3)   = 'Aylin'.
DATA(lv_name4)   = 'Yildiz'.


DATA lv_count TYPE i.
lv_count = sy-uzeit+4(1) + sy-uzeit+3(1).


DO 30 TIMES.

  lt_tabelle = VALUE #( BASE lt_tabelle
                    ( name = lv_name1 )
                    ( name = lv_name2 )
                    ( name = lv_name3 )
                    ( name = lv_name4 ) ).
ENDDO.

READ TABLE lt_tabelle INDEX sy-uzeit+4(2) + lv_count INTO ls_struktur.

IF sy-subrc = 0.
  WRITE: /, |im Unterprogramm gewinnt { ls_struktur-name }|.

ELSE.

  WRITE: /, |Die 0 gewinnt, alle die getippt haben, verlieren|.

ENDIF.

Endform.
