SELECT count(*) FROM green_taxi_data gtd
where lpep_pickup_datetime between '2019-01-15' and '2019-01-15 23:59:59'
and lpep_dropoff_datetime between '2019-01-15' and '2019-01-15 23:59:59'
;

select * from green_taxi_data
where trip_distance  = (select max(trip_distance) from green_taxi_data);

select passenger_count, count(*)
from green_taxi_data gtd 
where
--lpep_pickup_datetime between '2019-01-01' and '2019-01-01 23:59:59'
--and lpep_dropoff_datetime between '2019-01-01' and '2019-01-01 23:59:59'
cast(lpep_pickup_datetime as date) = '2019-01-01'
and passenger_count in (2,3)
group by passenger_count;

select gtd.tip_amount 
, zones_p."Zone" as zone_p
, zones_do."Zone"
from green_taxi_data gtd 
join zones as zones_p
	on gtd."PULocationID" = zones_p."LocationID"
join zones as zones_do
	on gtd."DOLocationID" = zones_do."LocationID"
where zones_p."Zone" = 'Astoria'
order by gtd.tip_amount desc 
;
