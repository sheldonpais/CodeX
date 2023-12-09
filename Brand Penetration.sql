#Brand Penetration:
#a. What do people think about our brand? (overall rating)
select
	round(avg(taste_experience),1) as average_rating
from fact_survey_responses
where tried_before= "Yes";

#b. Which cities do we need to focus more on?
select
	dcit.city,
    sures.brand_perception,
    count(brand_perception) as perception_count,
    round(100 * COUNT(brand_perception) / SUM(COUNT(brand_perception)) OVER (PARTITION BY dcit.city),2) AS perception_percentage
from fact_survey_responses sures
join dim_respondents res 
	on sures.respondent_id=res.respondent_id
join dim_cities dcit 
	on res.city_id= dcit.City_ID
where sures.tried_before="Yes"
group by dcit.city, Brand_perception
order by dcit.city