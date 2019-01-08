-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USER / stg_auth_user
-- ------------------------------------------------------
CREATE TABLE STG.KIC_STG_MOOCS_USER (
  ID INT(11),
  USERNAME VARCHAR(100),
  FIRST_NAME VARCHAR(30),
  LAST_NAME VARCHAR(30),
  EMAIL VARCHAR(75),
  PASSWORD VARCHAR(128),
  IS_STAFF INT(11),
  IS_ACTIVE INT(11),
  IS_SUPERUSER INT(11),
  LAST_LOGIN DATETIME(6),
  DATE_JOINED DATETIME(6),
  STG_EXT_TS TIMESTAMP(6),
TRAN_TYP VARCHAR(10)
) ENGINE=INNODB DEFAULT CHARSET=UTF8 COLLATE=UTF8_UNICODE_CI;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_MOOCS_USERPROFILE / auth_userprofile
-- ------------------------------------------------------
CREATE TABLE STG.KIC_STG_MOOCS_USERPROFILE (
  ID INT(11),
  NAME VARCHAR(255),
  META VARCHAR(3000),
  GENDER VARCHAR(6),
  YEAR_OF_BIRTH INT(11),
  LEVEL_OF_EDUCATION VARCHAR(6),
  GOALS VARCHAR(4000),
  ALLOW_CERTIFICATE SMALLINT(6),
  COUNTRY VARCHAR(2),
  CITY VARCHAR(100),
  BIO VARCHAR(3000),
  PROFILE_IMAGE_UPLOADED_AT DATETIME(6),
  USER_ID INT(11),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_CERTIFICATES / certificates_generatedcertificate
-- ------------------------------------------------------

CREATE TABLE STG.KIC_STG_MOOCS_CERTIFICATES
(
  ID INT(11),
  DOWNLOAD_URL VARCHAR(128),
  GRADE DOUBLE,
  COURSE_ID VARCHAR(255),
  KEY VARCHAR(32),
  STATUS VARCHAR(32),
  VERIFY_UUID VARCHAR(32),
  DOWNLOAD_UUID VARCHAR(32),
  NAME VARCHAR(255),
  CREATED_DATE DATETIME(6),
  MODIFIED_DATE DATETIME(6),
  ERROR_REASON VARCHAR(512),
  MODE VARCHAR(32),
  USER_ID INT(11),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USERPROFILE / courseware_studentmodule
-- ------------------------------------------------------

CREATE TABLE STG.KIC_STG_MOOCS_CW_STUDENTMODULE
(
  ID INT(11) ,
  MODULE_TYPE VARCHAR(32),
  MODULE_ID VARCHAR(255),
  GRADE DOUBLE,
  CREATED DATETIME(6),
  MODIFIED DATETIME(6),
  MAX_GRADE DOUBLE,
  DONE VARCHAR(8),
  COURSE_ID VARCHAR(255),
  STUDENT_ID INT(11),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USERPROFILE / grades_persistentcoursegrade
-- ------------------------------------------------------

CREATE TABLE STG.KIC_STG_MOOCS_COURSEGRADE (
  ID INT(11),
  COURSE_ID VARCHAR(255),
  GRADING_POLICY_HASH VARCHAR(255),
  PERCENT_GRADE DOUBLE,
  LETTER_GRADE VARCHAR(255),
  PASSED_TIMESTAMP DATETIME(6),
  CREATED DATETIME(6),
  MODIFIED DATETIME(6),
  USER_ID INT(11),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USERPROFILE / grades_persistentsubsectiongrade
-- ------------------------------------------------------

CREATE TABLE STG.KIC_STG_MOOCS_SUBSECTIONGRADE (
  ID INT(11),
  COURSE_ID VARCHAR(255),
  USAGE_KEY VARCHAR(255),
  EARNED_ALL DOUBLE,
  POSSIBLE_ALL DOUBLE,
  EARNED_GRADED DOUBLE,
  POSSIBLE_GRADED DOUBLE,
  FIRST_ATTEMPTED DATETIME(6),
  CREATED DATETIME(6),
  MODIFIED DATETIME(6),
  USER_ID INT(11),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_ANONYMOUSUSERID / student_anonymoususerid
-- ------------------------------------------------------

CREATE TABLE STG.KIC_STG_MOOCS_ANONYMOUSUSERID (
  ID INT(11),
  ANONYMOUS_USER_ID VARCHAR(32),
  COURSE_ID VARCHAR(255),
  USER_ID INT(11),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_STUDENTROLE / student_courseaccessrole
-- ------------------------------------------------------

CREATE TABLE STG.KIC_STG_MOOCS_STUDENTROLE (
  ID INT(11),
  COURSE_ID VARCHAR(255),
  ROLE VARCHAR(255),
  USER_ID INT(11),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_ANONYMOUSUSERID / student_courseenrollment
-- ------------------------------------------------------

CREATE TABLE STG.KIC_STG_MOOCS_ENROLLMENT (
  ID INT(11),
  COURSE_ID VARCHAR(255),
  CREATED DATETIME(6),
  IS_ACTIVE SMALLINT(6),
  MODE VARCHAR(100),
  USER_ID INT(11),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_STUDENTLANG / student_languageproficiency
-- ------------------------------------------------------
CREATE TABLE STG.KIC_STG_MOOCS_STUDENTLANG (
  ID INT(11),
  CODE VARCHAR(16),
  USER_PROFILE_ID INT(11),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USER_TO_ID / user_id_map
-- ------------------------------------------------------
CREATE TABLE STG.KIC_STG_MOOCS_USER_TO_ID (
  HASH_ID VARCHAR(40),
  ID INT(11),
  USERNAME VARCHAR(100),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USER_TO_ID / metadata_cursos.csv
-- ------------------------------------------------------
CREATE TABLE STG.KIC_STG_MOOCS_COURSES (
  ID INT(11),
  STUDIO_ID VARCHAR(50),
  NAME VARCHAR(255),
  SME VARCHAR(50),
  START_DATE DATETIME,
  END_DATE DATETIME,
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_USER_LOCATION /user_location.csv
-- ------------------------------------------------------
CREATE TABLE STG.KIC_STG_MOOCS_USER_LOCATION (
  USER_ID INT(11),
  TM TIMESTAMP(6),
  IP VARCHAR(50),
  IP_CITY_NAME VARCHAR(100),
  IP_COUNTRY_ISO VARCHAR(100),
  IP_COUNTRY_NAME VARCHAR(100),
  IP_LATITUDE VARCHAR(100),
  IP_LONGITUDE VARCHAR(100),
  IP_POSTAL_CODE VARCHAR(100),
  IP_SUBDIVISION_NAME VARCHAR(100),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ------------------------------------------------------
--  DDL for Table STG.KIC_STG_MOOCS_IDB_LOCATION /Paises_bidENG.csv
-- ------------------------------------------------------
CREATE TABLE STG.KIC_STG_MOOCS_IDB_LOCATION (
  PAIS varchar(100) COMMENT 'Pais',
  SIGLA_BID varchar(5)  COMMENT 'Sigla del BID',
  SIGLA_IDBX varchar(5) COMMENT 'Sigla usada en la base de dato IDBx',
  SIGLA_INTERNACIONAL varchar(5) COMMENT 'Sigla internacional (tres letras)',
  REGION  varchar(100),
  IDB_GROUP_CODE varchar(10),
  REGION_NM varchar(100),
  STG_EXT_TS TIMESTAMP(6),
  TRAN_TYP VARCHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
