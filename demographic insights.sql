# Demographic Insights (examples)
# a. Who prefers energy drink more? (male/female/non-binary?)
select
	gender,
    count(resp.respondent_id) as respondent_count
from dim_respondents resp
left join fact_survey_responses suresp
	on resp.respondent_id=suresp.respondent_id
group by gender 
order by respondent_count desc;

# b. Which age group prefers energy drinks more?
select
	age,
    count(resp.respondent_id) as respondent_count,
    round(100*count(resp.respondent_id)/sum(count(resp.respondent_id)) over(),2) as respondent_pct
from dim_respondents resp
left join fact_survey_responses suresp
	on resp.respondent_id=suresp.respondent_id
group by age 
order by respondent_count desc;

# c. Which type of marketing reaches the most Youth (15-30)?
select
	marketing_channels,
    count(marketing_channels) as channel_count
from dim_respondents resp
left join fact_survey_responses suresp
	on resp.respondent_id=suresp.respondent_id
where age in ("15-18","19-30")
group by Marketing_channels
order by channel_count desc
limit 1;
