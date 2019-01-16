
# ETL MOOcs Phase 1

## Dimensional Fact Model
![dfm_moocs_enrollments](https://user-images.githubusercontent.com/9292999/51250051-44e7a800-1963-11e9-8654-dd6b90dc08ee.png "Dimensional Fact Model")

### Dimensions

Dimension| Description| 
|---|---|
Enrollment date| Date of the enrollment of a user in a course Hierarchy: year, month and day |	
Course| Mooc: id, name, start and end date, SME (IDB division) and duration | 
User| All the information from the user. Age, sex, Level of education, Role, Location: ip, country, region, type of student (certified, explorer, advanced, complete or enrollment), etc.   |
Passing date| Date when the student passed the Mooc.| 

### Metrics

Metric | Description |	UoM |
|---|---|---|
#users | Number of distinct user ids [count( distinct user_id)]| number|
#enrollments | Number of downloads [count(*)]|number
#new users | Number new users|number
#courses | Number new courses|number
progress | Average progress|number
percentage progress | Average percentage progress|percentage


## Instructions:

This is the ETL process for the Phase 1 of The Moocs.

### 1. Create Tables (DDL)
 - Create the STG tables using [STG.sql](https://github.com/arcuellar88/IDBx-Data-Engine/blob/datastage/STG.sql)
 - Create the SRC and ODS tables using [SRC.sql](https://github.com/arcuellar88/IDBx-Data-Engine/blob/datastage/SRC.sql) 

### 2. ETL process
![diagramas_flujo_edx_edw](https://user-images.githubusercontent.com/9292999/51249994-241f5280-1963-11e9-85de-6b90b723695a.png)

All the source files are located in a bucket in S3. The process will do the following tasks:

1. Copy the files from S3 to EDW server: DataPackage and 3 csv files (view table below)
2. Extract (decompress) and decrypt DataPackage
3. Load and process the Data with DataStage. 

#### Data Stage ETL
All the queries to move the data from STG to SRC to ODS are in [ETL.SQL](https://github.com/arcuellar88/IDBx-Data-Engine/blob/datastage/ETL.sql).

##### STG and SRC tables
<table>
    <thead>
        <tr>
            <th>SOURCE</th>
            <th>FILE NAME</th>
            <th>KIC_STG_MOOCS</th>
            <th>KIC_SRC_MOOCS</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=11>DATA PACKAGE</td>
            <td>*_student_anonymoususerid.sql</td>
            <td>ANONYMOUSUSERID</td>
            <td>ANONYMOUSUSERID</td>
        </tr>
        <tr>
            <td>*_certificates_generatedcertificate.sql</td>
            <td>CERTIFICATES</td>
            <td>CERTIFICATES</td>             
        </tr>
        <tr>
           <td>*_grades_persistentcoursegrade.sql</td>
            <td>COURSEGRADE</td>
             <td>COURSEGRADE</td>
        </tr>
        <tr>
            <td>*_courseware_studentmodule.sql</td>
            <td>CW_STUDENTMODULE</td>
            <td>CW_STUDENTMODULE</td>
        </tr>
        <tr>
            <td>*_student_courseenrollment.sql</td>
            <td>ENROLLMENT</td>
            <td>ENROLLMENT</td>
        </tr>
        <tr>
            <td>*_student_languageproficiency.sql</td>
            <td>STUDENTLANG</td>
            <td>STUDENTLANG</td>
        </tr>
        <tr>
            <td>*_student_courseaccessrole</td>
            <td>STUDENTROLE</td>
            <td>STUDENTROLE</td>
        </tr>
        <tr>
             <td>*_user_id_map.sql</td>
            <td>USER_TO_ID</td>
            <td>USER_TO_ID</td>
       </tr>
        <tr>
            <td>*_grades_persistentsubsectiongrade.sql</td>
            <td>SUBSECTIONGRADE</td>
            <td>SUBSECTIONGRADE</td>
        </tr>
        <tr>
            <td>*_auth_user.csv</td>
            <td>USER</td>
            <td>USER</td>
        </tr>
        <tr>
            <td>*_auth_userprofile.sql</td>
            <td>USERPROFILE</td>
            <td>USERPROFILE</td>
        </tr>
        <tr>
            <td rowspan=3>CSV</td>
            <td>user_location.csv</td>
            <td>USER_LOCATION</td>
            <td>USER_LOCATION</td>
        </tr>
           <tr>
            <td>IDB_COUNTRIES.CSV</td>
            <td>IDB_LOCATION</td>
            <td>IDB_LOCATION</td>
        </tr>
        <tr>
             <td>COURSE_METADATA.CSV</td>
            <td>COURSES</td>
            <td>COURSES</td>
        </tr>
</table>

* The DataPackage has one file per course. For example:
*IDBx-IDB10x-T32017-*student_courseaccessrole-prod-analytics.sql

##### ODS tables
There are two ODS tables. One is the anonymouse version of the otherone.

|KIC_ODS_MOOCS|Granularity|
|--|--|
|USER_ENROLL| 1 row per user enrollment in one course|
|USER_ENROLL_ANONYM | 1 row per anonymouse user enrollment in one course|

## Author

Alejandro Rodríguez Cuéllar


