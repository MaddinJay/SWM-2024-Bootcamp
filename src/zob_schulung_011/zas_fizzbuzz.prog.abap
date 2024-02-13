*&---------------------------------------------------------------------*
*& Report zas_fizzbuzz
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zas_fizzbuzz.

" Schreibe eine Funktion, die die Zahlen von 1 bis 100 zurückgibt. Manche Zahlen sollen dabei allerdings übersetzt werden:
" Für Vielfache von 3 gibt „Fizz“ aus.
" Für Vielfache von 5 gib „Buzz“ aus.
" Für Vielfache von 3 und 5 gib „FizzBuzz“ aus.

PARAMETERS p_wert TYPE i OBLIGATORY.

IF p_wert < 1 OR p_wert > 100.
  DATA(lv_message) = 'Bitte einen Wert zwischen 1 und 100 eingeben.'.
  MESSAGE lv_Message TYPE 'W' DISPLAY LIKE 'I'.
ENDIF.

DATA: p_erg3 TYPE i, p_erg5 TYPE i, p_do TYPE i, p_do3 TYPE i, p_do5 TYPE i.

p_erg3 = p_wert MOD 3.
p_erg5 = p_wert MOD 5.


IF p_erg3 = 0 AND p_erg5 = 0.
  WRITE 'fizzbuzz'.
ELSEIF p_erg5 = 0.
  WRITE 'buzz'.
ELSEIF p_erg3 = 0.
  WRITE 'fizz'.
ELSE.
  WRITE p_wert.
ENDIF.

ULINE.

" Erweitere den Report so, dass im Protokoll alle Zahlen von 1 bis „User-Eingabe“ untereinander angedruckt werden:

DO p_wert TIMES.
  p_do = sy-index.
  WRITE / p_do.
ENDDO.

ULINE.

" Erweitere den Report so, dass im Protokoll die konvertierten Zahlen angedruckt werden, wie in der Aufgabenstellung beschrieben (1, 2, FIZZ, …):

DO p_wert TIMES.
  p_do = sy-index.
  p_do3 = p_do MOD 3.
  p_do5 = p_do MOD 5.
  write /.
  IF p_do3 = 0 AND p_do5 = 0.
    WRITE: 'fizzbuzz'.
  ELSEIF p_do5 = 0.
    WRITE: 'buzz'.
  ELSEIF p_do3 = 0.
    WRITE: 'fizz'.
  ELSE.
    WRITE p_do.
  ENDIF.
ENDDO.
