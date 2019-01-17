TRUNCATE TABLE STG.KIC_STG_MOOCS_COURSEGRADE;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/grades_persistentcoursegrade.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_COURSEGRADE
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID,
COURSE_ID,
GRADING_POLICY_HASH,
PERCENT_GRADE,
LETTER_GRADE,
PASSED_TIMESTAMP,
CREATED,
MODIFIED,
USER_ID);

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USER / auth_user
-- ------------------------------------------------------
TRUNCATE TABLE STG.KIC_STG_MOOCS_USER;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/auth_user.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_USER
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID
,USERNAME
,FIRST_NAME
,LAST_NAME
,EMAIL
,PASSWORD
,IS_STAFF
,IS_ACTIVE
,IS_SUPERUSER
,LAST_LOGIN
,DATE_JOINED);

-- ------------------------------------------------------
--  DDL for Table STG.KIC_MOOCS_USERPROFILE / auth_userprofile
-- ------------------------------------------------------

TRUNCATE TABLE STG.KIC_MOOCS_USERPROFILE;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/auth_userprofile.csv'
IGNORE
INTO TABLE STG.KIC_MOOCS_USERPROFILE
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID
,NAME
,META
,GENDER
,YEAR_OF_BIRTH
,LEVEL_OF_EDUCATION
,GOALS
,ALLOW_CERTIFICATE
,COUNTRY
,CITY
,BIO
,PROFILE_IMAGE_UPLOADED_AT
,USER_ID);

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_CERTIFICATES / certificates_generatedcertificate
-- ------------------------------------------------------

TRUNCATE TABLE STG.KIC_STG_MOOCS_CERTIFICATES;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/certificates_generatedcertificate.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_CERTIFICATES
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID
,DOWNLOAD_URL
,GRADE
,COURSE_ID
,KEYV
,STATUSV
,VERIFY_UUID
,DOWNLOAD_UUID
,NAME
,CREATED_DATE
,MODIFIED_DATE
,ERROR_REASON
,MODE
,USER_ID);

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USERPROFILE / courseware_studentmodule
-- ------------------------------------------------------

TRUNCATE TABLE STG.KIC_STG_MOOCS_CW_STUDENTMODULE;
LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/courseware_studentmodule.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_CW_STUDENTMODULE
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
ID
,MODULE_TYPE
,MODULE_ID
,STATE
,GRADE
,CREATED
,MODIFIED
,MAX_GRADE
,DONE
,COURSE_ID
,STUDENT_ID);

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_COURSEGRADE / grades_persistentcoursegrade
-- ------------------------------------------------------
TRUNCATE TABLE STG.KIC_STG_MOOCS_COURSEGRADE;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/grades_persistentcoursegrade.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_COURSEGRADE
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID,
COURSE_ID,
GRADING_POLICY_HASH,
PERCENT_GRADE,
LETTER_GRADE,
PASSED_TIMESTAMP,
CREATED,
MODIFIED,
USER_ID);


-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USERPROFILE / grades_persistentsubsectiongrade
-- ------------------------------------------------------

TRUNCATE TABLE STG.KIC_STG_MOOCS_SUBSECTIONGRADE;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/grades_persistentsubsectiongrade.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_SUBSECTIONGRADE
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
ID
,COURSE_ID
,USAGE_KEY
,EARNED_ALL
,POSSIBLE_ALL
,EARNED_GRADED
,POSSIBLE_GRADED
,FIRST_ATTEMPTED
,CREATED
,MODIFIED
,USER_ID);


-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_ANONYMOUSUSERID / student_anonymoususerid
-- ------------------------------------------------------
TRUNCATE TABLE STG.KIC_STG_MOOCS_ANONYMOUSUSERID;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/student_anonymoususerid.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_ANONYMOUSUSERID
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(`ID`,
`ANONYMOUS_USER_ID`,
`COURSE_ID`,
`USER_ID`);


-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_STUDENTROLE / student_courseaccessrole
-- ------------------------------------------------------
TRUNCATE TABLE STG.KIC_STG_MOOCS_STUDENTROLE;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/student_courseaccessrole.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_STUDENTROLE
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
ID
,COURSE_ID
,ROLE
,USER_ID);

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_ENROLLMENT / student_courseenrollment
-- ------------------------------------------------------

TRUNCATE TABLE STG.KIC_STG_MOOCS_ENROLLMENT;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/student_courseenrollment.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_ENROLLMENT
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
ID
,COURSE_ID
,CREATED
,IS_ACTIVE
,MODE
,USER_ID
)
-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_STUDENTLANG / student_languageproficiency
-- ------------------------------------------------------
TRUNCATE TABLE STG.KIC_STG_MOOCS_STUDENTLANG;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/student_courseaccessrole.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_STUDENTLANG
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
ID
,CODE
,USER_PROFILE_ID
)
-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USER_TO_ID / user_id_map
-- ------------------------------------------------------
TRUNCATE TABLE STG.KIC_STG_MOOCS_USER_TO_ID;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/user_id_map.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_USER_TO_ID
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
HASH_ID
,ID
,USERNAME
)
-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_COURSES / metadata_cursos.csv
-- ------------------------------------------------------
TRUNCATE TABLE STG.KIC_STG_MOOCS_COURSES;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/metadata_cursos.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_COURSES
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
ID
,STUDIO_ID
,STUDIO_ID2
,NAME
,SME
,START_DATE
,END_DATE
);

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USER_LOCATION /user_location.csv
-- ------------------------------------------------------
TRUNCATE TABLE STG.KIC_STG_MOOCS_USER_LOCATION;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/ip_user_final.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_USER_LOCATION
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
IP
,TM
,USER_ID
,IP_COUNTRY_ISO
,IP_COUNTRY_NAME
,IP_SUBDIVISION_NAME
,IP_CITY_NAME
,IP_POSTAL_CODE
,IP_LATITUDE
,IP_LONGITUDE
);
-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_IDB_LOCATION /Paises_bidENG.csv
-- ------------------------------------------------------
TRUNCATE TABLE STG.KIC_STG_MOOCS_IDB_LOCATION;

LOAD DATA LOCAL INFILE
'/Users/alejandrorodriguez/Documents/3_Trabajo/GalapagoL/IDBx-Data-Engine/sample_data/Paises_bidENG.csv'
IGNORE
INTO TABLE STG.KIC_STG_MOOCS_IDB_LOCATION
CHARACTER SET 'utf8'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
PAIS
,SIGLA_BID
,SIGLA_IDBX
,SIGLA_INTERNACIONAL
,REGION
,IDB_GROUP_CODE
,REGION_NM
);
