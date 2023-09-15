-- CTE to call the table

with src_lottery as (
    select * from {{ ref('src_aid_to_education_NY')}})


-- Columns selection
select county, 
        start_fiscal_year, 
        end_fiscal_year,
        sum(aid_amount) as total_aid
from src_lottery
group by start_fiscal_year, end_fiscal_year, county
order by county, start_fiscal_year