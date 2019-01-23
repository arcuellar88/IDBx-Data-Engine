------------------------------------
--- Check duplicate user profile
------------------------------------
select USER_ID, count(*) from KIC_STG_MOOCS_USERPROFILE
group by USER_ID
having count(*)>1
and
(
count(distinct NAME)>1 OR
count(distinct LANGUAGE)>1 OR
count(distinct LOCATION)>1 OR
count(distinct COURSEWARE)>1 OR
count(distinct YEAR_OF_BIRTH)>1 OR
count(distinct GENDER)>1 OR
count(distinct GOALS)>1 OR
count(distinct COUNTRY)>1
)
;
------------------------------------
--- Check duplicate user id
------------------------------------
select USER_ID, count(*) from KIC_STG_MOOCS_USERPROFILE
group by USER_ID
having count(*)>1 and count(distinct NAME)>
limit 100;

------------------------------------
--- Only user with duplicate user profile information
------------------------------------
select * from KIC_STG_MOOCS_USERPROFILE
where user_id=19374067;
