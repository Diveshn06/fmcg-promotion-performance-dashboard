USE retail_events_db;
ALTER TABLE fact_events
CHANGE `quantity_sold(before_promo)`  quantity_sold_before_promo INT ;
ALTER TABLE fact_events
CHANGE `quantity_sold(after_promo)`  quantity_sold_after_promo INT ;

-- 1. Provide a list of products with a base price greater than 500 and that are featured in promo type 'BOGOF'.
SELECT DISTINCT p.product_name, f.base_price, f.promo_type
FROM fact_events AS f
JOIN dim_products AS p ON p.product_code = f.product_code
WHERE f.base_price > 500 AND f.promo_type = 'BOGOF'
ORDER BY f.base_price DESC;

-- 2. Generate a report that provides an overview of the number of stores in each city, sorted by store count descending
SELECT city, COUNT(DISTINCT(store_id)) AS total_stores
FROM dim_stores
GROUP BY city
ORDER BY total_stores DESC;

-- 3. Generate a report that displays each campaign along with total revenue before and after the campaign (in millions).
SELECT c.campaign_name, 
ROUND(SUM(f.quantity_sold_before_promo * f.base_price)/1000000,2) AS total_revenue_before_campaign_mil, 
ROUND(SUM(f.quantity_sold_after_promo * f.base_price)/1000000,2) AS total_revenue_after_campaign_mil
FROM dim_campaigns AS c
JOIN fact_events AS f ON f.campaign_id = c.campaign_id
GROUP BY c.campaign_name;

-- 4. Calculate the Incremental Sold Quantity Percentage (ISU%) for each category during the Diwali campaign and rank categories by ISU%.
WITH X AS (SELECT p.category, 
SUM(f.quantity_sold_before_promo) AS total_quantity_sold_before_promo,
SUM(f.quantity_sold_after_promo) AS total_quantity_sold_after_promo
FROM dim_products AS p 
JOIN fact_events AS f ON f.product_code = p.product_code
JOIN dim_campaigns AS c ON c.campaign_id = f.campaign_id
WHERE c.campaign_name = 'Diwali'
GROUP BY p.category)
SELECT category, ROUND((total_quantity_sold_after_promo - total_quantity_sold_before_promo)*100.0/total_quantity_sold_before_promo,2) AS ISU_perc,
RANK()OVER(ORDER BY ROUND((total_quantity_sold_after_promo - total_quantity_sold_before_promo)*100.0/total_quantity_sold_before_promo,2) DESC) AS rank_order
FROM X;


-- 5. Create a report featuring the Top 5 products ranked by Incremental Revenue Percentage (IR%) across all campaigns
WITH X AS (SELECT p.product_name, p.category,
SUM(f.quantity_sold_before_promo * f.base_price ) AS total_revenue_before_campaign,
SUM(f.quantity_sold_after_promo * f.base_price ) AS total_revenue_after_campaign
FROM fact_events AS f
JOIN dim_products AS p ON p.product_code = f.product_code
GROUP BY p.product_name, p.category)
SELECT product_name, category, 
ROUND((total_revenue_after_campaign - total_revenue_before_campaign)*100.0/total_revenue_before_campaign,2) AS IR_perc
FROM X
ORDER BY IR_perc DESC
LIMIT 5;




