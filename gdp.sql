use gdb023;

/*1. Provide the list of markets in which customer "Atliq Exclusive" operates its
business in the APAC region.*/
select* from dim_customer
where customer = 'Atliq Exclusive' and region = 'APAC';

/*2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/
select* from dim_product;
select* from fact_gross_price;
select* from fact_manufacturing_cost;

 select distinct d.product_code, fy.fiscal_year
    from dim_product as d
    inner join fact_gross_price as fy 
    on d.product_code = fy.product_code
    where fiscal_year = 2020;
   select distinct d.product_code, fy.fiscal_year
    from dim_product as d
    inner join fact_gross_price as fy 
    on d.product_code = fy.product_code
    where fiscal_year = 2021; 
    

with unique_products_2020 as (
    select distinct d.product_code, fy.fiscal_year
    from dim_product as d
    inner join fact_gross_price as fy 
    on d.product_code = fy.product_code
    where fiscal_year = 2020),
unique_products_2021 as (
    select distinct d.product_code, fy.fiscal_year
    from dim_product as d
    inner join fact_gross_price as fy 
    on d.product_code = fy.product_code
    where fiscal_year = 2021)
select(select count(*) from unique_products_2020) as unique_products_2020,(select count(*) FROM unique_products_2021) as unique_products_2021,
((select count(*) from unique_products_2021) - (select count(*) from unique_products_2020)) * 100.0 / (select count(*) from unique_products_2020) as percentage_chg;

/*3. Provide a report with all the unique product counts for each segment and
sort them in descending order of product counts. The final output contains
2fields,
segment
product_coun*/

select* from dim_product;
select* from fact_gross_price;
select* from fact_manufacturing_cost;

select segment,count(product) as product_count from dim_product
group by segment
order by product_count desc;

/*4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

select* from dim_product;
select* from fact_gross_price;
select* from fact_manufacturing_cost;

select d.segment,count(distinct d.product_code) as product_count_2021 
from dim_product as d
inner join fact_gross_price as fy 
on d.product_code = fy.product_code
where fiscal_year = 2020
group by d.segment;

select d.segment,count(distinct d.product_code) as product_count_2021 
from dim_product as d
inner join fact_gross_price as fy 
on d.product_code = fy.product_code
where fiscal_year = 2021
group by d.segment;

with unique_product_by_segment_2020 as(
select d.segment as a,count(distinct d.product_code) as product_count_2020 
from dim_product as d
inner join fact_gross_price as fy 
on d.product_code = fy.product_code
where fiscal_year = 2020
group by d.segment),
unique_product_by_segment_2021 as(
select d.segment as b,count(distinct d.product_code) as product_count_2021 
from dim_product as d
inner join fact_gross_price as fy 
on d.product_code = fy.product_code
where fiscal_year = 2021
group by d.segment)
select unique_product_by_segment_2020.a as segment, unique_product_by_segment_2020.product_count_2020 as product_20,
unique_product_by_segment_2021.product_count_2021 as product_21,(unique_product_by_segment_2021.product_count_2021 - unique_product_by_segment_2020.product_count_2020) 
as difference from unique_product_by_segment_2020,unique_product_by_segment_2021
where unique_product_by_segment_2020.a =unique_product_by_segment_2021.b;

/*5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost*/

select* from dim_product;
select* from fact_manufacturing_cost;

DELIMITER $$
 create procedure highest_manufacturing_cost()
 begin
 select f.product_code,d.product,f.manufacturing_cost from dim_product as d
 inner join fact_manufacturing_cost as f
 on f.product_code = d.product_code 
 order by manufacturing_cost desc;
 select f.product_code,d.product,f.manufacturing_cost from dim_product as d
 inner join fact_manufacturing_cost as f
 on f.product_code = d.product_code 
 order by manufacturing_cost asc;
 End $$ 
 
 call highest_manufacturing_cost(); 
 
/*6.Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage*/
select* from dim_customer;
select* from fact_pre_invoice_deductions;

select d.customer_code,d.customer,avg(f.pre_invoice_discount_pct) as average_discount_percentage 
from dim_customer as d
inner join fact_pre_invoice_deductions as f
on f.customer_code = d.customer_code 
where fiscal_year = 2021 
group by d.customer_code,d.customer
order by average_discount_percentage desc 
limit 5;

/*7. Get the complete report of the Gross sales amount for the customer
“Atliq Exclusive” for each month . This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/
select* from dim_customer;
select* from fact_gross_price;
select* from fact_sales_monthly;
/*example*/
select * from fact_sales_monthly
where fiscal_year = 2021;
select month(date),fiscal_year,sum(sold_quantity)* as sum_sold_quantity from fact_sales_monthly
group by month(date),fiscal_year
having fiscal_year = 2020;
select month(date),fiscal_year,sum(sold_quantity) as sum_sold_quantity from fact_sales_monthly
group by month(date),fiscal_year
having fiscal_year = 2021;

select d.customer,month(f.date) as date_month ,f.fiscal_year,sum(f.sold_quantity*fg.gross_price) as gross_sale_amount
from dim_customer as d
inner join fact_sales_monthly as f
on d.customer_code = f.customer_code
inner join fact_gross_price as fg
on f.product_code = fg.product_code
where customer = 'Atliq Exclusive' and f.fiscal_year = 2020
group by date_month,f.fiscal_year
order by gross_sale_amount desc;
/* 2020-2021*/
select d.customer,month(f.date) as date_month ,f.fiscal_year,sum(f.sold_quantity*fg.gross_price) as gross_sale_amount
from dim_customer as d
inner join fact_sales_monthly as f
on d.customer_code = f.customer_code
inner join fact_gross_price as fg
on f.product_code = fg.product_code
where customer = 'Atliq Exclusive' and f.fiscal_year = 2021
group by date_month,f.fiscal_year
order by gross_sale_amount desc;

/*8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity*/

select * from fact_sales_monthly;
select case
        when month(date) between 1 and 3 then 'Q1'
        when month(date) between 4 and 6 then 'Q2'
        when month(date) between 7 and 9 then  'Q3'
        when month(date) between 10 and 12 then 'Q4'
    end as Quarter,sum(sold_quantity) as total_sold_quantity from fact_sales_monthly
    where fiscal_year = 2020
     group by Quarter
     order by total_sold_quantity desc;

/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/

select* from dim_customer;
select* from fact_sales_monthly
select* from fact_gross_price;
select d.channel,round(sum(fg.gross_price*f.sold_quantity)/1000000,2) as gross_sales_mln
from dim_customer as d
inner join fact_sales_monthly as f
on d.customer_code = f.customer_code
inner join fact_gross_price as fg
on f.product_code = fg.product_code 
where fg.fiscal_year = 2021
group by d.channel
order by gross_sales_mln desc;

with gross_price as(
select d.channel,round(sum(fg.gross_price*f.sold_quantity)/1000000,2) as gross_sales_mln
from dim_customer as d
inner join fact_sales_monthly as f
on d.customer_code = f.customer_code
inner join fact_gross_price as fg
on f.product_code = fg.product_code 
where fg.fiscal_year = 2021
group by d.channel
order by gross_sales_mln desc)
select channel,gross_sales_mln,gross_sales_mln *100/total as percentage from ((select sum(gross_sales_mln) as total from gross_price) as i,
(select * from gross_price) as g)
order by percentage;

select* from dim_customer;
select* from fact_sales_monthly
select* from fact_gross_price;
/*10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
“Atliq product
total_sold_quantity
rank_order*/
select* from dim_product;
select* from fact_sales_monthly;

WITH Sales2021 AS (
    SELECT d.division,d.product_code,sum(fs.sold_quantity) as total_sold_quantity from dim_product as d
    inner join fact_sales_monthly as fs
    on d.product_code = fs.product_code
    where fs.fiscal_year = 2021
    group by d.division, d.product_code),
RankedSales as (
select division,product_code,total_sold_quantity,rank() over (partition by division order by total_sold_quantity desc) as rank_order
from Sales2021)
select rs.division,rs.product_code,d.product as "Atliq product",rs.total_sold_quantity,rs.rank_order FROM RankedSales rs
join dim_product as d
on rs.product_code = d.product_code
where rs.rank_order <= 3
order by rs.division,rs.rank_order;








