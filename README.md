# Classic-Models-Sales-Analysis-using-MySQL-POWER-BI
This projects aims to explore the business sales data of Classic Models, a retailer of scale models of classic cars, to understand the sale trends of different products,customer behaviour and top performing products.

Overview
The data set I used for this project can be found here Script+for+Classic+Models.txt .And it contains three years worth of sales data of different product lines across different countries. The aim of this project is to understand the overall sales performance of this company.

Problem Statement:
1. Give an overview of sales for 2004.
2. Give a breakdown of products that are commonly purchased together and the product which are rarely purchased together.
3. Show breakdown of sales by customer's credit limits.
4. Show customer's sales value change from previous their order.
5. Show Office sales by customer country.
6. Show customers affected by late shipping.
7. Give breakdown of customers who go over their credit limits.

For this project I wanted to get some more numerical data using a relational database with multiple tables. This will allow me to showcase some different analytical skills by using:

1.Joins in SQL
2.Pivot tables in Excel
3.Data visualisation is Power BI

SQL
I've decided to start with SQL, so I've imported the data into MySQL workbench.

I've also downloaded the Sample Database's Diagram that shows the relationships between the tables. This way I can easily find the primary and foreign keys that I can use to connect two separate tables when performing joins.
![image](https://github.com/ishubagla/Classic-Models-Sales-Analysis-using-MySQL-POWER-BI/assets/151032838/98b37333-29e3-4722-860a-2b65f83d2a12)
I have shown the execution of each problem statement in separate SQL files.

MS EXCEL
After running the SQL files i have copied the output tables from each QUERY to my excel spreadsheet and created pivot tables out of them.

Power BI
The last part of my project contains visualization of the sales analysis. For this I've imported Classic Models data from MySQL to Power BI. Ibhave build visuals showing Classic Model sales dashboard of tables present in the dataset. I have also added two buttons to navigate between two pages and between sales & net profit.

Conclusion
Thank you.
This was my first try using SQL for data analysis. Looking at the dataset again, I believe there’s a lot more exploration that can be done and more insight that can be gotten which I intend to do to hone my data analytics skills. However, here an insight from this analysis.

In both years when the company operated full through out the year, the month of November had the highest sales. This may be due to the approaching holiday season. Studies have found that customers are more likely to make purchases towards the end of the year.
 

