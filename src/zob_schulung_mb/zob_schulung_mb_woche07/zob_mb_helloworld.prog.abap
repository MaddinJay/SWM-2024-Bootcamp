*&---------------------------------------------------------------------*
*& Report zob_mb_helloworld
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zob_mb_helloworld.



Data lv_result type string.


DATA go_hello type ref to zcl_mb_helloworld.
     go_hello = NEW #( ).

lv_result = go_hello->hello( ).

Data(lv_result2) = reverse( lv_result ).
write lv_result2.
