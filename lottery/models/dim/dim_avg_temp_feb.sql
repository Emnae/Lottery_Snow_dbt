-- CTE to call the table

with raw_meteo as (
    select * from {{ source('ods_meteo', 'r_meteo')}})


-- Columns selection
select heure as time_of_day,
        round(avg(temperature)) as avg_temp
from raw_meteo
where left(date, 7) = '2013-02'
group by heure
order by heure