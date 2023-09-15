-- CTE to call the table in source.yml

with raw_lottery as (
    select * from {{ source('lot_data', 'lottery_aid_education')}})

-- Columns selection to exclude the one created by airbyte
-- Rename and transformation to a more cleaned format
-- , are visible in the view table as a result of an US/UK format

select BEGINNING_FISCAL_YEAR as start_fiscal_year,
       ENDING_FISCAL_YEAR as end_fiscal_year,
       SCHOOL_DISTRICT as school_district,
       " AMOUNT_OF_AID " as aid_amount,
        case
            when COUNTY = 'St Lawrence' THEN 'St. Lawrence'
            else COUNTY
        end as COUNTY
from raw_lottery