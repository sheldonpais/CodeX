# 1. What should be the ideal price of our product?
###As per the survey analysis, CodeX needs to be priced between 50-150 which is around 70% of our survey respondents’ preference

select
	Price_range,
    count(Price_range) as respondents_count,
    round(100 * count(Price_range)/sum(count(Price_range)) over(),2) as respondent_pct
from fact_survey_responses
group by Price_range
order by respondent_pct desc;

#2. Who should be our target audience, and why?
#As per the survey analysis, athletes, college students, working professionals should be our target audience since they fall within the age group of 19-45 and also as per the ideal situation for energy drink consumption

select
	Typical_consumption_situations,
    count(Typical_consumption_situations) as situation_count,
    round(100 * count(Typical_consumption_situations)/sum(count(Typical_consumption_situations)) over(),2) as situation_pct
from fact_survey_responses
group by Typical_consumption_situations
order by situation_count desc;

select
	age,
    count(resp.respondent_id) as respondent_count,
    round(100*count(resp.respondent_id)/sum(count(resp.respondent_id)) over(),2) as respondent_pct
from dim_respondents resp
left join fact_survey_responses suresp
	on resp.respondent_id=suresp.respondent_id
group by age 
order by respondent_count desc;
