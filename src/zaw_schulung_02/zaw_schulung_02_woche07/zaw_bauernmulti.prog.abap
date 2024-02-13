*&---------------------------------------------------------------------*
*& Report zaw_bauernmulti
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*Der Algorithmus der sogenannten Russischen Bauernmultiplikation verläuft wie folgt: man halbiert die linke der beiden Zahlen so lange,
*bis die 1 erreicht ist. Nachkommastellen werden abgerundet. Die rechte Zahl wird jeweils daneben geschrieben und verdoppelt.
*Von den rechten Zahlen werden alle gestrichen, neben denen links eine gerade Zahl steht.
*Die verbleibenden nicht gestrichenen Zahlen der rechten Seite werden dann addiert und bilden das Ergebnis der Multiplikation.
*Beispiel:
*23               84
*11              168
* 5              336
* 2             (672)
* 1            1.344
*--------------------
*              1.974

REPORT zaw_bauernmulti.

PARAMETERS: p_x TYPE p DECIMALS 0,
            p_y TYPE p DECIMALS 0.

DATA: lv_x     TYPE p DECIMALS 0,
      lv_y     TYPE p DECIMALS 0,
      lv_final TYPE p DECIMALS 0.

lv_x = p_x.
lv_y = p_y.

WRITE: lv_x, lv_y.

ULINE.

WHILE lv_x > 0.

  IF lv_x MOD 2 = 0.

    "Wert soll in dem Fall nicht verwendet werden"

  ELSE.

    lv_final = lv_final + lv_y.

  ENDIF.

  lv_x = floor( lv_x DIV 2 ).
  lv_y = floor( lv_y * 2 ).

  IF lv_x > 0.
    WRITE: / lv_x, lv_y.
  ENDIF.

ENDWHILE.

ULINE.

WRITE: / |Ergebnis: { lv_final }|.
