# Smart Score 

An automated ELT pipeline that efficiently processes student data to deliver performance insights. Tech Stack - Snowflake, dbt, SQL, Python, Pandas, and Fivetran.
<br/>

<img src="https://github.com/dbt-tools/smart_score/assets/91208540/598c30d0-13e6-4165-a2b8-abf5f6a34b6d" alt="smart-score-logo" width="300"><br/>

### dbt Lineage
A holistic overview of how data moves through a pipeline, beginning at its source, moving through stages of transformation, and ending at its point of use. It is typically represented as a Directed Acyclic Graph(DAG).
<img src="https://github.com/dbt-tools/smart_score/assets/91208540/03453b5e-8ef1-4bf5-8b01-b672d34d38f5" alt="smart-score-logo" width="1000"><br/>


The `dim_cohort_avg_progression` model is materialized as a table within a Snowflake Database, enabling queries for insights and the creation of charts to visualize data

1. Data Origin: The initial data is scraped from a Google Sheet.
2. Staging: Once scraped, the data is staged, acting as a buffer for preliminary processing adjustments before further processing.
3. Transformation: The table is unpivoted, converting it from a wide to a long format. Additionally, dates and scores are parsed to ensure consistency throughout the data.
4. Full Class: Union the two `intermediate` tables for each class into a unified dataset.
5. Analysis and visualization performed using SQL and Python

Raw Data:
  
| First | Last | 02/3/23 | 3/09/23 |
|-------|------|---------|---------|
| Some  | One  | 720     | 730     |

Transformation:
  
| First | Last | Date    | Score |
|-------|------|---------|-------|
| Some  | One  | 02/03/23 | 720  |
| Some  | One  | 3/09/23  | 730  |

### `dim_cohort_avg_progression` Lineage 
<img width="1000" alt="model-lineage" src="https://github.com/dbt-tools/smart_score/assets/91208540/16b9bb3a-68d0-47d3-a896-f40fe7ec564a">

### Monthly Assessment Progression
<img width="700" alt="assessment" src="https://github.com/dbt-tools/smart_score/assets/91208540/a91e836b-ae6b-4db9-81bd-37c87940d61a">

### System Design
<img width="1000" alt="system-design" src="https://github.com/dbt-tools/smart_score/assets/91208540/50999951-b8d9-4871-9c08-91da757dd8e8"><br/>

### Technologies Used
- Snowflake
- dbt
- SQL
- Python
- Fivetran


