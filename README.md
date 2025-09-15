# **APEAMCET-2022** **Ranks-Cutoff** **Analysis** & **Prediction**
<img width="1699" height="732" alt="image" src="https://github.com/user-attachments/assets/6eb3d0d4-fa90-4397-8e1a-0e5a9f07993c" />

## Introduction: 
- APEAMCET is Entrance Exam For Undergrad Engineering & Pharmacy Courses in the state of Andhra Pradesh India
- Each Year Exam is conducted for 10+2 Students (Maths, Pharma, Agri) in 13 Districts with more than 290+ Colleges in 2 Regions
- Admissions into colleges are done based on Student Rank but it depends upon Rank, Region, Gender, Branch and Category Factors

## Motivation:
 There are 2 Reasons for completing this project
 1. I am motivated to complete this project as my cousin seeks my assistance in identifying the college and branch for his rank, which requires navigating a 60-page PDF using **CTRL + F**.
 2. Since I'm already upskilling in **Data** **Science**, this thought came to my mind why can't Data Analysis simplify the process of finding Rank Details with other parameters
    
## Process:
  ### 1. Data Collection :
  - I Found Data on APEAMCET official website [Clickhere](https://cets.apsche.ap.gov.in/EAPCET/PDF/APEAPCET2023_2022LASTRANKDETAILS.pdf) pdf consists of 60 pages
  ### 2. Data Preparation:
  - Data is in pdf format so I couldn't do any Analysis at least any Manipulation So I decided to change this to CSV/excel by using Pandas
  - I used pdf plumber & pandas for Extracting Data from PDF to CSV [Click Here](https://github.com/lokeshmadiga/apeamcet2022-Ranks-cutoff/blob/apeamcet_u1/pdf_csv_using_pandas.ipynb) For Detailed Python Code
  ### 3. Data Preprocessing / Data Cleaning:
  - Even though I have changed to CSV 30 Columns are not required & we can not perform any analysis with that data
  - So I Decided to Transform 18 Columns (All Categories+Gender) i.e, OC_EWS_GIRLS to 3 Separate Columns (Category, Gender, Rank) which is now reduced to 15 Columns
  - Still, Some Messy Data is there (Casing, Naming Conventions) I Handled with the help of SQL
  - Data Transformation Python Code : [Click Here](https://github.com/lokeshmadiga/apeamcet2022-Ranks-cutoff/blob/apeamcet_u1/apeamcet_data_transformation.ipynb)
  - Data Cleaning through SQL :  [Click Here](https://github.com/lokeshmadiga/apeamcet2022-Ranks-cutoff/blob/apeamcet_u1/SQL_Queries.sql)
 ### 4. Exploratory Data Analysis :
  - For this data, I've performed some EDA Operations such as Descriptive stats
  - Distributions
  - Correlation Between Numerical Attributes
  - EDA Through Python : [Click Here](https://github.com/lokeshmadiga/apeamcet2022-Ranks-cutoff/blob/apeamcet_u1/APEAMCET_EDA.ipynb)
  - EDA Through SQL : [Click Here](https://github.com/lokeshmadiga/apeamcet2022-Ranks-cutoff/blob/apeamcet_u1/SQL_Queries.sql)
 ### 5. Dashboard :
  - I used Tableau For Building Dashboard
  - I Found out that KPI is the Aggregate Values of Districts, Colleges, universities, Regions and Branches
  - I used Multiple slicers to Easy Rank Picking Each Parameter wise
  - I used different Images such as Exam Conducting Instution, APSCHE Logos [Here](https://cets.apsche.ap.gov.in/EAPCET/EapcetHomepages/ImportantDates.aspx)
  - You Can Find the Dashboard in my Tableau Public profile along with different Visualization [Tableau Dashboard](https://public.tableau.com/app/profile/lokesh.madiga)
