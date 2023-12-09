#Product Development
#a. Which area of business should we focus more on our product development?

select
	Brand_perception,
	count(Brand_perception) as brand_count
from fact_survey_responses
where current_brands="codex"
group by Brand_perception
order by brand_count desc;

select
	Reasons_for_choosing_brands as Reasons_for_other_choosing_brands,
	count(Reasons_for_choosing_brands) as reason_count
from fact_survey_responses
where current_brands="codex"
group by Reasons_for_choosing_brands
order by reason_count desc;

select
	round(avg(taste_experience),1) as average_rating
from fact_survey_responses
where tried_before= "Yes" or current_brands="codex";