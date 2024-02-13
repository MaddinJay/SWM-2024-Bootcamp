*&---------------------------------------------------------------------*
*& Report ZEM_SPIELEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEM_SPIELEN.

DATA: lt_plattensammlung type table of ZEM_S_Plattensammlung,
      ls_inhalt type ZEM_S_Plattensammlung.

ls_inhalt-Interpret = 'Miles Davis'.
ls_inhalt-Album = 'Cookin with'.
APPEND ls_inhalt to lt_plattensammlung.

ls_inhalt-Interpret = 'John Coltrane'.
ls_inhalt-Album = 'my favorit things'.
INSERT ls_inhalt into lt_plattensammlung Index 1.

Loop at lt_plattensammlung INTO ls_inhalt.

  Write: /, ls_inhalt-Interpret, ',', ls_inhalt-Album, /.

Endloop.


CALL FUNCTION 'Z_EM_FUBA'
  EXPORTING
    iv_v          = 8.
* IMPORTING
*   EV_V2         =


TYPES: BEGIN OF ls_struktur,
  genre type string,
  instrument TYPE string,
  END OF ls_struktur.



  Data lt_tabelle type SORTED TABLE OF ls_struktur WITH UNIQUE KEY genre.
  Data gs_struktur type ls_struktur.


  gs_struktur-genre = 'Jazz'.
  gs_struktur-instrument = 'SAX'.
  INSERT gs_struktur into TABLE lt_tabelle.
*APPEND gs_struktur to lt_tabelle.
  Clear gs_struktur.



  gs_struktur-genre = 'Rock'.
  gs_struktur-instrument = 'Gitarre'.
INSERT gs_struktur INTO Table lt_tabelle.
*APPEND gs_struktur to lt_tabelle.
clear gs_struktur.


  gs_struktur-genre = 'Oboe'.
  gs_struktur-instrument = 'Klassik'.
  INSERT gs_struktur INTO Table lt_tabelle.
*APPEND gs_struktur to lt_tabelle.
  clear gs_struktur.




*LOOP AT LOOP AT lt_tabelle into gs_struktur.

*Write: /, 'Instrument:', gs_struktur-instrument, /.
*IF gs_struktur-instrument = 'SAX'.
*Write 'Ohho'.
*Else. Write 'Ohno'.
*ENDIF.*ENDLOOP.

Do 3 TImes.

Loop at  lt_tabelle into gs_struktur.

Case gs_struktur-instrument.
  WHEN 'Gitarre'.
   Write: /, gs_struktur-genre, '---', 'Gitarre war zuletzt im Speicher', /.
  WHEN 'SAX'.
    Write: /, gs_struktur-genre, '----','SAX war zuletzt im Speicher', /.
  WHEN Others.
    Write:  /, 'xxxxx', /.

   ENDcase.
Endloop.

Enddo.

Do 2 Times.
  Write: /, gs_struktur-instrument, gs_struktur-genre.
  Enddo.






          .
* :-) Programmabbruch... Wörter und Zahlen kann man nicht addieren
*Data lv_muc TYPE i value 2.
*data lv_mic TYPE string value 'hallo'.
*Data lv_moc type string.

*lv_moc = lv_muc + lv_mic.

*Write: lv_moc.
