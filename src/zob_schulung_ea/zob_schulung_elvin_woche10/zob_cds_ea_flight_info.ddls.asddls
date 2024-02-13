@AbapCatalog.sqlViewName: 'ZEA_FLIGHT_INFO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'FLIGHT_INFO'
define view ZOB_CDS_EA_FLIGHT_INFO as select from sflight
{
  key carrid as Carrid,
  key connid as Connid,
  key fldate as Fldate,
  price as Price,
  currency as Currency,
  planetype as Planetype,
 

        case
            when currency = 'EUR' then price
            else cast( price as abap.fltp ) * 0.85
        end
        as Price_euro,
   
   
     case
        when price < 500 then 'Low Cost'
        when price between 500 and 1000 then 'Medium Cost'
        else 'High Cost'
    end as Flight_Category 
       
      
    
}



