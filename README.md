# Data-science-project
This repository contains the project related the data science especially the eda on the different dataset like zomato sales analysis, ipl dataset and many more.


## 1. EDA on Zomato Data

We did the exploratory data analysis on Zomato sales data and found imp conclusion from it.

-Read the csv and excel file to import the dataset.

techs used: python pandas, matplotlib, seaborn, numpy

## 2. EDA on World Population Dataset


Here is what i did:
- At first we import the required library: numpy, pandas, seaborn, matplotlib
- load the dataset :reading the csv file
- analyzing the dataframe
- viewed the distribution of  the population and also based on the contient
- find out top 10 countries by the 2023 population
- plot the bar plot, for the country vs population


## 3. Weather Data analysis with pandas

We did the data analysis on the weather dataset have the columns :weather, wind_speed, humidity, temperature, visibility and datetime.

summary what i did here:
- import the required library and read the dataset(from the csv file)
- Explore on the dataset(checked null values, stats of the dataset, head_values, types of data, columns, shape etc)
- findout the unique temperature , weather based on the type of weather condition
- rename some columns
- findout the stats of the diff columns(mean, variance, std)
-- and also the different questions;

## 4. Walmart Sales data Cleaning and Analysis

# Walmart Data Analysis: End-to-End SQL + Python Project P-9

## Project Overview

![Project Pipeline](walmart_project-piplelines.png)


This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions. The project is ideal for data analysts looking to develop skills in data manipulation, SQL querying, and data pipeline creation.

---

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Visual Studio Code (VS Code), Python, SQL (MySQL and PostgreSQL)
   - **Goal**: Create a structured workspace within VS Code and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
      - Use the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into your project.

### 3. Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
   - **Storage**: Save the data in the `data/` folder for easy reference and access.

### 4. Install Required Libraries and Load Data
   - **Libraries**: Install necessary Python libraries using:
     ```bash
     pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
     ```
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Load Data into MySQL and PostgreSQL
   - **Set Up Connections**: Connect to MySQL and PostgreSQL using `sqlalchemy` and load the cleaned data into each database.
   - **Table Creation**: Set up tables in both MySQL and PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
   - **Documentation**: Keep clear notes of each query's objective, approach, and results.

### 10. Project Publishing and Documentation
   - **Documentation**: Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.
   - **Project Publishing**: Publish the completed project on GitHub or any other version control platform, including:
     - The `README.md` file (this document).
     - Jupyter Notebooks (if applicable).
     - SQL query scripts.
     - Data files (if possible) or steps to access them.

---

## Requirements

- **Python 3.8+**
- **SQL Databases**: MySQL, PostgreSQL
- **Python Libraries**:
  - `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`, `psycopg2`
- **Kaggle API Key** (for data downloading)

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url>
   ```
2. Install Python libraries:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your Kaggle API, download the data, and follow the steps to load and analyze.

---

## Project Structure

```plaintext
|-- data/                     # Raw data and transformed data
|-- sql_queries/              # SQL scripts for analysis and queries
|-- notebooks/                # Jupyter notebooks for Python analysis
|-- README.md                 # Project documentation
|-- requirements.txt          # List of required Python libraries

```
---

## Results and Insights

This section will include your analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

## Future Enhancements

Possible extensions to this project:
- Integration with a dashboard tool (e.g., Power BI or Tableau) for interactive visualization.
- Additional data sources to enhance analysis depth.
- Automation of the data pipeline for real-time data ingestion and analysis.

---


## Acknowledgments

- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.

---


## 5. Data Analysis of the Pizza Sales using SQL


In this project,at first we get the dataset from the github and extract it. We have mainly four csv files:pizza, pizza_types, orders and order_details.

We created each table using query:
### 1. Table creating the for the pizza
```sql
CREATE TABLE pizza(
pizza_id text,
pizza_type_id text,
size text,
price decimal(10,2)
);

```

import the dataset csv from the folder and load it,now we can get the datset in our table.Similarly for another table as:

### 2. Table creating the for the pizza_types

```sql
-- creating the table pizza_types
CREATE TABLE pizza_types(
pizza_type_id text,
name text,
category text,
ingredients text
);
```

### 3. Table creating the for the orders

```sql
CREATE TABLE orders(
order_id int primary key,
date date not null,
time time not null
);

```

### 3. Table creating the for the orders_details
```sql
CREATE TABLE order_details(
order_details_id int primary key,
order_id int not null,
pizza_id text not null,
quantity int not null
);
```


## Basic Questions solved:


### 1. Retrieve the total number of the order placed:

```sql
SELECT COUNT(*) as total_order
FROM orders;

```

### 2. Calculate the total revenue generated from pizza sales:

```sql
SELECT SUM(p.price*od.quantity) as total_renenue
FROM pizza p
JOIN order_details od
ON p.pizza_id = od.pizza_id;

```

### 3. Identify the highest-priced pizza.
```sql
SELECT ptypes.name, p.price as high_price
FROM pizza p
INNER JOIN pizza_types ptypes
ON p.pizza_type_id = ptypes.pizza_type_id
order by p.price desc
limit 1;
```

### 4. Identify the most common pizza size ordered:
```sql
SELECT COUNT(od.order_id) as sales_count,p.size FROM pizza p
JOIN order_details od ON
p.pizza_id = od.pizza_id
GROUP BY p.size
order by sales_count desc
limit 1
```


### 5. List the top 5 most ordered pizza types along with their quantities.

```sql
 SELECT ptypes.name, sum(od.quantity) as quantity
FROM pizza_types ptypes 
JOIN pizza p ON 
p.pizza_type_id = ptypes.pizza_type_id
JOIN order_details od
ON od.pizza_id = p.pizza_id
group by ptypes.name
order by quantity desc
limit 5;
```

## Intermediate question solved:

### 1. Join the necessary tables to find the total quantity of each pizza category ordered.

```sql
SELECT ptypes.category, sum(od.quantity) as quantity
FROM pizza_types ptypes
JOIN pizza p ON
p.pizza_type_id = ptypes.pizza_type_id
JOIN order_details od ON
od.pizza_id = p.pizza_id
GROUP BY ptypes.category
;

```


### 2. Determine the distribution of orders by hour of the day

```sql
SELECT EXTRACT(HOUR FROM time) as hour,
COUNT(order_id) as total_count
FROM orders
GROUP BY hour
order by total_count desc;
```

### 3. Join the relevant tables to find the category-wise distribution of the prizes

```sql
SELECT ptypes.category ,count(od.order_id) as total_count
FROM pizza_types ptypes
JOIN pizza p ON
p.pizza_type_id = ptypes.pizza_type_id
JOIN order_details od ON
od.pizza_id = p.pizza_id
GROUP BY ptypes.category;

```

### 4. Group the orders by date and calculate the average number of pizzas ordered per day.

```sql
SELECT avg(avg_ordered) as avg_per_day FROM
(
SELECT o.date as ordered_date, SUM(od.quantity) as avg_ordered
FROM orders o
JOIN order_details as od
ON o.order_id = od.order_id
GROUP BY o.date) as order_quantity;

```

### 5. Determine the top 3 most ordered pizza types based on revenue.

```sql
SELECT ptypes.name as pizza_types, SUM(p.price*od.quantity) as total_revenue
FROM pizza_types ptypes
JOIN pizza p ON
p.pizza_type_id = ptypes.pizza_type_id
JOIN order_details od ON
od.pizza_id = p.pizza_id
GROUP BY ptypes.name
Order by total_revenue desc
limit 3;
```