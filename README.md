# 🚀 Space-U: Integrated Space Agency Management System

## 📝 Project Overview
This project presents a comprehensive database architecture designed for "Space-U," a modern interplanetary travel agency. The system is engineered to handle the full operational cycle of a space agency: from technical fleet management (rockets, spacecraft), through mission logistics (destinations, expeditions), to customer service, financial backing (sponsors), and post-flight satisfaction analysis.

## ⚠️ Language Note
Please note that while this documentation is in English, the **database schema (table and column names), Jupyter Notebook cell descriptions, and internal project comments are in Polish**, as the project was originally developed for a Polish university course.

## 🛠️ Tech Stack
* **Database:** MariaDB / MySQL
* **Language:** Python 3.x
* **Libraries:** * `SQLAlchemy` (ORM & Database communication)
    * `Pandas` (Data processing)
    * `Matplotlib` / `Seaborn` (Data visualization)
    * `Faker` (Automated mass data seeding)
* **Tools:** Jupyter Notebook, SQL

## 📂 Repository Structure
* `/sql/baza.sql` – Core SQL script defining table structures, primary keys, and constraints (Polish naming convention).
* `/notebooks/01_data_seeding.ipynb` – Python script automating the database population process.
* `/notebooks/02_data_analysis.ipynb` – Analytical module generating business reports and visual insights.
* `/docs/` – Project documentation, including the ERD diagram and functional dependencies.

## 📐 Logical Structure & Normalization (3NF)

THE PROJECT WAS DEVELOPED WITH A FOCUS ON ARCHITECTURAL INTEGRITY AND ADHERENCE TO RELATIONAL DATABASE DESIGN PRINCIPLES:

* **RELATIONAL STRUCTURE:** THE SYSTEM IS BUILT AROUND THE CENTRAL **WYPRAWY** (EXPEDITIONS) ENTITY, WHICH INTEGRATES TECHNICAL DATA (RAKIETY, POJAZDY), LOGISTICS (KIERUNKI), AND PERSONNEL (OBSŁUGA, KLIENCI).
* **ELIMINATION OF REDUNDANCY:** BY APPLYING THE THIRD NORMAL FORM (3NF), EVERY PIECE OF INFORMATION (E.G., CUSTOMER DATA OR ROCKET SPECIFICATIONS) IS STORED ONLY ONCE, ELIMINATING THE RISK OF ANOMALIES DURING DATA UPDATES OR DELETION.
* **FUNCTIONAL DEPENDENCIES:** EVERY NON-KEY ATTRIBUTE IS FULLY FUNCTIONALLY DEPENDENT ON THE PRIMARY KEY (E.G., **ID_MIEJSCA → GRAWITACJA, WSPÓŁRZĘDNE**). THE ABSENCE OF TRANSITIVE DEPENDENCIES ENSURES HIGH PERFORMANCE AND DATA CONSISTENCY.
* **REFERENTIAL INTEGRITY:** THE SYSTEM ENFORCES FOREIGN KEYS, PREVENTING THE CREATION OF "ORPHAN" RECORDS, SUCH AS RESERVATIONS FOR NON-EXISTENT CUSTOMERS OR MISSIONS.



## 🚦 Setup & Execution Guide

1.  **Schema Initialization:** Import the `sql/baza.sql` file into your MariaDB/MySQL server to create the database skeleton.
2.  **Data Generation:** Open `notebooks/01_data_seeding.ipynb`. Update your database credentials in the `create_engine` section and run all cells to populate the system with realistic test data.
3.  **Business Analysis:** Run `notebooks/02_data_analysis.ipynb` to generate sales reports, technical statistics, and export the final summary to an HTML report.

---
*University Project - Database Systems Course.*
