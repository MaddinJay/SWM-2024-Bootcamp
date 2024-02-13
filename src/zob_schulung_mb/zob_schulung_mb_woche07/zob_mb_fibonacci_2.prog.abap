*&---------------------------------------------------------------------*
*& Report zob_mb_fibonacci_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_fibonacci_2.




DATA go_fibonacci type ref to zcl_mb_fibonacci.
     go_fibonacci = NEW #( ).

go_fibonacci->fibonacci(   ).
