select * from blinkit_data
select count(*) from blinkit_data
UPDATE blinkit_data
SET item_fat_content =
  CASE
    WHEN item_fat_content IN ('LF', 'low fat') THEN 'Low Fat'
    WHEN item_fat_content = 'reg' THEN 'Regular'
    ELSE item_fat_content
  END
# what changes is happen in data 

  select distinct (item_fat_content) from blinkit_data

  select cast (sum(sales)/1000000 as decimal(10,2)) as total_sales_millions
  from blinkit_data

  select cast(avg(sales) as decimal(10,1)) as avg_sales from blinkit_data 

  select count(*) as No_of_items from blinkit_data

  select cast(sum(sales)/1000000 as decimal (10,2)) as total_sales_millions
  from blinkit_data where Item_Fat_Content ='low fat'

  select cast(sum(sales)/1000000 as decimal (10,2)) as total_sales_millions
  from blinkit_data where Item_Type ='health and hygiene'

  select cast(avg(sales) as decimal(10,1)) as avg_sales
  from blinkit_data where Item_Type  ='health and hygiene'

  select count(*) as No_of_items from blinkit_data
  where Item_Type ='health and hygiene'

  select cast(avg(rating) as decimal(10,2)) as avg_rating from blinkit_data

select Item_Fat_Content,
        cast(sum(sales)/1000 as decimal (10,2)) as total_sales_thousands,
        cast(avg(sales) as decimal(10,1)) as avg_sales,
        count(*) as No_of_items,
        cast(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data 
group by item_fat_content
order by total_sales_thousands desc

select top 5 Item_Type,
        cast(sum(sales) as decimal (10,2)) as total_sales,
        cast(avg(sales) as decimal(10,1)) as avg_sales,
        count(*) as No_of_items,
        cast(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data 
group by item_type
order by total_sales desc

select outlet_location_type,
ISNULL([Low Fat],0) as Low_Fat,
ISNULL([Regular],0) as Regular
from 
(
select outlet_location_type,item_fat_content,
cast(sum(sales) as decimal (10,2)) as total_sales
from blinkit_data 
group by outlet_location_type,item_fat_content
) as sourcetable
pivot 
(
  sum(total_sales)
for item_fat_content in ([Low Fat],[Regular])
) as pivottable
order by outlet_location_type;

select outlet_establishment_year,
cast(sum(sales) as decimal (10,2)) as total_sales,
cast(avg(sales) as decimal(10,1)) as avg_sales,
count(*) as No_of_items,
cast(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by outlet_establishment_year
order by total_sales desc

select outlet_size ,
cast(sum(sales) as decimal(10,2)) as total_sales,
cast((sum(sales) *100.0/sum(sum(sales)) over ()) as decimal (10,2)) as sales_percentage
from blinkit_data
group by outlet_size
order by total_sales desc

select Outlet_Location_Type,
cast(sum(sales) as decimal (10,2)) as total_sales,
cast((sum(sales) *100.0/sum(sum(sales)) over ()) as decimal (10,2)) as sales_percentage,
cast(avg(sales) as decimal(10,1)) as avg_sales,
count(*) as No_of_items,
cast(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by Outlet_Location_Type
order by total_sales desc

select Outlet_Type,
cast(sum(sales) as decimal (10,2)) as total_sales,
cast((sum(sales) *100.0/sum(sum(sales)) over ()) as decimal (10,2)) as sales_percentage,
cast(avg(sales) as decimal(10,1)) as avg_sales,
count(*) as No_of_items,
cast(avg(rating) as decimal(10,2)) as avg_rating 
from blinkit_data
group by Outlet_Type
order by total_sales desc




