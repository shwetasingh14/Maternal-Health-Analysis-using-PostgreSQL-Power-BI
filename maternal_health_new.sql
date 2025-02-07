---------------------------------Created Main Table ----------------------------------------------------
CREATE TABLE maternal_health
(
case_id Int Primary key,
age_years_old Int,
color_ethnicity Int,
hypertension_past_reported Int,
hypertension_past_treatment varchar(100),
diabetes_mellitus_dm_reported Int,
diabetes_mellitus_disease_gap varchar(100),
diabetes_mellitus_treatment varchar(100),
tobacco_use Int,
tobacco_use_in_months varchar(100),
tobacco_quantity_by_day varchar(100),
alcohol_use Int,
alcohol_quantity_milliliters varchar(100),
alcohol_preference varchar(100),
drugs_preference varchar(100),
drugs_years_use varchar(100),
drugs_during_pregnancy varchar(100),
past_newborn_1_weight varchar(100),
gestational_age_past_newborn_1 varchar(100),
past_newborn_2_weight varchar(100),
gestational_age_past_newborn_2 varchar(100),
past_newborn_3_weight varchar(100),
gestational_age_past_newborn_3 varchar(100),
past_newborn_4_weight varchar(100),
gestational_age_past_4_newborn varchar(100),
breakfast_meal Int,
morning_snack Int,
lunch_meal Int,
afternoon_snack Int,
meal_dinner Int,
supper_meal Int,
bean Int,
fruits Int,
vegetables Int,
embedded_food Int,
pasta Int,
cookies Int,
right_systolic_blood_pressure varchar(100),
right_diastolic_blood_pressure varchar(100),
left_systolic_blood_pressure varchar(100),
left_diastolic_blood_pressure varchar(100),
periumbilical_subcutanous_fat varchar(100),
periumbilical_visceral_fat varchar(100),
periumbilical_total_fat varchar(100),
preperitoneal_subcutaneous_fat Float,
preperitoneal_visceral_fat Float,
gestational_age_at_inclusion Float,
fetal_weight_at_ultrasound varchar(100),
weight_fetal_percentile varchar(100),
past_pregnancies_number varchar(100),
miscarriage Int,
first_trimester_hematocrit float,
second_trimester_hematocrit varchar(100),
third_trimester_hematocrit varchar(100),
firt_trimester_hemoglobin float,
second_trimester_hemoglobin varchar(100),
third_trimester_hemoglobin varchar(100),
first_tri_fasting_blood_glucose Int,
second_tri_fasting_blood_glucose varchar(100),
third_tri_fasting_blood_glucose varchar(100),
"1st_hour_ogtt75_1st_tri" varchar(100),
"1st_hour_ogtt75_2tri" varchar(100),
"1st_hour_ogtt75_3tri" varchar(100),
"2nd_hour_ogtt_1tri" varchar(100),
"2nd_hour_ogtt75_2tri" varchar(100),
"2nd_hour_ogtt_3tri" varchar(100),
hiv_1tri varchar(100),
syphilis_1tri varchar(100),
c_hepatitis_1tri varchar(100),
prepregnant_weight varchar(100),
prepregnant_bmi varchar(100),
bmi_according_who varchar(100),
current_maternal_weight_1st_tri varchar(100),
current_maternal_weight_2nd_tri varchar(100),
current_maternal_weight_3rd_tri varchar(100),
maternal_weight_at_inclusion float,
hight_at_inclusion float,
current_bmi float,
current_bmi_according_who Int,
ultrasound_gestational_age float,
maternal_brachial_circumference float,
circumference_maternal_calf float,
maternal_neck_circumference float,
maternal_hip_circumference float,
maternal_waist_circumference float,
mean_tricciptal_skinfold float,
mean_subscapular_skinfold float,
mean_supra_iliac_skin_fold float,
gestational_age_at_birth float,
prepartum_maternal_weight varchar(100),
prepartum_maternal_heigh varchar(100),
delivery_mode Int,
cesarean_section_reason varchar(100),
hospital_systolic_blood_pressure varchar(100),
hospital_diastolic_blood_pressure varchar(100),
hospital_hypertension Int,
preeclampsia_record_pregnancy Int,
gestational_diabetes_mellitus Int,
chronic_diabetes varchar(100),
chronic_diseases varchar(100),
disease_diagnose_during_pregnancy varchar(100),
treatment_disease_pregnancy varchar(100),
number_prenatal_appointments varchar(100),
expected_weight_for_the_newborn varchar(100),
newborn_weight varchar(100),
newborn_height varchar(100),
newborn_head_circumference varchar(100),
thoracic_perimeter_newborn Float,
meconium_labor Int,
apgar_1st_min Int,
apgar_5th_min Int,
pediatric_resuscitation_maneuvers Int,
newborn_intubation Int,
newborn_airway_aspiration Int,
mothers_hospital_stay Int);

select * from public.maternal_health

-----------------------------------Created Table Demographics----------------------------------------------

Create table demographics as
  select case_id,
 age_years_old, 
 Color_ethnicity
 FROM Maternal_Health;
 
----------------------------Changed the type and updated  ---------------------------

Alter table demographics
Alter Column color_ethnicity type varchar(100);

update demographics
SET color_ethnicity = CASE
    WHEN color_ethnicity = '0' THEN 'White'
    WHEN color_ethnicity = '1' THEN 'Black'
    WHEN color_ethnicity = '2' THEN 'Brown'
    ELSE  'Asian'
END;

 select * from demographics
 
-------------------------------------------------Created table Pregnancy_Nutritional_Details------------------------ 
 create table Pregnancy_Nutritional_Details as
 select case_id, 
breakfast_meal, morning_snack,   
 lunch_meal,
 afternoon_snack, 
meal_dinner, 
supper_meal,
 bean,
 fruits, 
vegetables, 
Embedded_food,
 pasta, 
cookies FROM maternal_health; 

select * from Pregnancy_Nutritional_Details

--------------------------------------Created table Anthropometry------------------------------------------

Create table Anthropometry as 
select
case_id ,
maternal_brachial_circumference ,
circumference_maternal_calf ,
maternal_neck_circumference ,
maternal_waist_circumference ,
maternal_hip_circumference ,
mean_tricciptal_skinfold ,
mean_subscapular_skinfold ,
mean_supra_iliac_skin_fold 
from maternal_health;

select * from Anthropometry

------------------------------------------Created table Ultrasound_results--------------------------------------
create table Ultrasound_results
as select 
case_id,
periumbilical_subcutanous_fat,
periumbilical_visceral_fat,
periumbilical_total_fat,
preperitoneal_subcutaneous_fat,
preperitoneal_visceral_fat,
gestational_age_at_inclusion,
fetal_weight_at_ultrasound,
weight_fetal_percentile,
ultrasound_gestational_age
FROM maternal_health;


select * from Ultrasound_results

------------------------------- Updated weight_fetal_percentile ------------------------------

UPDATE Ultrasound_results
SET weight_fetal_percentile = CASE
	WHEN weight_fetal_percentile = '1' THEN '10-25'
	WHEN weight_fetal_percentile = '2' THEN '25'
	WHEN weight_fetal_percentile = '3' THEN '25-50'
	WHEN weight_fetal_percentile = '4' THEN '50'
	WHEN weight_fetal_percentile = '5' THEN '50-75'
	WHEN weight_fetal_percentile = '6' THEN '75'
	WHEN weight_fetal_percentile = '7' THEN '75-90'
	WHEN weight_fetal_percentile = '8' THEN '90'
	ELSE weight_fetal_percentile
END;



UPDATE Ultrasound_results
SET weight_fetal_percentile = NULL
WHERE case_id = 283;

-------------------------------------------------Created table  Fetal_Development_Risk----------------------
create table Fetal_Development_Risk
as select 
case_id,
tobacco_use,
tobacco_use_in_months,
tobacco_quantity_by_day,
alcohol_use,
alcohol_quantity_milliliters,
alcohol_preference,
drugs_preference,
drugs_years_use,
drugs_during_pregnancy,
hiv_1tri,
syphilis_1tri,
c_hepatitis_1tri,
gestational_diabetes_mellitus,
chronic_diabetes,
chronic_diseases,
hypertension_past_reported,
hypertension_past_treatment,
diabetes_mellitus_dm_reported,
diabetes_mellitus_disease_gap,
diabetes_mellitus_treatment
from maternal_health;

select * from Fetal_Development_Risk

-------------------------------------------------Created table BMI_metrics----------


Create table BMI_metrics
as select
case_id,
prepregnant_weight,
prepregnant_bmi,
bmi_according_who,
current_maternal_weight_1st_tri,
current_maternal_weight_2nd_tri,
current_maternal_weight_3rd_tri,
maternal_weight_at_inclusion,
hight_at_inclusion,
current_bmi,
current_bmi_according_who
from maternal_health;

select * from BMI_metrics

drop table BMI_metrics
---------------------------------updated----------------------------



UPDATE bmi_metrics
SET bmi_according_who = 
 CASE 
        WHEN bmi_according_who = '0' THEN 'Underweight'
        WHEN bmi_according_who = '1' THEN 'Normal'
        WHEN bmi_according_who = '2' THEN 'Overweight'
        WHEN bmi_according_who = '3' THEN 'Obese'
        ELSE Null
    END;


UPDATE bmi_metrics 
SET bmi_according_who = 'Overweight'
WHERE case_id = 1;

UPDATE bmi_metrics 
SET bmi_according_who = 'Normal'
WHERE case_id IN (39, 223,285);


-----------------------------------------------Created table Hospitalization_Labor------------

Create table Hospitalization_Labor
as select case_id,
disease_diagnose_during_pregnancy,
treatment_disease_pregnancy,
prepartum_maternal_weight,
prepartum_maternal_heigh,
delivery_mode,
cesarean_section_reason,
hospital_systolic_blood_pressure,
hospital_diastolic_blood_pressure,
hospital_hypertension,
preeclampsia_record_pregnancy,
mothers_hospital_stay,
number_prenatal_appointments
FROM maternal_health;


select * from Hospitalization_Labor

------------------------------------------------Created table Previous_Pregnancy------
Create Table Previous_Pregnancy
as select
case_id,
past_newborn_1_weight,
gestational_age_past_newborn_1,
past_newborn_2_weight,
gestational_age_past_newborn_2,
past_newborn_3_weight,
gestational_age_past_newborn_3,
past_newborn_4_weight,
gestational_age_past_4_newborn,
past_pregnancies_number,
miscarriage
FROM maternal_health;

select * from Previous_Pregnancy

-----------------------------------------------Created table New_Born_Details---------

Create table New_Born_Details
as select
case_id,
expected_weight_for_the_newborn,
newborn_weight,
newborn_height,
newborn_head_circumference,
thoracic_perimeter_newborn,
newborn_intubation,
newborn_airway_aspiration,
gestational_age_at_birth,
pediatric_resuscitation_maneuvers,
apgar_1st_min,
apgar_5th_min,
meconium_labor
from maternal_health;

--------------------------------Changed weight gram to kg for 2 decimal places (expected_weight_for_the_newborn)-------------------

UPDATE New_Born_Details
SET expected_weight_for_the_newborn = ROUND(CAST(expected_weight_for_the_newborn AS NUMERIC) / 1000, 2);

---------------Changed weight gram to kg for 2 decimal places (newborn_weight)
UPDATE New_Born_Details
SET newborn_weight = ROUND(CAST(newborn_weight AS NUMERIC) / 1000, 2);

-------------------Replaced value 99 to 9 --------------------------------

UPDATE new_born_Details
SET apgar_1st_min = 9 WHERE apgar_1st_min = 99 ;

select * from New_Born_Details


------------------------------------------Created Table Labs----------------------------
create table Labs
as select 
case_id,
first_trimester_hematocrit,
second_trimester_hematocrit,
third_trimester_hematocrit,
firt_trimester_hemoglobin,
second_trimester_hemoglobin,
third_trimester_hemoglobin,
first_tri_fasting_blood_glucose,
second_tri_fasting_blood_glucose,
third_tri_fasting_blood_glucose,
"1st_hour_ogtt75_1st_tri",
"1st_hour_ogtt75_2tri",
"1st_hour_ogtt75_3tri",
"2nd_hour_ogtt_1tri",
"2nd_hour_ogtt75_2tri",
"2nd_hour_ogtt_3tri",
right_systolic_blood_pressure,
right_diastolic_blood_pressure,
left_systolic_blood_pressure,
left_diastolic_blood_pressure
from maternal_health;

select * from Labs

---------------------------------------------------update third_trimester_hemoglobin column in Labs table frm 121 to 12.1-------------------------------

update labs set third_trimester_hemoglobin = 12.1 where  case_id = 177;

update labs set third_trimester_hemoglobin = null where third_trimester_hemoglobin = 'not_applicable';

ALTER TABLE labs
ALTER COLUMN third_trimester_hemoglobin TYPE FLOAT USING third_trimester_hemoglobin::FLOAT;

--------------------------Changing data types from VARCHAR to FLOAT and 'not_applicable' to null for periumbilical_subcutanous_fat ,periumbilical_visceral_fat ,periumbilical_total_fat  columns --------------------------------------

UPDATE ultrasound_results set periumbilical_subcutanous_fat = null where periumbilical_subcutanous_fat = 'not_applicable';
UPDATE ultrasound_results set periumbilical_visceral_fat = null where periumbilical_visceral_fat = 'not_applicable';
UPDATE ultrasound_results set periumbilical_total_fat = null where periumbilical_total_fat = 'not_applicable';
ALTER TABLE ultrasound_results
ALTER COLUMN periumbilical_subcutanous_fat TYPE FLOAT USING periumbilical_subcutanous_fat::FLOAT;
ALTER TABLE ultrasound_results
ALTER COLUMN periumbilical_visceral_fat TYPE FLOAT USING periumbilical_visceral_fat::FLOAT;
ALTER TABLE ultrasound_results
ALTER COLUMN periumbilical_total_fat TYPE FLOAT USING periumbilical_total_fat::FLOAT;

---------------------updating subcutanous fat value using total- visceral fat for case_id = 9------------------------------------------------------------

UPDATE ultrasound_results
SET periumbilical_subcutanous_fat = Round((periumbilical_total_fat - periumbilical_visceral_fat)::NUMERIC,1)
WHERE case_id = 9;

select * from ultrasound_results where case_id = 9;

---------------------Add new column as preperitoneal_total_fat-----------------------------------------------------

ALTER TABLE ultrasound_results ADD COLUMN  preperitoneal_total_fat Float;

--------------------Upadate new colum using sub fat and vis fat columns---------------------------------------------

UPDATE ultrasound_results
SET preperitoneal_total_fat = Round((preperitoneal_subcutaneous_fat + preperitoneal_visceral_fat)::NUMERIC,1);

-----------------convert hypertension_past_treatment column from 0 to 1 and 1 to 0---------------------------------

UPDATE fetal_development_risk
SET hypertension_past_treatment= CASE
    WHEN hypertension_past_treatment = '0' THEN '1'
    WHEN hypertension_past_treatment = '1' THEN '0'
    ELSE  hypertension_past_treatment
	END;

----------------------FOR chronic_diabetes,Updating Chronic_diabetes values 888,88888 to 0---------------------------------

UPDATE fetal_development_risk
SET chronic_diabetes =
    CASE
        WHEN chronic_diabetes IN ('888', '88888') THEN 0
        ELSE chronic_diabetes::INTEGER
    END;


------------------Changes in Cesearean_section_reason column-----------------------------------------------------------
------------------1.Change 8,12,not_applicable and no_answerto null-----------------------------------------------------


UPDATE hospitalization_labor
SET cesarean_section_reason = NULL
WHERE cesarean_section_reason IN ('8', '12');


------------------2.Updated chronic_diabetes column depending on disease_diagnose_pregnancy column-----------------------------------------------------

UPDATE fetal_development_risk as f
SET
    chronic_diabetes =
        CASE
            WHEN chronic_diabetes IS NULL AND disease_diagnose_during_pregnancy ILIKE '%DM' THEN '1'
            ELSE chronic_diabetes
        END
FROM hospitalization_labor as h
where f.case_id = h.case_id
and disease_diagnose_during_pregnancy IS NOT NULL;

--------------------2.Standardize the Text in cesearean_section_reason column-----------------------------------------

UPDATE hospitalization_labor
SET cesarean_section_reason = CASE
    WHEN cesarean_section_reason ILIKE 'eletiva' THEN 'elective'
    WHEN cesarean_section_reason ILIKE 'placentae detachment' THEN 'placenta detachment'
    WHEN cesarean_section_reason ILIKE 'Nonreassuring fetal status%' THEN 'nonreassuring fetal status (nrfs)'
    WHEN cesarean_section_reason ILIKE 'previa' THEN 'placenta previa'
    WHEN cesarean_section_reason ILIKE 'fetal macrosomia%' THEN 'fetal macrosomia'
    ELSE cesarean_section_reason
END;

------------------Update treatment_disease_pregnancy------------------------------------------------------------
------------------1.Standardize the text in treatment_disease_pregnancy----------------------------------------

UPDATE hospitalization_labor
SET treatment_disease_pregnancy = CASE
    WHEN treatment_disease_pregnancy ILIKE '%diet%' THEN 'Diet'
    WHEN treatment_disease_pregnancy ILIKE '%Sem tto%' THEN 'No treatment'
    WHEN treatment_disease_pregnancy ILIKE '%ac valproico%' THEN 'Valproic acid'
    WHEN treatment_disease_pregnancy ILIKE '%Medicamento%' THEN 'Medication'
    WHEN treatment_disease_pregnancy ILIKE '%insulina%' THEN 'Insulin'
    WHEN treatment_disease_pregnancy ILIKE '%tapazol%' THEN 'Tapazole'
    WHEN treatment_disease_pregnancy ILIKE '%aspirina%' THEN 'Aspirin'
    WHEN treatment_disease_pregnancy ILIKE '%metformina%' THEN 'Metformin'
    WHEN treatment_disease_pregnancy ILIKE '%Metildopa%' THEN 'Methyldopa'
    WHEN treatment_disease_pregnancy ILIKE '%sim%' THEN 'Yes'
	WHEN treatment_disease_pregnancy::TEXT = '0' OR treatment_disease_pregnancy::TEXT = '45' THEN NULL
	WHEN treatment_disease_pregnancy ILIKE '%xetin%' THEN 'Fluoxetine'
	WHEN treatment_disease_pregnancy ILIKE '%predinisolona%' THEN 'Predinisolone'
	ELSE treatment_disease_pregnancy
END;

update hospitalization_labor set treatment_disease_pregnancy = 'Medication' where treatment_disease_pregnancy = 'medication';

------------------2.update 'not_applicable' to null in treatment_disease_pregnancy----------------------------------------
update hospitalization_labor set treatment_disease_pregnancy = null where treatment_disease_pregnancy = 'not_applicable';

-------------------------------Update bmi_according_who column-----------------------------------------------------------

UPDATE bmi_metrics
SET bmi_according_who = 'Overweight'
WHERE case_id = 1;

UPDATE bmi_metrics
SET bmi_according_who = 'Normal'
WHERE case_id IN (39, 223,285);

-------------------------------Update weight_fetal_percentile column-----------------------------------------------------------

UPDATE Ultrasound_results
SET weight_fetal_percentile = NULL
WHERE case_id = 283;

-----------------------------modified the data types from integer to Float and converted grams to Kg for the below list of columns---------------

ALTER TABLE previous_pregnancy
ALTER COLUMN past_newborn_1_weight TYPE FLOAT USING past_newborn_1_weight::FLOAT;

ALTER TABLE previous_pregnancy
ALTER COLUMN past_newborn_2_weight TYPE FLOAT USING past_newborn_2_weight::FLOAT;

ALTER TABLE previous_pregnancy
ALTER COLUMN past_newborn_3_weight TYPE FLOAT USING past_newborn_3_weight::FLOAT;

ALTER TABLE previous_pregnancy
ALTER COLUMN past_newborn_4_weight TYPE FLOAT USING past_newborn_4_weight::FLOAT;

UPDATE previous_pregnancy
SET past_newborn_1_weight = past_newborn_1_weight/1000;

UPDATE previous_pregnancy
SET past_newborn_1_weight = round(past_newborn_1_weight::numeric, 2);

UPDATE previous_pregnancy
SET past_newborn_2_weight = round((past_newborn_2_weight/1000)::numeric, 2);

UPDATE previous_pregnancy
SET past_newborn_3_weight = round((past_newborn_3_weight/1000)::numeric, 2);

UPDATE previous_pregnancy
SET past_newborn_4_weight = round((past_newborn_4_weight/1000)::numeric, 2);

-----------------alcohol_preference column transformed----------------------------
UPDATE public.fetal_development_risk
SET alcohol_preference = CASE
    WHEN alcohol_preference = '0' THEN 'Fermented'
    WHEN alcohol_preference = '1' THEN 'Distilled'
    WHEN alcohol_preference = 'not_applicable' THEN null
    ELSE alcohol_preference
END;

----------------------- drugs_preference column transformed--------------------
UPDATE public.fetal_development_risk
SET drugs_preference = 0
WHERE drugs_preference = 'not_applicable';

ALTER TABLE fetal_development_risk
ALTER COLUMN drugs_preference TYPE INT USING drugs_preference::INT;


----------- past_pregnancies_number column transformed---------------

select * from previous_pregnancy where case_id = 48;

update public.previous_pregnancy  
set  past_pregnancies_number = 2
where case_id in (48,201);

update public.previous_pregnancy
set past_pregnancies_number = 1
where case_id in (70, 182, 239, 263, 220);

update public.previous_pregnancy 
set  past_pregnancies_number = 0
where case_id in (15,240);

ALTER TABLE previous_pregnancy
ALTER COLUMN past_pregnancies_number TYPE INT USING past_pregnancies_number::INT;

----------------- periumbilical_subcutanous_fat column transformed----------------
UPDATE public.ultrasound_results  
set periumbilical_subcutanous_fat = 15.4 where case_id = 9;

select * from ultrasound_results where case_id = 266;


----------------------- periumbilical_total_fat column transformed-------------
UPDATE public.ultrasound_results 
SET periumbilical_total_fat = ROUND(CAST(periumbilical_subcutanous_fat  + periumbilical_visceral_fat AS NUMERIC), 2) :: FLOAT     
WHERE case_id IN (266, 269, 275, 278, 283, 285, 273, 280, 282, 286,287);



--------------------- maternal_weight_at_inclusion column transformed------------
select * from public.bmi_metrics where case_id = 124;

update public.bmi_metrics
set maternal_weight_at_inclusion = round(cast(current_bmi * hight_at_inclusion * hight_at_inclusion as numeric),2) :: float
where case_id = 124;

---------------------hiv_1tri column transformed--------------------------
select * from fetal_development_risk where case_id = 1;
update public.fetal_development_risk
 set hiv_1tri = null
 where hiv_1tri = 'not_applicable';

 ALTER TABLE public.fetal_development_risk
 ALTER COLUMN hiv_1tri TYPE integer 
 USING hiv_1tri::integer;

 update public.fetal_development_risk fd
 set hiv_1tri = 1
from hospitalization_labor hl
where fd.case_id = hl.case_id
	 and disease_diagnose_during_pregnancy ilike '%HIV%';

--------------------- syphilis_1tri column transformed--------------
update public.fetal_development_risk
 set syphilis_1tri = null
 where syphilis_1tri = 'not_applicable';
 
 ALTER TABLE fetal_development_risk
 ALTER COLUMN syphilis_1tri TYPE integer 
 USING syphilis_1tri::integer;

 update fetal_development_risk fd
 set syphilis_1tri =1 
from hospitalization_labor hl
where fd.case_id = hl.case_id
and hl.disease_diagnose_during_pregnancy ilike '%syphilis%';

--------------------c_hepatitis_1tri column transformed-------------

update public.fetal_development_risk
 set c_hepatitis_1tri = null
 where c_hepatitis_1tri = 'not_applicable';
 
 ALTER TABLE public.fetal_development_risk
 ALTER COLUMN c_hepatitis_1tri TYPE integer 
 USING c_hepatitis_1tri::integer;

 update fetal_development_risk fd
 set c_hepatitis_1tri = 1 
	 from hospitalization_labor hl
where fd.case_id = hl.case_id
	 and hl.disease_diagnose_during_pregnancy like '%hepatitis c%';

---------- hospital_systolic_blood_pressure & hospital_diastolic_blood_pressure columns transformed------------


UPDATE public.hospitalization_labor
SET hospital_systolic_blood_pressure = CASE WHEN hospital_systolic_blood_pressure= 'not_applicable' THEN null ELSE hospital_systolic_blood_pressure END,
    hospital_diastolic_blood_pressure = CASE WHEN hospital_diastolic_blood_pressure= 'not_applicable' THEN null ELSE hospital_diastolic_blood_pressure END
WHERE hospital_systolic_blood_pressure= 'not_applicable' OR hospital_diastolic_blood_pressure= 'not_applicable';
 
ALTER TABLE hospitalization_labor
ALTER COLUMN hospital_systolic_blood_pressure SET DATA TYPE INTEGER USING hospital_systolic_blood_pressure::INTEGER,
ALTER COLUMN hospital_diastolic_blood_pressure SET DATA TYPE INTEGER USING hospital_diastolic_blood_pressure::INTEGER;

UPDATE public.hospitalization_labor
SET hospital_systolic_blood_pressure = CASE WHEN hospital_systolic_blood_pressure< hospital_diastolic_blood_pressure
    THEN hospital_diastolic_blood_pressure ELSE hospital_systolic_blood_pressure 
	END,
	hospital_diastolic_blood_pressure = CASE WHEN hospital_systolic_blood_pressure< hospital_diastolic_blood_pressure
	THEN hospital_systolic_blood_pressure ELSE hospital_diastolic_blood_pressure
	END
WHERE 	hospital_systolic_blood_pressure< hospital_diastolic_blood_pressure;


-------------- Updated the diabetes_mellitus_treatment column as 0 - no medicines,  1 - medicine , 2 - diet and 'not_applicable' to null--------
UPDATE public.fetal_development_risk
SET diabetes_mellitus_treatment = CASE
    WHEN diabetes_mellitus_treatment = '0' THEN 'no medicines'
    WHEN diabetes_mellitus_treatment = '1' THEN 'medicines'
    WHEN diabetes_mellitus_treatment = '2' THEN 'diet'  
        WHEN diabetes_mellitus_treatment = 'not_applicable' THEN NULL
END;
------update the miscarriage value to 1 when miscarriage = 2 and miscarriage = 3-----------
UPDATE public.previous_pregnancy
SET miscarriage = CASE
   WHEN miscarriage = 2 THEN 1
   WHEN miscarriage = 3 THEN 1
   ELSE miscarriage
END;

--Drop the Column bmi_according_who--
ALTER TABLE bmi_metrics DROP COLUMN bmi_according_who;
SELECT * FROM bmi_metrics;
--Add new column bmi_according_who--
ALTER TABLE public.bmi_metrics
ADD COLUMN bmi_according_who TEXT;
--Update bmi_according_who column values from maternal_health table---
UPDATE bmi_metrics AS Tab1
	SET bmi_according_who =
	(SELECT bmi_according_who FROM maternal_health AS Tab2
	WHERE Tab1.case_id = Tab2.case_id);
---Update 'bmi_according_who' value 0 - under weight, 1 - normal weight, 2 - over weight and 3 - obese and 'not_applicable' to null--
UPDATE bmi_metrics
SET bmi_according_who =
 CASE
        WHEN bmi_according_who = '0' THEN 'Underweight'
        WHEN bmi_according_who = '1' THEN 'Normal'
        WHEN bmi_according_who = '2' THEN 'Overweight'
        WHEN bmi_according_who = '3' THEN 'Obese'
        ELSE NULL
    END;
SELECT DISTINCT  current_bmi_who_category FROM public.bmi_metrics;
--Created new column 'current_bmi_who_category' and Updated as 0 - under weight, 1 - normal weight, 2 - over weight and 3 - obese and 'not_applicable' to null
ALTER TABLE public.bmi_metrics
ADD COLUMN current_bmi_who_category TEXT;
UPDATE public.bmi_metrics
SET current_bmi_who_category = CASE
    WHEN CAST(current_bmi_according_who AS INTEGER) = 0 THEN 'Under weight'
    WHEN CAST(current_bmi_according_who AS INTEGER) = 1 THEN 'Normal weight'
    WHEN CAST(current_bmi_according_who AS INTEGER)= 2 THEN 'Over weight'
    WHEN CAST(current_bmi_according_who AS INTEGER) = 3 THEN 'Obese'
    ELSE NULL
END;
SELECT * FROM bmi_metrics;
---ADD new column 'prepartum_bmi' and 'prepartum_bmi_who_category' --
ALTER TABLE hospitalization_labor
ADD COLUMN prepartum_bmi DECIMAL;
ALTER TABLE hospitalization_labor
ADD COLUMN prepartum_bmi_who_category TEXT;
--Rename 'prepartum_maternal_heigh' to 'prepartum_maternal_height'--
ALTER TABLE hospitalization_labor
RENAME COLUMN prepartum_maternal_heigh TO prepartum_maternal_height;

--Update 'prepartum_bmi' column using bmi calculation with 'prepartum_maternal_weight' and 'prepartum_maternal_height' columns--
UPDATE hospitalization_labor
SET prepartum_bmi = ROUND(
    (prepartum_maternal_weight::numeric /
    (prepartum_maternal_height::numeric * prepartum_maternal_height::numeric)), 2)
  WHERE prepartum_maternal_weight ~ '^\d+(\.\d+)?$'
  AND prepartum_maternal_height ~ '^\d+(\.\d+)?$';
--Update 'prepartum_bmi_who_category' column using 'prepartum_bmi' column Who ranges----
UPDATE hospitalization_labor
SET prepartum_bmi_who_category = CASE
                        WHEN prepartum_bmi < 18.5 THEN 'Underweight'
                        WHEN prepartum_bmi BETWEEN 18.5 AND 24.9 THEN 'Normal weight'
                        WHEN prepartum_bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
                        WHEN prepartum_bmi >= 30 THEN 'Obese'
                        ELSE NULL
                    END;
SELECT * FROM hospitalization_labor ORDER BY case_id;
UPDATE hospitalization_labor SET delivery_mode= '5' WHERE delivery_mode = '12';
 ALTER TABLE hospitalization_labor
           ALTER COLUMN delivery_mode TYPE TEXT USING delivery_mode::TEXT;	
 UPDATE hospitalization_labor
SET delivery_mode = CASE
   WHEN delivery_mode = '1' THEN 'vaginal'
   WHEN delivery_mode = '2' THEN 'vaginal forcipe'
   WHEN delivery_mode = '3' THEN 'miscarriage with curettage'
   WHEN delivery_mode = '4' THEN 'miscarriage without curettage'
   WHEN delivery_mode = '5' THEN 'cesarean section'
   WHEN delivery_mode = '6' THEN 'cesarean by jeopardy'
   WHEN delivery_mode = '7' THEN 'vaginal with episiotomy'
   WHEN delivery_mode = '8' THEN 'vaginal without episiotomy'
   WHEN delivery_mode = '9' THEN 'vaginal with episiotomy plus forcipe'
ELSE delivery_mode
END;

  SELECT DISTINCT disease_diagnose_during_pregnancy from hospitalization_labor;

UPDATE hospitalization_labor SET disease_diagnose_during_pregnancy = null 
          WHERE  disease_diagnose_during_pregnancy  IN('not_applicable','not_applicable+CX20','no_answer','0');
		  

   UPDATE hospitalization_labor
SET disease_diagnose_during_pregnancy = CASE
   WHEN disease_diagnose_during_pregnancy = 'Has' THEN 'Hypertension'
   WHEN disease_diagnose_during_pregnancy = 'itu' THEN 'UTI'
   WHEN disease_diagnose_during_pregnancy = 'ITU' THEN 'UTI'
   WHEN disease_diagnose_during_pregnancy = 'hepatitis b and ITU' THEN 'hepatitis b and UTI'
   WHEN disease_diagnose_during_pregnancy = 'HAS na baixa hospitalar' THEN 'Hypertension'
   WHEN disease_diagnose_during_pregnancy = 'bronchitis, itu' THEN 'bronchitis, UTI'
WHEN disease_diagnose_during_pregnancy = 'HAS na baixa hospitalar' THEN 'Hypertension'
   WHEN disease_diagnose_during_pregnancy = 'bronchitis, itu' THEN 'bronchitis, UTI'
   WHEN disease_diagnose_during_pregnancy = 'asthma' THEN 'Asthma'
   WHEN disease_diagnose_during_pregnancy = 'depression' THEN 'Depression'
   WHEN disease_diagnose_during_pregnancy = 'Has + DMG' THEN 'Hypertension + DMG'
   WHEN disease_diagnose_during_pregnancy = 'Has secundária' THEN 'Hypertension'
   WHEN disease_diagnose_during_pregnancy = 'Pre-eclampsia and has gestational' THEN 'Pre-eclampsia and Hypertension gestational'
   ELSE disease_diagnose_during_pregnancy
   END;
   UPDATE  hospitalization_labor
SET disease_diagnose_during_pregnancy = CASE
   WHEN disease_diagnose_during_pregnancy = 'HAS' THEN 'Hypertension'
   WHEN disease_diagnose_during_pregnancy = 'has' THEN 'Hypertension'
   WHEN disease_diagnose_during_pregnancy = 'HAS +DMG' THEN 'Hypertension +DMG'
    WHEN disease_diagnose_during_pregnancy = 'bronchitis itu' THEN 'bronchitis UTI'
	WHEN disease_diagnose_during_pregnancy = 'depression + ITU' THEN 'depression + UTI'
	WHEN disease_diagnose_during_pregnancy = 'Strepto + ITU' THEN 'Strepto + UTI'
	WHEN disease_diagnose_during_pregnancy = 'Cognitive deficit - depression + HAS Gestation' THEN 'Cognitive deficit - depression + Hypertension Gestation'
	ELSE disease_diagnose_during_pregnancy
   END;
-----

-- update query to change g_d_m = 0 when c_d = 1 in fetal_development_risk table.
UPDATE FETAL_DEVELOPMENT_RISK
SET GESTATIONAL_DIABETES_MELLITUS = 0
WHERE CHRONIC_DIABETES = 1;

--update query to change the d_d_d_p to add ‘DM’ when c_d = ‘1’ in hospitalization_labor;
UPDATE hospitalization_labor
SET disease_diagnose_during_pregnancy = ‘DM’
WHERE case_id in (SELECT A.case_id  FROM hospitalization_labor A
INNER JOIN fetal_development_risk B ON A.case_id = B.case_id
WHERE B.chronic_diabetes = 1 and disease_diagnose_during_pregnancy is null);

UPDATE hospitalization_labor
SET disease_diagnose_during_pregnancy =  disease_diagnose_during_pregnancy || ' + ' || ‘DM’
WHERE case_id in (SELECT A.case_id  FROM hospitalization_labor A
INNER JOIN fetal_development_risk B ON A.case_id = B.case_id
WHERE B.chronic_diabetes = 1 and disease_diagnose_during_pregnancy != ‘DM’);
-------------------------------------------------------------------------------------------------

---Table Bmi_metrics Transformations
---Replaced not_applicable by NULL

UPDATE public.bmi_metrics
SET
	CURRENT_MATERNAL_WEIGHT_1ST_TRI = NULL
WHERE
	CURRENT_MATERNAL_WEIGHT_1ST_TRI = 'not_applicable';

UPDATE public.bmi_metrics
SET
	CURRENT_MATERNAL_WEIGHT_2nd_TRI = NULL
WHERE
	CURRENT_MATERNAL_WEIGHT_2nd_TRI = 'not_applicable';

UPDATE public.bmi_metrics
SET
	CURRENT_MATERNAL_WEIGHT_3rd_TRI = NULL
WHERE
	CURRENT_MATERNAL_WEIGHT_3rd_TRI = 'not_applicable';

UPDATE public.bmi_metrics
SET
	 prepregnant_weight= NULL
WHERE
	 prepregnant_weight= 'no_answer';

UPDATE public.bmi_metrics
SET
	prepregnant_bmi = NULL
WHERE
	prepregnant_bmi = 'not_applicable';

---Changed Datatypes
Alter table public.bmi_metrics
ALTER COLUMN CURRENT_MATERNAL_WEIGHT_1ST_TRI TYPE NUMERIC USING CURRENT_MATERNAL_WEIGHT_1ST_TRI::NUMERIC(10,2),
ALTER COLUMN CURRENT_MATERNAL_WEIGHT_2ND_TRI TYPE NUMERIC USING CURRENT_MATERNAL_WEIGHT_2ND_TRI::NUMERIC(10,2),
ALTER COLUMN CURRENT_MATERNAL_WEIGHT_3RD_TRI TYPE NUMERIC USING CURRENT_MATERNAL_WEIGHT_3RD_TRI::NUMERIC(10,2),
ALTER COLUMN PREPREGNANT_WEIGHT TYPE NUMERIC USING PREPREGNANT_WEIGHT::NUMERIC(10,1),
ALTER COLUMN PREPREGNANT_BMI TYPE NUMERIC USING PREPREGNANT_BMI::NUMERIC(10,2);

---Updated current_maternal_weight_3rd_tri Case_id=237 to 99.9 from 999 as it seems a typo.
UPDATE public.bmi_metrics
 SET current_maternal_weight_3rd_tri = '99.9'
 WHERE case_id = '237';
-----------------------------------------

---Table ultrasound_results Transformations
Select * From public.ultrasound_results;

--CREATING NEW COLUMN
ALTER TABLE ULTRASOUND_RESULTS
ADD COLUMN PERIUMBILICAL_VFT_SFT_RATIO NUMERIC(10,2);

-- UPDATING THE NEW COLUMN WITH THE VALUES
UPDATE ULTRASOUND_RESULTS
 SET
 PERIUMBILICAL_VFT_SFT_RATIO = PERIUMBILICAL_VISCERAL_FAT / PERIUMBILICAL_SUBCUTANOUS_FAT;

--CREATING NEW COLUMN
ALTER TABLE ULTRASOUND_RESULTS
ADD COLUMN PREPERITONEAL_VFT_SFT_RATIO NUMERIC(10,2);

-- UPDATING THE NEW COLUMN WITH THE VALUES
UPDATE ULTRASOUND_RESULTS
SET
  PREPERITONEAL_VFT_SFT_RATIO = PREPERITONEAL_VISCERAL_FAT / PREPERITONEAL_SUBCUTANEOUS_FAT;

---Replaced not_applicable by NULL
UPDATE public.ultrasound_results
SET
	fetal_weight_at_ultrasound = NULL
WHERE
	 fetal_weight_at_ultrasound= 'not_applicable';


UPDATE ultrasound_results
SET
	weight_fetal_percentile = NULL
WHERE
	weight_fetal_percentile= 'not_applicable';

------------------------------------------------------------------------------------
---Table labs Transformations
Select * from labs;

---Replaced not_applicable by NULL
UPDATE public.labs
SET second_trimester_hematocrit = NULL
WHERE second_trimester_hematocrit = 'not_applicable';  

UPDATE public.labs
SET third_trimester_hematocrit = NULL
WHERE third_trimester_hematocrit = 'not_applicable'; 

UPDATE public.labs
SET second_trimester_hemoglobin = NULL
WHERE second_trimester_hemoglobin = 'not_applicable'; 

UPDATE public.labs
SET  second_tri_fasting_blood_glucose= NULL
WHERE second_tri_fasting_blood_glucose = 'not_applicable'; 

UPDATE public.labs
SET  third_tri_fasting_blood_glucose= NULL
WHERE third_tri_fasting_blood_glucose = 'not_applicable'; 

UPDATE public.labs
SET  "1st_hour_ogtt75_1st_tri"= NULL
WHERE "1st_hour_ogtt75_1st_tri" = 'not_applicable';

UPDATE public.labs
SET "1st_hour_ogtt75_2tri" = NULL
WHERE "1st_hour_ogtt75_2tri" = 'not_applicable';

UPDATE public.labs
SET  "1st_hour_ogtt75_3tri"= NULL
WHERE "1st_hour_ogtt75_3tri" = 'not_applicable';

UPDATE public.labs
SET "2nd_hour_ogtt_1tri" = NULL
WHERE "2nd_hour_ogtt_1tri" = 'not_applicable';

UPDATE public.labs
SET "2nd_hour_ogtt75_2tri" = NULL
WHERE  "2nd_hour_ogtt75_2tri"= 'not_applicable';

UPDATE public.labs
SET "2nd_hour_ogtt_3tri" = NULL
WHERE "2nd_hour_ogtt_3tri" = 'not_applicable';

UPDATE public.labs
SET right_systolic_blood_pressure = NULL
WHERE right_systolic_blood_pressure = 'not_applicable';

UPDATE public.labs
SET right_diastolic_blood_pressure = NULL
WHERE  right_diastolic_blood_pressure= 'not_applicable';

UPDATE public.labs
SET  left_systolic_blood_pressure= NULL
WHERE left_systolic_blood_pressure = 'not_applicable';

UPDATE public.labs
SET  left_diastolic_blood_pressure= NULL
WHERE left_diastolic_blood_pressure= 'not_applicable';

---Changed Datatypes
ALTER TABLE PUBLIC.LABS
ALTER COLUMN second_trimester_hematocrit TYPE double precision USING second_trimester_hematocrit::double precision,
ALTER COLUMN third_trimester_hematocrit TYPE double precision USING third_trimester_hematocrit::double precision,
ALTER COLUMN second_trimester_hemoglobin TYPE double precision USING second_trimester_hemoglobin::double precision,
ALTER COLUMN second_tri_fasting_blood_glucose TYPE double precision USING second_tri_fasting_blood_glucose::integer,
ALTER COLUMN third_tri_fasting_blood_glucose TYPE integer USING third_tri_fasting_blood_glucose::integer,
ALTER COLUMN "1st_hour_ogtt75_1st_tri" TYPE integer USING "1st_hour_ogtt75_1st_tri"::integer,
ALTER COLUMN "1st_hour_ogtt75_2tri" TYPE integer USING "1st_hour_ogtt75_2tri"::integer,
ALTER COLUMN "1st_hour_ogtt75_3tri" TYPE integer USING "1st_hour_ogtt75_3tri"::integer,
ALTER COLUMN "2nd_hour_ogtt_1tri" TYPE integer USING "2nd_hour_ogtt_1tri"::integer,
ALTER COLUMN "2nd_hour_ogtt75_2tri" TYPE integer USING "2nd_hour_ogtt75_2tri"::integer,
ALTER COLUMN "2nd_hour_ogtt_3tri" TYPE integer USING "2nd_hour_ogtt_3tri"::integer,
ALTER COLUMN right_systolic_blood_pressure TYPE integer USING right_systolic_blood_pressure::integer,
ALTER COLUMN left_systolic_blood_pressure TYPE integer USING left_systolic_blood_pressure::integer,
ALTER COLUMN right_diastolic_blood_pressure TYPE integer USING right_diastolic_blood_pressure::integer,
ALTER COLUMN left_diastolic_blood_pressure TYPE integer USING left_diastolic_blood_pressure::integer;

--CREATING NEW COLUMN
ALTER TABLE public.labs
        ADD COLUMN mean_systolic_blood_pressure integer; 

-- UPDATING THE NEW COLUMN WITH THE VALUES
UPDATE public.labs
SET mean_systolic_blood_pressure = ROUND((right_systolic_blood_pressure + left_systolic_blood_pressure) / 2, 0);

--CREATING NEW COLUMN
ALTER TABLE public.labs
        ADD COLUMN mean_diastolic_blood_pressure integer;

-- UPDATING THE NEW COLUMN WITH THE VALUES
UPDATE public.labs
SET mean_diastolic_blood_pressure = ROUND((right_diastolic_blood_pressure + left_diastolic_blood_pressure) / 2, 0);
----------------------------------------------------------------------------------------------
---Table new_born_details Transformations
Select * from new_born_details;

---Replacing not_applicable to NULL
UPDATE public.new_born_details
SET newborn_height = NULL
WHERE newborn_height IN ('not_applicable');

UPDATE public.new_born_details
SET newborn_head_circumference = NULL
WHERE newborn_head_circumference IN ('not_applicable');

-----Changing Datatypes
ALTER TABLE public.new_born_details
ALTER COLUMN expected_weight_for_the_newborn TYPE double precision USING expected_weight_for_the_newborn::double precision;

ALTER TABLE public.new_born_details
ALTER COLUMN newborn_weight TYPE double precision USING newborn_weight::double precision ;

ALTER TABLE public.new_born_details
ALTER COLUMN newborn_height TYPE double precision USING newborn_height:: double precision;

ALTER TABLE public.new_born_details
ALTER COLUMN newborn_head_circumference TYPE double precision USING newborn_head_circumference :: double precision
---------------------------------------------
	
---Table fetal_development_risk Transformations
Select * From fetal_development_risk;

-------Replacing not_applicable & no_answer to NULL	
UPDATE fetal_development_risk
SET tobacco_use_in_months = NULL
WHERE tobacco_use_in_months IN ('not_applicable', 'no_answer');

UPDATE fetal_development_risk
SET tobacco_quantity_by_day = NULL
WHERE tobacco_quantity_by_day IN ('not_applicable', 'no_answer');

UPDATE fetal_development_risk
SET alcohol_quantity_milliliters = NULL
WHERE alcohol_quantity_milliliters IN ('not_applicable', 'no_answer');

UPDATE fetal_development_risk
SET drugs_years_use = NULL
WHERE drugs_years_use IN ('not_applicable', 'no_answer');

UPDATE fetal_development_risk
SET drugs_during_pregnancy = NULL
WHERE drugs_during_pregnancy IN ('not_applicable', 'no_answer');

UPDATE fetal_development_risk
SET chronic_diabetes = NULL
WHERE chronic_diabetes IN ('not_applicable', 'no_answer');

UPDATE fetal_development_risk
SET chronic_diseases = NULL
WHERE chronic_diseases IN ('not_applicable', 'no_answer');

UPDATE fetal_development_risk
SET hypertension_past_treatment = NULL
WHERE hypertension_past_treatment IN ('not_applicable', 'no_answer');

UPDATE fetal_development_risk
SET diabetes_mellitus_disease_gap = NULL
WHERE diabetes_mellitus_disease_gap IN ('not_applicable', 'no_answer');

-----Changing Datatypes
ALTER TABLE fetal_development_risk
ALTER COLUMN tobacco_use_in_months TYPE double precision USING tobacco_use_in_months::double precision;

ALTER TABLE fetal_development_risk
ALTER COLUMN tobacco_quantity_by_day TYPE double precision USING tobacco_quantity_by_day::double precision;

ALTER TABLE fetal_development_risk
ALTER COLUMN alcohol_quantity_milliliters TYPE integer USING alcohol_quantity_milliliters::integer;

ALTER TABLE fetal_development_risk
ALTER COLUMN drugs_years_use TYPE integer USING drugs_years_use::integer;

ALTER TABLE fetal_development_risk
ALTER COLUMN drugs_during_pregnancy TYPE integer USING drugs_during_pregnancy::integer;

ALTER TABLE fetal_development_risk
ALTER COLUMN chronic_diabetes TYPE integer USING chronic_diabetes::integer;

ALTER TABLE fetal_development_risk
ALTER COLUMN chronic_diseases TYPE integer USING chronic_diseases::integer;

ALTER TABLE fetal_development_risk
ALTER COLUMN hypertension_past_treatment TYPE integer USING hypertension_past_treatment::integer;

ALTER TABLE fetal_development_risk
ALTER COLUMN diabetes_mellitus_disease_gap TYPE integer USING diabetes_mellitus_disease_gap::integer;

Select *
from fetal_development_risk;

-------------------------------------------------------------
---Table previous_pregnancy Transformations

SELECT * FROM public.previous_pregnancy;

-------Replacing not_applicable & no_answer to NULL
Update public.previous_pregnancy
Set
	past_newborn_1_weight = null
Where
	past_newborn_1_weight in ('not_applicable', 'no_answer');

UPDATE PUBLIC.PREVIOUS_PREGNANCY
SET
	GESTATIONAL_AGE_PAST_NEWBORN_1 = NULL
WHERE
	GESTATIONAL_AGE_PAST_NEWBORN_1 IN ('not_applicable', 'no_answer');

Update public.previous_pregnancy
set
	past_newborn_2_weight = null
where
	past_newborn_2_weight in ('not_applicable', 'no_answer');

update public.previous_pregnancy
set
	gestational_age_past_newborn_2 = null
where
	gestational_age_past_newborn_2 in ('not_applicable', 'no_answer');

update public.previous_pregnancy
set
	past_newborn_3_weight = null
where
	past_newborn_3_weight in ('not_applicable', 'no_answer');

update public.previous_pregnancy
set
	gestational_age_past_newborn_3 = null
where
	gestational_age_past_newborn_3 in ('not_applicable', 'no_answer');

update public.previous_pregnancy
set
	past_newborn_4_weight = null
where
	past_newborn_4_weight in ('not_applicable', 'no_answer');

update public.previous_pregnancy
set
	gestational_age_past_4_newborn = null
where
	gestational_age_past_4_newborn in ('not_applicable', 'no_answer');

-----Changing Datatypes
ALTER TABLE public.previous_pregnancy
	ALTER COLUMN past_newborn_1_weight TYPE integer USING past_newborn_1_weight::integer;

ALTER TABLE public.previous_pregnancy
	ALTER COLUMN gestational_age_past_newborn_1 TYPE integer USING gestational_age_past_newborn_1::integer;

ALTER TABLE public.previous_pregnancy
	ALTER COLUMN past_newborn_2_weight TYPE integer USING past_newborn_2_weight::integer;

ALTER TABLE public.previous_pregnancy
	ALTER COLUMN gestational_age_past_newborn_2 TYPE integer USING gestational_age_past_newborn_2::integer;
----
ALTER TABLE public.previous_pregnancy
	ALTER COLUMN past_newborn_3_weight TYPE integer USING past_newborn_3_weight::integer;

ALTER TABLE public.previous_pregnancy
	ALTER COLUMN gestational_age_past_newborn_3 TYPE integer USING gestational_age_past_newborn_3::integer;

ALTER TABLE public.previous_pregnancy
	ALTER COLUMN past_newborn_4_weight TYPE integer USING past_newborn_4_weight::integer;

ALTER TABLE public.previous_pregnancy
	ALTER COLUMN gestational_age_past_4_newborn TYPE integer USING gestational_age_past_4_newborn::integer;

Select * FROM public.previous_pregnancy;

----------------------------------------------------------

---Table previous_pregnancy Transformations
SELECT * FROM public.hospitalization_labor;

-------Replacing not_applicable & no_answer to NULL in the table hospitalization_labor
UPDATE public.hospitalization_labor
SET prepartum_maternal_weight = NULL
WHERE prepartum_maternal_weight ='not_applicable';

UPDATE public.hospitalization_labor
SET prepartum_maternal_height = NULL
WHERE prepartum_maternal_height ='not_applicable';

UPDATE public.hospitalization_labor
SET cesarean_section_reason = NULL
WHERE cesarean_section_reason IN('not_applicable','no_answer');

-----Changing Datatypes in the table hospitalization_labor
ALTER TABLE public.hospitalization_labor
	ALTER COLUMN prepartum_maternal_weight TYPE numeric USING prepartum_maternal_weight::numeric(10,2);

ALTER TABLE public.hospitalization_labor
	ALTER COLUMN prepartum_maternal_height TYPE numeric USING prepartum_maternal_height::numeric(10,2);

ALTER TABLE public.hospitalization_labor
	ALTER COLUMN cesarean_section_reason TYPE text USING cesarean_section_reason::text;

ALTER TABLE public.hospitalization_labor
	ALTER COLUMN number_prenatal_appointments TYPE integer USING number_prenatal_appointments::integer;
------------------------------------------------------------------------------------------------------------
---Table ultrasound_results Transformations
Select * From ultrasound_results;

---Changing datatypes 
ALTER TABLE PUBLIC.ULTRASOUND_RESULTS
ALTER COLUMN gestational_age_at_inclusion TYPE NUMERIC(10, 0);

ALTER TABLE PUBLIC.ULTRASOUND_RESULTS
ALTER COLUMN fetal_weight_at_ultrasound TYPE Integer USING fetal_weight_at_ultrasound::integer;

--CREATING NEW COLUMN weight_percentile to recalculate the percentiles based on gestational_age_at_inclusion and fetal_weight_at_ultrasound
ALTER TABLE ultrasound_results ADD COLUMN weight_percentile INTEGER;

---Updating the values in the new column weight_percentile based on the reference table in this link .https://www.medhealthtv.com/blog/blogs/item/89-small-for-gestation
UPDATE ultrasound_results
SET weight_percentile = 
CASE
	 -- Gestational Age 14 Weeks
	WHEN gestational_age_at_inclusion = 14 AND fetal_weight_at_ultrasound >= 70 AND fetal_weight_at_ultrasound < 73 THEN 2
	WHEN gestational_age_at_inclusion = 14 AND fetal_weight_at_ultrasound >= 73 AND fetal_weight_at_ultrasound < 78 THEN 5
	WHEN gestational_age_at_inclusion = 14 AND fetal_weight_at_ultrasound >= 78 AND fetal_weight_at_ultrasound < 83 THEN 10
	WHEN gestational_age_at_inclusion = 14 AND fetal_weight_at_ultrasound >= 83 AND fetal_weight_at_ultrasound < 90 THEN 25
	WHEN gestational_age_at_inclusion = 14 AND fetal_weight_at_ultrasound >= 90 AND fetal_weight_at_ultrasound < 98 THEN 50
	WHEN gestational_age_at_inclusion = 14 AND fetal_weight_at_ultrasound >= 98 AND fetal_weight_at_ultrasound < 104 THEN 75
	WHEN gestational_age_at_inclusion = 14 AND fetal_weight_at_ultrasound >= 104 AND fetal_weight_at_ultrasound < 109 THEN 90
	WHEN gestational_age_at_inclusion = 14 AND fetal_weight_at_ultrasound >= 109 AND fetal_weight_at_ultrasound < 113 THEN 95
	WHEN gestational_age_at_inclusion = 14 AND fetal_weight_at_ultrasound >= 113 THEN 97.5
	-- Gestational Age 15 Weeks
	WHEN gestational_age_at_inclusion = 15 AND fetal_weight_at_ultrasound >= 89 AND fetal_weight_at_ultrasound < 93 THEN 2
	WHEN gestational_age_at_inclusion = 15 AND fetal_weight_at_ultrasound >= 93 AND fetal_weight_at_ultrasound < 99 THEN 5
	WHEN gestational_age_at_inclusion = 15 AND fetal_weight_at_ultrasound >= 99 AND fetal_weight_at_ultrasound < 106 THEN 10
	WHEN gestational_age_at_inclusion = 15 AND fetal_weight_at_ultrasound >= 106 AND fetal_weight_at_ultrasound < 114 THEN 25
	WHEN gestational_age_at_inclusion = 15 AND fetal_weight_at_ultrasound >= 114 AND fetal_weight_at_ultrasound < 124 THEN 50
	WHEN gestational_age_at_inclusion = 15 AND fetal_weight_at_ultrasound >= 124 AND fetal_weight_at_ultrasound < 132 THEN 75
	WHEN gestational_age_at_inclusion = 15 AND fetal_weight_at_ultrasound >= 132 AND fetal_weight_at_ultrasound < 138 THEN 90
	WHEN gestational_age_at_inclusion = 15 AND fetal_weight_at_ultrasound >= 138 AND fetal_weight_at_ultrasound < 144 THEN 95
	WHEN gestational_age_at_inclusion = 15 AND fetal_weight_at_ultrasound >= 144 THEN 97.5
	-- Gestational Age 16 Weeks
	WHEN gestational_age_at_inclusion = 16 AND fetal_weight_at_ultrasound >= 113 AND fetal_weight_at_ultrasound < 117 THEN 2
	WHEN gestational_age_at_inclusion = 16 AND fetal_weight_at_ultrasound >= 117 AND fetal_weight_at_ultrasound < 124 THEN 5
	WHEN gestational_age_at_inclusion = 16 AND fetal_weight_at_ultrasound >= 124 AND fetal_weight_at_ultrasound < 133 THEN 10
	WHEN gestational_age_at_inclusion = 16 AND fetal_weight_at_ultrasound >= 133 AND fetal_weight_at_ultrasound < 144 THEN 25
	WHEN gestational_age_at_inclusion = 16 AND fetal_weight_at_ultrasound >= 144 AND fetal_weight_at_ultrasound < 155 THEN 50
	WHEN gestational_age_at_inclusion = 16 AND fetal_weight_at_ultrasound >= 155 AND fetal_weight_at_ultrasound < 166 THEN 75
	WHEN gestational_age_at_inclusion = 16 AND fetal_weight_at_ultrasound >= 166 AND fetal_weight_at_ultrasound < 174 THEN 90
	WHEN gestational_age_at_inclusion = 16 AND fetal_weight_at_ultrasound >= 174 AND fetal_weight_at_ultrasound < 181 THEN 95
	WHEN gestational_age_at_inclusion = 16 AND fetal_weight_at_ultrasound >= 181 THEN 97.5
	-- Gestational Age 17 Weeks
	WHEN gestational_age_at_inclusion = 17 AND fetal_weight_at_ultrasound >= 141 AND fetal_weight_at_ultrasound < 146 THEN 2
	WHEN gestational_age_at_inclusion = 17 AND fetal_weight_at_ultrasound >= 146 AND fetal_weight_at_ultrasound < 154 THEN 5
	WHEN gestational_age_at_inclusion = 17 AND fetal_weight_at_ultrasound >= 154 AND fetal_weight_at_ultrasound < 165 THEN 10
	WHEN gestational_age_at_inclusion = 17 AND fetal_weight_at_ultrasound >= 165 AND fetal_weight_at_ultrasound < 177 THEN 25
	WHEN gestational_age_at_inclusion = 17 AND fetal_weight_at_ultrasound >= 177 AND fetal_weight_at_ultrasound < 190 THEN 50
	WHEN gestational_age_at_inclusion = 17 AND fetal_weight_at_ultrasound >= 190 AND fetal_weight_at_ultrasound < 203 THEN 75
	WHEN gestational_age_at_inclusion = 17 AND fetal_weight_at_ultrasound >= 203 AND fetal_weight_at_ultrasound < 217 THEN 90
	WHEN gestational_age_at_inclusion = 17 AND fetal_weight_at_ultrasound >= 217 AND fetal_weight_at_ultrasound < 225 THEN 95
	WHEN gestational_age_at_inclusion = 17 AND fetal_weight_at_ultrasound >= 225 THEN 97.5
	-- Gestational Age 18 Weeks
	WHEN gestational_age_at_inclusion = 18 AND fetal_weight_at_ultrasound >= 174 AND fetal_weight_at_ultrasound < 181 THEN 2
	WHEN gestational_age_at_inclusion = 18 AND fetal_weight_at_ultrasound >= 181 AND fetal_weight_at_ultrasound < 192 THEN 5
	WHEN gestational_age_at_inclusion = 18 AND fetal_weight_at_ultrasound >= 192 AND fetal_weight_at_ultrasound < 206 THEN 10
	WHEN gestational_age_at_inclusion = 18 AND fetal_weight_at_ultrasound >= 206 AND fetal_weight_at_ultrasound < 222 THEN 25
	WHEN gestational_age_at_inclusion = 18 AND fetal_weight_at_ultrasound >= 222 AND fetal_weight_at_ultrasound < 239 THEN 50
	WHEN gestational_age_at_inclusion = 18 AND fetal_weight_at_ultrasound >= 239 AND fetal_weight_at_ultrasound < 255 THEN 75
	WHEN gestational_age_at_inclusion = 18 AND fetal_weight_at_ultrasound >= 255 AND fetal_weight_at_ultrasound < 268 THEN 90
	WHEN gestational_age_at_inclusion = 18 AND fetal_weight_at_ultrasound >= 268 AND fetal_weight_at_ultrasound < 278 THEN 95
	WHEN gestational_age_at_inclusion = 18 AND fetal_weight_at_ultrasound >= 278 THEN 97.5
	-- Gestational Age 19 Weeks
	WHEN gestational_age_at_inclusion = 19 AND fetal_weight_at_ultrasound >= 214 AND fetal_weight_at_ultrasound < 223 THEN 2
	WHEN gestational_age_at_inclusion = 19 AND fetal_weight_at_ultrasound >= 223 AND fetal_weight_at_ultrasound < 235 THEN 5
	WHEN gestational_age_at_inclusion = 19 AND fetal_weight_at_ultrasound >= 235 AND fetal_weight_at_ultrasound < 252 THEN 10
	WHEN gestational_age_at_inclusion = 19 AND fetal_weight_at_ultrasound >= 252 AND fetal_weight_at_ultrasound < 272 THEN 25
	WHEN gestational_age_at_inclusion = 19 AND fetal_weight_at_ultrasound >= 272 AND fetal_weight_at_ultrasound < 292 THEN 50
	WHEN gestational_age_at_inclusion = 19 AND fetal_weight_at_ultrasound >= 292 AND fetal_weight_at_ultrasound < 313 THEN 75
	WHEN gestational_age_at_inclusion = 19 AND fetal_weight_at_ultrasound >= 313 AND fetal_weight_at_ultrasound < 328 THEN 90
	WHEN gestational_age_at_inclusion = 19 AND fetal_weight_at_ultrasound >= 328 AND fetal_weight_at_ultrasound < 340 THEN 95
	WHEN gestational_age_at_inclusion = 19 AND fetal_weight_at_ultrasound >= 340 THEN 97.5
	-- Gestational Age 20 Weeks
	WHEN gestational_age_at_inclusion = 20 AND fetal_weight_at_ultrasound >= 260 AND fetal_weight_at_ultrasound < 271 THEN 2
	WHEN gestational_age_at_inclusion = 20 AND fetal_weight_at_ultrasound >= 271 AND fetal_weight_at_ultrasound < 286 THEN 5
	WHEN gestational_age_at_inclusion = 20 AND fetal_weight_at_ultrasound >= 286 AND fetal_weight_at_ultrasound < 307 THEN 10
	WHEN gestational_age_at_inclusion = 20 AND fetal_weight_at_ultrasound >= 307 AND fetal_weight_at_ultrasound < 330 THEN 25
	WHEN gestational_age_at_inclusion = 20 AND fetal_weight_at_ultrasound >= 330 AND fetal_weight_at_ultrasound < 355 THEN 50
	WHEN gestational_age_at_inclusion = 20 AND fetal_weight_at_ultrasound >= 355 AND fetal_weight_at_ultrasound < 380 THEN 75
	WHEN gestational_age_at_inclusion = 20 AND fetal_weight_at_ultrasound >= 380 AND fetal_weight_at_ultrasound < 399 THEN 90
	WHEN gestational_age_at_inclusion = 20 AND fetal_weight_at_ultrasound >= 399 AND fetal_weight_at_ultrasound < 413 THEN 95
	WHEN gestational_age_at_inclusion = 20 AND fetal_weight_at_ultrasound >= 413 THEN 97.5
	-- Gestational Age 21 Weeks
	WHEN gestational_age_at_inclusion = 21 AND fetal_weight_at_ultrasound >= 314 AND fetal_weight_at_ultrasound < 327 THEN 2
	WHEN gestational_age_at_inclusion = 21 AND fetal_weight_at_ultrasound >= 327 AND fetal_weight_at_ultrasound < 345 THEN 5
	WHEN gestational_age_at_inclusion = 21 AND fetal_weight_at_ultrasound >= 345 AND fetal_weight_at_ultrasound < 370 THEN 10
	WHEN gestational_age_at_inclusion = 21 AND fetal_weight_at_ultrasound >= 370 AND fetal_weight_at_ultrasound < 398 THEN 25
	WHEN gestational_age_at_inclusion = 21 AND fetal_weight_at_ultrasound >= 398 AND fetal_weight_at_ultrasound < 428 THEN 50
	WHEN gestational_age_at_inclusion = 21 AND fetal_weight_at_ultrasound >= 428 AND fetal_weight_at_ultrasound < 458 THEN 75
	WHEN gestational_age_at_inclusion = 21 AND fetal_weight_at_ultrasound >= 458 AND fetal_weight_at_ultrasound < 481 THEN 90
	WHEN gestational_age_at_inclusion = 21 AND fetal_weight_at_ultrasound >= 481 AND fetal_weight_at_ultrasound < 497 THEN 95
	WHEN gestational_age_at_inclusion = 21 AND fetal_weight_at_ultrasound >= 497 THEN 97.5
	-- Gestational Age 22 Weeks
	WHEN gestational_age_at_inclusion = 22 AND fetal_weight_at_ultrasound >= 375 AND fetal_weight_at_ultrasound < 392 THEN 2
	WHEN gestational_age_at_inclusion = 22 AND fetal_weight_at_ultrasound >= 392 AND fetal_weight_at_ultrasound < 412 THEN 5
	WHEN gestational_age_at_inclusion = 22 AND fetal_weight_at_ultrasound >= 412 AND fetal_weight_at_ultrasound < 443 THEN 10
	WHEN gestational_age_at_inclusion = 22 AND fetal_weight_at_ultrasound >= 443 AND fetal_weight_at_ultrasound < 476 THEN 25
	WHEN gestational_age_at_inclusion = 22 AND fetal_weight_at_ultrasound >= 476 AND fetal_weight_at_ultrasound < 512 THEN 50
	WHEN gestational_age_at_inclusion = 22 AND fetal_weight_at_ultrasound >= 512 AND fetal_weight_at_ultrasound < 548 THEN 75
	WHEN gestational_age_at_inclusion = 22 AND fetal_weight_at_ultrasound >= 548 AND fetal_weight_at_ultrasound < 575 THEN 90
	WHEN gestational_age_at_inclusion = 22 AND fetal_weight_at_ultrasound >= 575 AND fetal_weight_at_ultrasound < 595 THEN 95
	WHEN gestational_age_at_inclusion = 22 AND fetal_weight_at_ultrasound >= 595 THEN 97.5
	-- Gestational Age 23 Weeks
	WHEN gestational_age_at_inclusion = 23 AND fetal_weight_at_ultrasound >= 445 AND fetal_weight_at_ultrasound < 465 THEN 2
	WHEN gestational_age_at_inclusion = 23 AND fetal_weight_at_ultrasound >= 465 AND fetal_weight_at_ultrasound < 489 THEN 5
	WHEN gestational_age_at_inclusion = 23 AND fetal_weight_at_ultrasound >= 489 AND fetal_weight_at_ultrasound < 525 THEN 10
	WHEN gestational_age_at_inclusion = 23 AND fetal_weight_at_ultrasound >= 525 AND fetal_weight_at_ultrasound < 565 THEN 25
	WHEN gestational_age_at_inclusion = 23 AND fetal_weight_at_ultrasound >= 565 AND fetal_weight_at_ultrasound < 608 THEN 50
	WHEN gestational_age_at_inclusion = 23 AND fetal_weight_at_ultrasound >= 608 AND fetal_weight_at_ultrasound < 650 THEN 75
	WHEN gestational_age_at_inclusion = 23 AND fetal_weight_at_ultrasound >= 650 AND fetal_weight_at_ultrasound < 682 THEN 90
	WHEN gestational_age_at_inclusion = 23 AND fetal_weight_at_ultrasound >= 682 AND fetal_weight_at_ultrasound < 705 THEN 95
	WHEN gestational_age_at_inclusion = 23 AND fetal_weight_at_ultrasound >= 705 THEN 97.5
	-- Gestational Age 24 Weeks
	WHEN gestational_age_at_inclusion = 24 AND fetal_weight_at_ultrasound >= 523 AND fetal_weight_at_ultrasound < 548 THEN 2
	WHEN gestational_age_at_inclusion = 24 AND fetal_weight_at_ultrasound >= 548 AND fetal_weight_at_ultrasound < 576 THEN 5
	WHEN gestational_age_at_inclusion = 24 AND fetal_weight_at_ultrasound >= 576 AND fetal_weight_at_ultrasound < 618 THEN 10
	WHEN gestational_age_at_inclusion = 24 AND fetal_weight_at_ultrasound >= 618 AND fetal_weight_at_ultrasound < 665 THEN 25
	WHEN gestational_age_at_inclusion = 24 AND fetal_weight_at_ultrasound >= 665 AND fetal_weight_at_ultrasound < 715 THEN 50
	WHEN gestational_age_at_inclusion = 24 AND fetal_weight_at_ultrasound >= 715 AND fetal_weight_at_ultrasound < 765 THEN 75
	WHEN gestational_age_at_inclusion = 24 AND fetal_weight_at_ultrasound >= 765 AND fetal_weight_at_ultrasound < 803 THEN 90
	WHEN gestational_age_at_inclusion = 24 AND fetal_weight_at_ultrasound >= 803 AND fetal_weight_at_ultrasound < 830 THEN 95
	WHEN gestational_age_at_inclusion = 24 AND fetal_weight_at_ultrasound >= 830 THEN 97.5
	-- Gestational Age 25 Weeks
	WHEN gestational_age_at_inclusion = 25 AND fetal_weight_at_ultrasound >= 611 AND fetal_weight_at_ultrasound < 641 THEN 2
	WHEN gestational_age_at_inclusion = 25 AND fetal_weight_at_ultrasound >= 641 AND fetal_weight_at_ultrasound < 673 THEN 5
	WHEN gestational_age_at_inclusion = 25 AND fetal_weight_at_ultrasound >= 673 AND fetal_weight_at_ultrasound < 723 THEN 10
	WHEN gestational_age_at_inclusion = 25 AND fetal_weight_at_ultrasound >= 723 AND fetal_weight_at_ultrasound < 778 THEN 25
	WHEN gestational_age_at_inclusion = 25 AND fetal_weight_at_ultrasound >= 778 AND fetal_weight_at_ultrasound < 838 THEN 50
	WHEN gestational_age_at_inclusion = 25 AND fetal_weight_at_ultrasound >= 838 AND fetal_weight_at_ultrasound < 894 THEN 75
	WHEN gestational_age_at_inclusion = 25 AND fetal_weight_at_ultrasound >= 894 AND fetal_weight_at_ultrasound < 938 THEN 90
	WHEN gestational_age_at_inclusion = 25 AND fetal_weight_at_ultrasound >= 938 AND fetal_weight_at_ultrasound < 970 THEN 95
	WHEN gestational_age_at_inclusion = 25 AND fetal_weight_at_ultrasound >= 970 THEN 97.5
	-- Gestational Age 26 Weeks
	WHEN gestational_age_at_inclusion = 26 AND fetal_weight_at_ultrasound >= 707 AND fetal_weight_at_ultrasound < 743 THEN 2
	WHEN gestational_age_at_inclusion = 26 AND fetal_weight_at_ultrasound >= 743 AND fetal_weight_at_ultrasound < 780 THEN 5
	WHEN gestational_age_at_inclusion = 26 AND fetal_weight_at_ultrasound >= 780 AND fetal_weight_at_ultrasound < 838 THEN 10
	WHEN gestational_age_at_inclusion = 26 AND fetal_weight_at_ultrasound >= 838 AND fetal_weight_at_ultrasound < 902 THEN 25
	WHEN gestational_age_at_inclusion = 26 AND fetal_weight_at_ultrasound >= 902 AND fetal_weight_at_ultrasound < 971 THEN 50
	WHEN gestational_age_at_inclusion = 26 AND fetal_weight_at_ultrasound >= 971 AND fetal_weight_at_ultrasound < 1038 THEN 75
	WHEN gestational_age_at_inclusion = 26 AND fetal_weight_at_ultrasound >= 1038 AND fetal_weight_at_ultrasound < 1087 THEN 90
	WHEN gestational_age_at_inclusion = 26 AND fetal_weight_at_ultrasound >= 1087 AND fetal_weight_at_ultrasound < 1125 THEN 95
	WHEN gestational_age_at_inclusion = 26 AND fetal_weight_at_ultrasound >= 1125 THEN 97.5
	-- Gestational Age 27 Weeks
	WHEN gestational_age_at_inclusion = 27 AND fetal_weight_at_ultrasound >= 813 AND fetal_weight_at_ultrasound < 855 THEN 2
	WHEN gestational_age_at_inclusion = 27 AND fetal_weight_at_ultrasound >= 855 AND fetal_weight_at_ultrasound < 898 THEN 5
	WHEN gestational_age_at_inclusion = 27 AND fetal_weight_at_ultrasound >= 898 AND fetal_weight_at_ultrasound < 964 THEN 10
	WHEN gestational_age_at_inclusion = 27 AND fetal_weight_at_ultrasound >= 964 AND fetal_weight_at_ultrasound < 1039 THEN 25
	WHEN gestational_age_at_inclusion = 27 AND fetal_weight_at_ultrasound >= 1039 AND fetal_weight_at_ultrasound < 1118 THEN 50
	WHEN gestational_age_at_inclusion = 27 AND fetal_weight_at_ultrasound >= 1118 AND fetal_weight_at_ultrasound < 1196 THEN 75
	WHEN gestational_age_at_inclusion = 27 AND fetal_weight_at_ultrasound >= 1196 AND fetal_weight_at_ultrasound < 1251 THEN 90
	WHEN gestational_age_at_inclusion = 27 AND fetal_weight_at_ultrasound >= 1251 AND fetal_weight_at_ultrasound < 1295 THEN 95
	WHEN gestational_age_at_inclusion = 27 AND fetal_weight_at_ultrasound >= 1295 THEN 97.5
	-- Gestational Age 28 Weeks
	WHEN gestational_age_at_inclusion = 28 AND fetal_weight_at_ultrasound >= 929 AND fetal_weight_at_ultrasound < 977 THEN 2
	WHEN gestational_age_at_inclusion = 28 AND fetal_weight_at_ultrasound >= 977 AND fetal_weight_at_ultrasound < 1026 THEN 5
	WHEN gestational_age_at_inclusion = 28 AND fetal_weight_at_ultrasound >= 1026 AND fetal_weight_at_ultrasound < 1102 THEN 10
	WHEN gestational_age_at_inclusion = 28 AND fetal_weight_at_ultrasound >= 1102 AND fetal_weight_at_ultrasound < 1189 THEN 25
	WHEN gestational_age_at_inclusion = 28 AND fetal_weight_at_ultrasound >= 1189 AND fetal_weight_at_ultrasound < 1279 THEN 50
	WHEN gestational_age_at_inclusion = 28 AND fetal_weight_at_ultrasound >= 1279 AND fetal_weight_at_ultrasound < 1368 THEN 75
	WHEN gestational_age_at_inclusion = 28 AND fetal_weight_at_ultrasound >= 1368 AND fetal_weight_at_ultrasound < 1429 THEN 90
	WHEN gestational_age_at_inclusion = 28 AND fetal_weight_at_ultrasound >= 1429 AND fetal_weight_at_ultrasound < 1481 THEN 95
	WHEN gestational_age_at_inclusion = 28 AND fetal_weight_at_ultrasound >= 1481 THEN 97.5
	-- Gestational Age 29 Weeks
	WHEN gestational_age_at_inclusion = 29 AND fetal_weight_at_ultrasound >= 1053 AND fetal_weight_at_ultrasound < 1108 THEN 2
	WHEN gestational_age_at_inclusion = 29 AND fetal_weight_at_ultrasound >= 1108 AND fetal_weight_at_ultrasound < 1165 THEN 5
	WHEN gestational_age_at_inclusion = 29 AND fetal_weight_at_ultrasound >= 1165 AND fetal_weight_at_ultrasound < 1251 THEN 10
	WHEN gestational_age_at_inclusion = 29 AND fetal_weight_at_ultrasound >= 1251 AND fetal_weight_at_ultrasound < 1350 THEN 25
	WHEN gestational_age_at_inclusion = 29 AND fetal_weight_at_ultrasound >= 1350 AND fetal_weight_at_ultrasound < 1453 THEN 50
	WHEN gestational_age_at_inclusion = 29 AND fetal_weight_at_ultrasound >= 1453 AND fetal_weight_at_ultrasound < 1554 THEN 75
	WHEN gestational_age_at_inclusion = 29 AND fetal_weight_at_ultrasound >= 1554 AND fetal_weight_at_ultrasound < 1622 THEN 90
	WHEN gestational_age_at_inclusion = 29 AND fetal_weight_at_ultrasound >= 1622 AND fetal_weight_at_ultrasound < 1682 THEN 95
	WHEN gestational_age_at_inclusion = 29 AND fetal_weight_at_ultrasound >= 1682 THEN 97.5
	-- Gestational Age 30 Weeks
	WHEN gestational_age_at_inclusion = 30 AND fetal_weight_at_ultrasound >= 1185 AND fetal_weight_at_ultrasound < 1247 THEN 2
	WHEN gestational_age_at_inclusion = 30 AND fetal_weight_at_ultrasound >= 1247 AND fetal_weight_at_ultrasound < 1313 THEN 5
	WHEN gestational_age_at_inclusion = 30 AND fetal_weight_at_ultrasound >= 1313 AND fetal_weight_at_ultrasound < 1410 THEN 10
	WHEN gestational_age_at_inclusion = 30 AND fetal_weight_at_ultrasound >= 1410 AND fetal_weight_at_ultrasound < 1523 THEN 25
	WHEN gestational_age_at_inclusion = 30 AND fetal_weight_at_ultrasound >= 1523 AND fetal_weight_at_ultrasound < 1640 THEN 50
	WHEN gestational_age_at_inclusion = 30 AND fetal_weight_at_ultrasound >= 1640 AND fetal_weight_at_ultrasound < 1753 THEN 75
	WHEN gestational_age_at_inclusion = 30 AND fetal_weight_at_ultrasound >= 1753 AND fetal_weight_at_ultrasound < 1828 THEN 90
	WHEN gestational_age_at_inclusion = 30 AND fetal_weight_at_ultrasound >= 1828 AND fetal_weight_at_ultrasound < 1897 THEN 95
	WHEN gestational_age_at_inclusion = 30 AND fetal_weight_at_ultrasound >= 1897 THEN 97.5
	-- Gestational Age 31 Weeks
	WHEN gestational_age_at_inclusion = 31 AND fetal_weight_at_ultrasound >= 1326 AND fetal_weight_at_ultrasound < 1394 THEN 2
	WHEN gestational_age_at_inclusion = 31 AND fetal_weight_at_ultrasound >= 1394 AND fetal_weight_at_ultrasound < 1470 THEN 5
	WHEN gestational_age_at_inclusion = 31 AND fetal_weight_at_ultrasound >= 1470 AND fetal_weight_at_ultrasound < 1580 THEN 10
	WHEN gestational_age_at_inclusion = 31 AND fetal_weight_at_ultrasound >= 1580 AND fetal_weight_at_ultrasound < 1707 THEN 25
	WHEN gestational_age_at_inclusion = 31 AND fetal_weight_at_ultrasound >= 1707 AND fetal_weight_at_ultrasound < 1838 THEN 50
	WHEN gestational_age_at_inclusion = 31 AND fetal_weight_at_ultrasound >= 1838 AND fetal_weight_at_ultrasound < 1964 THEN 75
	WHEN gestational_age_at_inclusion = 31 AND fetal_weight_at_ultrasound >= 1964 AND fetal_weight_at_ultrasound < 2046 THEN 90
	WHEN gestational_age_at_inclusion = 31 AND fetal_weight_at_ultrasound >= 2046 AND fetal_weight_at_ultrasound < 2126 THEN 95
	WHEN gestational_age_at_inclusion = 31 AND fetal_weight_at_ultrasound >= 2126 THEN 97.5
	-- Gestational Age 32 Weeks
	WHEN gestational_age_at_inclusion = 32 AND fetal_weight_at_ultrasound >= 1473 AND fetal_weight_at_ultrasound < 1548 THEN 2
	WHEN gestational_age_at_inclusion = 32 AND fetal_weight_at_ultrasound >= 1548 AND fetal_weight_at_ultrasound < 1635 THEN 5
	WHEN gestational_age_at_inclusion = 32 AND fetal_weight_at_ultrasound >= 1635 AND fetal_weight_at_ultrasound < 1757 THEN 10
	WHEN gestational_age_at_inclusion = 32 AND fetal_weight_at_ultrasound >= 1757 AND fetal_weight_at_ultrasound < 1901 THEN 25
	WHEN gestational_age_at_inclusion = 32 AND fetal_weight_at_ultrasound >= 1901 AND fetal_weight_at_ultrasound < 2047 THEN 50
	WHEN gestational_age_at_inclusion = 32 AND fetal_weight_at_ultrasound >= 2047 AND fetal_weight_at_ultrasound < 2187 THEN 75
	WHEN gestational_age_at_inclusion = 32 AND fetal_weight_at_ultrasound >= 2187 AND fetal_weight_at_ultrasound < 2276 THEN 90
	WHEN gestational_age_at_inclusion = 32 AND fetal_weight_at_ultrasound >= 2276 AND fetal_weight_at_ultrasound < 2367 THEN 95
	WHEN gestational_age_at_inclusion = 32 AND fetal_weight_at_ultrasound >= 2367 THEN 97.5
	-- Gestational Age 33 Weeks
	WHEN gestational_age_at_inclusion = 33 AND fetal_weight_at_ultrasound >= 1626 AND fetal_weight_at_ultrasound < 1708 THEN 2
	WHEN gestational_age_at_inclusion = 33 AND fetal_weight_at_ultrasound >= 1708 AND fetal_weight_at_ultrasound < 1807 THEN 5
	WHEN gestational_age_at_inclusion = 33 AND fetal_weight_at_ultrasound >= 1807 AND fetal_weight_at_ultrasound < 1942 THEN 10
	WHEN gestational_age_at_inclusion = 33 AND fetal_weight_at_ultrasound >= 1942 AND fetal_weight_at_ultrasound < 2103 THEN 25
	WHEN gestational_age_at_inclusion = 33 AND fetal_weight_at_ultrasound >= 2103 AND fetal_weight_at_ultrasound < 2266 THEN 50
	WHEN gestational_age_at_inclusion = 33 AND fetal_weight_at_ultrasound >= 2266 AND fetal_weight_at_ultrasound < 2419 THEN 75
	WHEN gestational_age_at_inclusion = 33 AND fetal_weight_at_ultrasound >= 2419 AND fetal_weight_at_ultrasound < 2516 THEN 90
	WHEN gestational_age_at_inclusion = 33 AND fetal_weight_at_ultrasound >= 2516 AND fetal_weight_at_ultrasound < 2619 THEN 95
	WHEN gestational_age_at_inclusion = 33 AND fetal_weight_at_ultrasound >= 2619 THEN 97.5
	-- Gestational Age 34 Weeks
	WHEN gestational_age_at_inclusion = 34 AND fetal_weight_at_ultrasound >= 1785 AND fetal_weight_at_ultrasound < 1872 THEN 2
	WHEN gestational_age_at_inclusion = 34 AND fetal_weight_at_ultrasound >= 1872 AND fetal_weight_at_ultrasound < 1985 THEN 5
	WHEN gestational_age_at_inclusion = 34 AND fetal_weight_at_ultrasound >= 1985 AND fetal_weight_at_ultrasound < 2134 THEN 10
	WHEN gestational_age_at_inclusion = 34 AND fetal_weight_at_ultrasound >= 2134 AND fetal_weight_at_ultrasound < 2312 THEN 25
	WHEN gestational_age_at_inclusion = 34 AND fetal_weight_at_ultrasound >= 2312 AND fetal_weight_at_ultrasound < 2492 THEN 50
	WHEN gestational_age_at_inclusion = 34 AND fetal_weight_at_ultrasound >= 2492 AND fetal_weight_at_ultrasound < 2659 THEN 75
	WHEN gestational_age_at_inclusion = 34 AND fetal_weight_at_ultrasound >= 2659 AND fetal_weight_at_ultrasound < 2764 THEN 90
	WHEN gestational_age_at_inclusion = 34 AND fetal_weight_at_ultrasound >= 2764 AND fetal_weight_at_ultrasound < 2880 THEN 95
	WHEN gestational_age_at_inclusion = 34 AND fetal_weight_at_ultrasound >= 2880 THEN 97.5
	-- Gestational Age 35 Weeks
	WHEN gestational_age_at_inclusion = 35 AND fetal_weight_at_ultrasound >= 1948 AND fetal_weight_at_ultrasound < 2038 THEN 2
	WHEN gestational_age_at_inclusion = 35 AND fetal_weight_at_ultrasound >= 2038 AND fetal_weight_at_ultrasound < 2167 THEN 5
	WHEN gestational_age_at_inclusion = 35 AND fetal_weight_at_ultrasound >= 2167 AND fetal_weight_at_ultrasound < 2330 THEN 10
	WHEN gestational_age_at_inclusion = 35 AND fetal_weight_at_ultrasound >= 2330 AND fetal_weight_at_ultrasound < 2527 THEN 25
	WHEN gestational_age_at_inclusion = 35 AND fetal_weight_at_ultrasound >= 2527 AND fetal_weight_at_ultrasound < 2723 THEN 50
	WHEN gestational_age_at_inclusion = 35 AND fetal_weight_at_ultrasound >= 2723 AND fetal_weight_at_ultrasound < 2904 THEN 75
	WHEN gestational_age_at_inclusion = 35 AND fetal_weight_at_ultrasound >= 2904 AND fetal_weight_at_ultrasound < 3018 THEN 90
	WHEN gestational_age_at_inclusion = 35 AND fetal_weight_at_ultrasound >= 3018 AND fetal_weight_at_ultrasound < 3148 THEN 95
	WHEN gestational_age_at_inclusion = 35 AND fetal_weight_at_ultrasound >= 3148 THEN 97.5
	-- Gestational Age 36 Weeks
	WHEN gestational_age_at_inclusion = 36 AND fetal_weight_at_ultrasound >= 2113 AND fetal_weight_at_ultrasound < 2205 THEN 2
	WHEN gestational_age_at_inclusion = 36 AND fetal_weight_at_ultrasound >= 2205 AND fetal_weight_at_ultrasound < 2352 THEN 5
	WHEN gestational_age_at_inclusion = 36 AND fetal_weight_at_ultrasound >= 2352 AND fetal_weight_at_ultrasound < 2531 THEN 10
	WHEN gestational_age_at_inclusion = 36 AND fetal_weight_at_ultrasound >= 2531 AND fetal_weight_at_ultrasound < 2745 THEN 25
	WHEN gestational_age_at_inclusion = 36 AND fetal_weight_at_ultrasound >= 2745 AND fetal_weight_at_ultrasound < 2959 THEN 50
	WHEN gestational_age_at_inclusion = 36 AND fetal_weight_at_ultrasound >= 2959 AND fetal_weight_at_ultrasound < 3153 THEN 75
	WHEN gestational_age_at_inclusion = 36 AND fetal_weight_at_ultrasound >= 3153 AND fetal_weight_at_ultrasound < 3277 THEN 90
	WHEN gestational_age_at_inclusion = 36 AND fetal_weight_at_ultrasound >= 3277 AND fetal_weight_at_ultrasound < 3422 THEN 95
	WHEN gestational_age_at_inclusion = 36 AND fetal_weight_at_ultrasound >= 3422 THEN 97.5
	-- Gestational Age 37 Weeks
	WHEN gestational_age_at_inclusion = 37 AND fetal_weight_at_ultrasound >= 2280 AND fetal_weight_at_ultrasound < 2372 THEN 2
	WHEN gestational_age_at_inclusion = 37 AND fetal_weight_at_ultrasound >= 2372 AND fetal_weight_at_ultrasound < 2537 THEN 5
	WHEN gestational_age_at_inclusion = 37 AND fetal_weight_at_ultrasound >= 2537 AND fetal_weight_at_ultrasound < 2733 THEN 10
	WHEN gestational_age_at_inclusion = 37 AND fetal_weight_at_ultrasound >= 2733 AND fetal_weight_at_ultrasound < 2966 THEN 25
	WHEN gestational_age_at_inclusion = 37 AND fetal_weight_at_ultrasound >= 2966 AND fetal_weight_at_ultrasound < 3195 THEN 50
	WHEN gestational_age_at_inclusion = 37 AND fetal_weight_at_ultrasound >= 3195 AND fetal_weight_at_ultrasound < 3403 THEN 75
	WHEN gestational_age_at_inclusion = 37 AND fetal_weight_at_ultrasound >= 3403 AND fetal_weight_at_ultrasound < 3538 THEN 90
	WHEN gestational_age_at_inclusion = 37 AND fetal_weight_at_ultrasound >= 3538 AND fetal_weight_at_ultrasound < 3697 THEN 95
	WHEN gestational_age_at_inclusion = 37 AND fetal_weight_at_ultrasound >= 3697 THEN 97.5
	-- Gestational Age 38 Weeks
	WHEN gestational_age_at_inclusion = 38 AND fetal_weight_at_ultrasound >= 2446 AND fetal_weight_at_ultrasound < 2536 THEN 2
	WHEN gestational_age_at_inclusion = 38 AND fetal_weight_at_ultrasound >= 2536 AND fetal_weight_at_ultrasound < 2723 THEN 5
	WHEN gestational_age_at_inclusion = 38 AND fetal_weight_at_ultrasound >= 2723 AND fetal_weight_at_ultrasound < 2935 THEN 10
	WHEN gestational_age_at_inclusion = 38 AND fetal_weight_at_ultrasound >= 2935 AND fetal_weight_at_ultrasound < 3186 THEN 25
	WHEN gestational_age_at_inclusion = 38 AND fetal_weight_at_ultrasound >= 3186 AND fetal_weight_at_ultrasound < 3432 THEN 50
	WHEN gestational_age_at_inclusion = 38 AND fetal_weight_at_ultrasound >= 3432 AND fetal_weight_at_ultrasound < 3652 THEN 75
	WHEN gestational_age_at_inclusion = 38 AND fetal_weight_at_ultrasound >= 3652 AND fetal_weight_at_ultrasound < 3799 THEN 90
	WHEN gestational_age_at_inclusion = 38 AND fetal_weight_at_ultrasound >= 3799 AND fetal_weight_at_ultrasound < 3973 THEN 95
	WHEN gestational_age_at_inclusion = 38 AND fetal_weight_at_ultrasound >= 3973 THEN 97.5
	-- Gestational Age 39 Weeks
	WHEN gestational_age_at_inclusion = 39 AND fetal_weight_at_ultrasound >= 2612 AND fetal_weight_at_ultrasound < 2696 THEN 2
	WHEN gestational_age_at_inclusion = 39 AND fetal_weight_at_ultrasound >= 2696 AND fetal_weight_at_ultrasound < 2905 THEN 5
	WHEN gestational_age_at_inclusion = 39 AND fetal_weight_at_ultrasound >= 2905 AND fetal_weight_at_ultrasound < 3135 THEN 10
	WHEN gestational_age_at_inclusion = 39 AND fetal_weight_at_ultrasound >= 3135 AND fetal_weight_at_ultrasound < 3403 THEN 25
	WHEN gestational_age_at_inclusion = 39 AND fetal_weight_at_ultrasound >= 3403 AND fetal_weight_at_ultrasound < 3664 THEN 50
	WHEN gestational_age_at_inclusion = 39 AND fetal_weight_at_ultrasound >= 3664 AND fetal_weight_at_ultrasound < 3897 THEN 75
	WHEN gestational_age_at_inclusion = 39 AND fetal_weight_at_ultrasound >= 3897 AND fetal_weight_at_ultrasound < 4058 THEN 90
	WHEN gestational_age_at_inclusion = 39 AND fetal_weight_at_ultrasound >= 4058 AND fetal_weight_at_ultrasound < 4247 THEN 95
	WHEN gestational_age_at_inclusion = 39 AND fetal_weight_at_ultrasound >= 4247 THEN 97.5
	ELSE NULL -- Default value if no condition matches
END;


--CREATING NEW COLUMN weight_percentile_group
ALTER TABLE ultrasound_results ADD COLUMN weight_percentile_group text;

---Updating the values in the new column weight_percentile_group based on percentile groups
---If weight_percentile is less than 10 its SGA(Small Gestational Age), 
---if between 10 and 90 its NGA(Normal Gestational Age),
---if greater than 90 its LGA(Large Gestational Age).
UPDATE ultrasound_results
SET weight_percentile_group=
CASE
	WHEN weight_percentile <10 THEN 'SGA'
	WHEN weight_percentile >=10 AND weight_percentile<90 THEN 'NGA'
	WHEN weight_percentile>=90 THEN 'LGA'
	ELSE NULL 
END;

Select * From ultrasound_results;
---------------------------------------------------










