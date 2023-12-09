#Purchase Behavior:
#a. Where do respondents prefer to purchase energy drinks?
select
	Purchase_location,
    count(Purchase_location) as location_count
from fact_survey_responses
group by Purchase_location
order by location_count desc;

#b. What are the typical consumption situations for energy drinks among respondents?
select
	Typical_consumption_situations,
    count(Typical_consumption_situations) as situation_count,
    round(100 * count(Typical_consumption_situations)/sum(count(Typical_consumption_situations)) over(),2) as situation_pct
from fact_survey_responses
group by Typical_consumption_situations
order by situation_count desc;


#c. What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
select
	Price_range,
    count(Price_range) as respondents_count,
    round(100 * count(Price_range)/sum(count(Price_range)) over(),2) as respondent_pct
from fact_survey_responses
group by Price_range
order by respondent_pct desc;

select
	Limited_edition_packaging,
    count(Limited_edition_packaging) as respondents_count,
    round(100 * count(Limited_edition_packaging)/sum(count(Limited_edition_packaging)) over(),2) as respondent_pct
from fact_survey_responses
group by Limited_edition_packaging
order by respondent_pct desc;

