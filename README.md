Bright Coffee Shop Sales Analysis
Project Overview
The goal of this analysis is to assist the Bright Coffee Shop CEO in achieving the mission of growing company revenue and improving product performance

By extracting actionable insights from historical transactional data, this project identifies key revenue drivers and peak operating hours to support data-driven decision-making

Technology Stack & Architecture
The project followed a structured data lifecycle using the following tools:
Planning & Design: Miro was used to design the Data Flow & Architecture Diagram, outlining the data source, ETL pipeline, and storage

Data Processing: Raw Excel data was converted to CSV and loaded into Databricks

ETL & SQL: SQL was utilized for transformations, including calculating total_amount (unit_price * transaction_qty), casting data types, and creating 30-minute time buckets

Visualization & Analysis: Processed data was exported to Microsoft Excel to create pivot tables and dashboards

Key Insights & Analysis Results
The analysis revealed significant growth and specific performance patterns:
Revenue Growth: There was a 104% increase in total revenue from January to June

Store Performance: All three stores (Astoria, Hell’s Kitchen, and Lower Manhattan) saw revenue increases of nearly 50% during the same period

Category Leaders: Coffee is the highest income generator, accounting for 39% of total revenue

Peak Sales Times: Morning sales generate the highest revenue at 54%, while evening sales are the lowest at 15%

Spending Habits: Most morning revenue comes from the "Low Spend" bucket (transactions less than R100)

Weekly Trends: Sales remain high during weekdays but experience a significant drop over weekends

Underperforming Areas: Products like Branded items, Coffee Beans, and Loose Tea recorded lower sales volumes

Strategic Recommendations
To GROW REVENUE and optimize performance, the following actions are recommended:
Targeted Marketing: Implement campaigns specifically for slow time slots (evenings) and weekends to boost traffic

Inventory Optimization: Increase the stock of best-selling items to ensure they are always available
Product Diversification: Introduce new product categories to replace or complement slow-selling products like loose tea
Customer Experience: Offer free Wi-Fi and complimentary cookies to encourage "sit-in" customers, as data suggests a preference for the shop's comfort and service

Future Roadmap
The implementation plan is divided into phases to ensure sustainable growth:
Q1 - Q2 (Efficiency & Reach):
Transition to automated daily sales reportin
Expand analysis to multiple locations and deploy mobile coffee shops near residential areas for weekend coverage

Q3 (Loyalty):
Implement loyalty programs specifically tailored to peak customer time slots to increase retention

Repository Contents
Miro_Architecture_Diagram.pdf: Structural overview of the data pipeline
.
Processed_Dataset.xlsx: Spreadsheet containing the Pivot Tables and Charts
.
Analysis_Code.sql: The SQL script used for ETL and data grouping in Databricks
.
CEO_Presentation.pptx: The final presentation summarizing methodology and insights
.

--------------------------------------------------------------------------------
This project demonstrates how historical data can be transformed into a strategic asset to reach the highest standards in product offerings
