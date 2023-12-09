#Competition Analysis
#a. Who are the current market leaders?
with market_brands as (
	select
		current_brands,
		count(current_brands) as brand_count
	from fact_survey_responses
	group by current_brands
)
select 
	*,
	dense_rank() over(order by brand_count desc) as brand_rank
from market_brands;
	
#b. What are the primary reasons consumers prefer those brands over ours?
select
	reasons_for_choosing_brands as reason_for_choosing_other_brands,
    count(reasons_for_choosing_brands) as respondents_count
from fact_survey_responses
where current_brands != "codex"
group by reason_for_choosing_other_brands
order by respondents_count desc;
