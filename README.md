# fishery-analytics-portfolio

A data analytics portfolio project based on a simulated fishery business. This project demonstrates real-world skills in data cleaning, SQL analysis, Python-based EDA, and dashboard creation using Power BI. The data and workflows reflect responsibilities from the role of a Fishery Business Data Analyst.

# Project Overview
This project analyzes fish catch operations, auction pricing, vessel efficiency, and buyer performance using realistic mock data. It simulates daily operations of a small-scale commercial fishery.

# Key Goals:
- Identify seasonal trends in catch volume
- Compare auction prices against market prices
- Measure vessel performance efficiency
- Highlight top buyers by purchase volume

# 📂 Dataset Structure

# Tables:
- `CatchLogs` – Daily fish catches by vessel
- `AuctionPrices` – Auction price per fish type by buyer
- `MarketPrices` – Market reference price per day
- `Vessels` – Vessel details
- `Buyers` – Auction buyers
- `VesselPerformance` – Operational efficiency metrics
- `FishTypes` – Lookup table for fish species

# SQL Insights

# Queries Included:
- Catch volume by month and fish type
- Auction price trends vs market price
- Vessel fuel efficiency (Catch/Unit Fuel)
- Top buyers by total auction spend
- Daily catch-to-auction performance

All queries are included in `sql/fishery_analytics_queries_insights.sql`.

# Jupyter Notebook

The notebook `notebooks/fishery_analysis_notebook.ipynb` includes:
- Data loading & cleaning
- Catch volume visualizations
- Auction vs. market price plots
- Vessel efficiency metrics
- Top buyer bar chart

# Power BI Dashboard "coming soon"

Power BI is used:
- Connect to MySQL or CSVs
- Pages: Catch Trends, Auction Insights, Vessel KPIs, Buyer Rankings
- Export as `.pbix` and screenshot for presentation

# Tools Used
- MySQL
- Jupyter Notebook (Pandas, Matplotlib, Seaborn)
- Power BI
- Excel (for CSV prep)

# Author
Thiri Htet (Clara) 
Business Data Analyst  

# Repository Structure
/Fishery-Analytics-Portfolio
├── README.md
├── LICENSE
├── /datasets
│   ├── catch_logs.csv
│   ├── auction_prices.csv
│   ├── market_prices.csv
│   ├── vessels.csv
│   ├── buyers.csv
│   ├── vessel_performance.csv
│   └── fish_types.csv
├── /sql
│   └── fishery_analytics_database.sql
│   └── fishery_analytics_queries_insights.sql
├── /Jupyter
│   └── fishery_analysis_notebook.ipynb
├── /powerbi
│   └── fishery_dashboard.pbix (coming soon)

# License
This project is licensed under the MIT License - see the LICENSE file for details.
This project is for educational and professional portfolio use. All mock data is generated and does not represent real business records.
