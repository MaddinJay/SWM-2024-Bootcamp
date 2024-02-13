*&---------------------------------------------------------------------*
*& Report zst_schulung_uebung_2911
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zst_schulung_uebung_2911.


*DATA ls_kunde TYPE scarr. "Option 1
*ls_kunde = VALUE #(       "Option 1
*DATA(ls_Kunde) = VALUE scustom( "Option 2
*                         id = 111
*                         Name = 'Medizinbuchverlag Thieme'
*                         Form = 'Firma'
*                         Street = 'Seerieder Straße 18'
*                         postcode = '81675'
*                         city = 'München'
*                         country = 'DE'
*                         telephone = '089 584 7955'
*                         custtype = 'B'
*                         email = 'info@medithi.de' ).
**INSERT scustom FROM ls_Kunde.
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Das hat nicht geklappt.'.
*ENDIF.
**********************************************************************
*Select Single
*from
*scustom
*Fields
* *
* Where id = 111
* into @Data(ls_Kunde).
*
* ls_kunde-street = 'Seerieder Straße 5'.
*
*Update scustom from ls_kunde.
*
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Das hat nicht geklappt.'.
*ENDIF.
**********************************************************************
*DELETE FROM scustom WHERE id = 111.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 1 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 1 - Das hat nicht geklappt.'.
*ENDIF.
**********************************************************************
*
*DATA(ls_reise) = VALUE stravelag(
*                         agencynum = 194
*                         Name = 'Flugspaß Thieme'
*                         Street = 'Seerieder Straße 18'
*                         postcode = '81675'
*                         city = 'München'
*                         country = 'DE'
*                         telephone = '089 584 7955'
*                         langu = 'DE'
*                         url = 'www.flythieme.de' ).
*MODIFY stravelag FROM ls_reise.
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Das hat nicht geklappt.'.
*ENDIF.
**********************************************************************
*Select Single
*from
*stravelag
*Fields
* *
* Where agencynum = '194'
* into @Data(ls_reise).
*
* ls_reise-street = 'Seerieder Straße 5'.
* ls_reise-langu = 'EN'.
**********************************************************************
*Update stravelag from ls_reise.
*
*IF sy-subrc = 0.
*  WRITE 'Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Das hat nicht geklappt.'.
*ENDIF.

*DATA ls_reise TYPE stravelag.
*ls_reise-agencynum = '194'.
*DELETE stravelag FROM ls_reise.
*IF sy-subrc = 0.
*  WRITE 'Delete Option 2 - Alles hat funktioniert!'.
*ELSE.
*  WRITE 'Delete Option 2 - Das hat nicht geklappt.'.
*ENDIF.

**********************************************************************

PARAMETERS: p_suche  TYPE scounter-carrid  OBLIGATORY,
P_suche3 type scounter-countnum,
            p_suche2 TYPE scounter-airport OBLIGATORY.

Select single
from
scounter
fields
countnum
Where carrid = @p_suche and airport = @p_suche2
into @data(ls_schalter).

cl_demo_output=>display( ls_schalter ).
