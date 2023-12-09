#Consumer Preferences:

#a. What are the preferred ingredients of energy drinks among respondents?
select
	ingredients_expected,
	count(ingredients_expected) as respondents_count
from fact_survey_responses
group by ingredients_expected
order by respondents_count desc;

#b. What packaging preferences do respondents have for energy drinks?
select
	packaging_preference,
	count(packaging_preference) as respondents_count
from fact_survey_responses
group by packaging_preference
order by respondents_count desc;
