show databases;
use indus_sites;
show tables;
select * from sites;
# fetch details
select indus_id, ref_no, district from sites;
# upper/lower case
select upper(district) from sites;
select lower(ref_no) from sites;
# fetch unique value
select distinct district from sites;
# print first four characters
select substring(static_dg_make,1,4) from sites;
# find position of alphabet
select instr(normal,'l') from sites where normal='normal';
# remove white spsce
select ltrim(site_category) from sites;
select ltrim(substring(site_category,1,3)) from sites;
# length of characters
select distinct length(opco) from sites;
# replace function
select replace(ref_no,'L','l') from sites;
select * from sites;
# concat function
select concat(tower_type,' ',tower_configuration,' ',tower_height) as tower_details from sites;
# sorting
select * from sites order by district;
select * from sites order by district asc;
select * from sites order by district desc;
# in function
select * from sites where smps_make in ('Delta','Emerson');
# like function
select * from sites where static_dg_make like 'Non%';
select * from sites where ac_in_tr like '%ac';
select * from sites where site_category like '%with%';
select * from sites where tower_type like '__M';
# between function
select * from sites where final_load_in_kw between 3 and 10;
select * from sites where smps_rm_capacity_in_w between 2000 and 4000;
#queries
#1 query to select data of survey date 05-08-2022
select * from sites where year(survey_date) = 2022 and month(survey_date) = 08 and day(survey_date) = 05;

#2 query to select site count of Non dg sites
select count(*) as Non_DG_sites from sites where dg_nondg = 'non dg';
select * from sites;

#3 query for list of sites where load is between 2kw to 5kw using sub-query
select indus_id, site_category, ac_in_tr, static_dg_in_kva, no_of_bb, final_load_in_kw from sites where final_load_in_kw in (select final_load_in_kw from sites where final_load_in_kw between 2 and 5);

#4 query to fetch no of sites of each site category in desc order od site category
select site_category, count(indus_id) as no_of_sites from sites group by site_category order by site_category;
select * from sites;

#5 query to print total no of GSM & MW
select s1.indus_id, s1.site_category, s1.ac_in_tr, s1.static_dg_in_kva, s1.no_of_bb, s1.final_load_in_kw, s2.total_gsm, s2.total_mw from sites s1 join sites2 s2 on s1.indus_id=s2.indus_id;

#6 query to print MCU/TCU details
select s1.indus_id, s1.site_category, s2.mcu, s2.tcu from sites s1 join sites2 s2 on s1.indus_id=s2.indus_id where site_category = 'OD with DG';

#7 fetch duplicate data of opco
select opco, count(*) as opco_count from sites group by opco having opco_count > 1;

#8 fetch avg load of DG rating
select static_dg_in_kva, avg(final_load_in_kw) from sites group by static_dg_in_kva order by avg(final_load_in_kw) asc;

#9 fetch avg load of DG rating where load > 10kw
select static_dg_in_kva, avg(final_load_in_kw) from sites group by static_dg_in_kva having avg(final_load_in_kw) > 10 ;

#10 clone/copy of table
create table sites_copy select * from sites;
select * from sites_copy;

#11 query to show top max 10 load records using off-set
select * from sites order by final_load_in_kw desc limit 10;

#12 query to show 5th highest load
select * from sites order by final_load_in_kw desc limit 4,1;

#13 query to show first 8 records of site category od without dg of max load
select indus_id, site_category, final_load_in_kw from sites where site_category='od without dg' order by final_load_in_kw desc limit 10;

#14 rename column ref no to upgrade type
alter table sites rename column ref_no to ref_type;
select * from sites;

#15 query for second highest load
select max(final_load_in_kw) as second_highest_load from sites where final_load_in_kw not in (select max(final_load_in_kw) from sites);

#16 sum of total laod
select sum(final_load_in_kw) from sites;

#17 district which has sites mote thn 500
select * from sites;
select district, count(*) as no_of_sites from sites group by district having count(*)>500;

#18 query to show site type with count
select site_type, count(*) from sites group by site_type;

#19 query to show Non dg and DG site count
select dg_nondg, count(*) from sites group by dg_nondg;

#20 RTP sites count
select tower_type, count(*) as RTP_sites from sites group by tower_type having tower_type='RTP';

#21 RTP sites district wise
select district, count(*) as RTP_Sites from sites group by tower_type, district having tower_type="RTP";

#22 district wise avg EB availability
select district, avg(eb_availability_in_hours) from sites group by district;
 
#23 SMPS used count
select * from sites;
select smps_make, count(*) from sites group by smps_make;

#24 total punched sites of year wise with ref type
select ref_type, count(*) from sites where year(survey_date)=2021 group by ref_type;
select ref_type, count(*) from sites where year(survey_date)=2022 group by ref_type;
select ref_type, count(*) from sites where year(survey_date)=2023 group by ref_type;

#25 query to show count of tower with type
select tower_type, count(*) as no_of_tower from sites group by tower_type;

#26 non eb sites data
select * from sites where eb_phase='non eb';

#27 district which has highest to lowest no of bb
select district, count(no_of_bb) as no_of_bb from sites group by district order by no_of_bb desc;

#28 high to low tenancy district wise
select district, count(tenancy) as tenancy from sites group by district order by tenancy desc;
select * from sites;

#29 delete column
alter table sites drop column eb_phase;
select * from sites;

#30 delete specific value
delete from sites where indus_id='IN-1269344';
select * from SITES;

