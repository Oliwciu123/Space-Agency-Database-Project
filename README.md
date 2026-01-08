# 🚀 Space-U: Integrated Space Agency Management System

## 📝 Project Overview
This project presents a comprehensive database architecture designed for "Space-U," a modern interplanetary travel agency. The system is engineered to handle the full operational cycle of a space agency: from technical fleet management (rockets, spacecraft), through mission logistics (destinations, expeditions), to customer service, financial backing (sponsors), and post-flight satisfaction analysis.

## ⚠️ Language Note
Please note that while this documentation is in English, the **database schema (table and column names), Jupyter Notebook cell descriptions, and internal project comments are in Polish**, as the project was originally developed for a Polish university course. All filenames are also kept in their original Polish form for consistency with the repository content.

## 🛠️ Tech Stack
* **Database:** MariaDB / MySQL
* **Language:** Python 3.x
* **Libraries:** `SQLAlchemy`, `Pandas`, `Matplotlib`, `Faker`
* **Tools:** Jupyter Notebook, SQL

## 📂 Project Structure & Execution Guide

Follow these steps to set up and explore the project:

### **Step 1: Create the Database**
**File:** `baza.sql`  
This SQL file contains the complete definition of the relational database structure in MariaDB. It creates all tables required for the system, including:
* **Obsluga** – employee data,
* **Wyprawy, Rodzaje_Wypraw, Kierunki_Wypraw** – information about space missions, their types, destinations, duration, and vehicles,
* **Klienci, Rezerwacje, Opinie_Klientow** – customer data, bookings, and reviews,
* **Koszty, Rakiety, Pojazdy_Kosmiczne, Typy_Pojazdow** – technical and financial infrastructure,
* **Sponsorzy, Wspieramy, Partnerzy_Strategiczni** – data on collaborations, support, foundations, and sponsors.

**Action:** Import this file into your MariaDB database to initialize the schema.

### **Step 2: Data Population**
**File:** `wypełnianie_bazy.ipynb`  
A Jupyter Notebook written in Python using SQLAlchemy. It automatically generates and inserts realistic data into the previously created tables. It includes:
* Filling tables: Klienci, Rezerwacje, Opinie_Klientow, Sponsorzy, Wspieramy, Partnerzy_Strategiczni,
* Randomly assigning expedition ratings and customer comments,
* Handling complex relationships between entities (e.g., id_pojazdu, id_klienta, id_fundacji).

**Action:** Run this notebook after creating the database to fill it with sample data.

### **Step 3: Data Analysis**
**File:** `analiza_bazy_danych.ipynb`  
An analytical notebook designed for data exploration and verification using Pandas and Matplotlib. It includes:
* Summaries of booking counts, ratings, and customer totals,
* Ranking of expeditions based on average ratings,
* Data visualizations and statistics.

**Action:** Run this notebook after the database has been populated to analyze and present the data.

## 📐 Logical Structure & Normalization (3NF)

THE PROJECT WAS DEVELOPED WITH A FOCUS ON ARCHITECTURAL INTEGRITY:

* **RELATIONAL STRUCTURE:** THE SYSTEM INTEGRATES TECHNICAL DATA (RAKIETY, POJAZDY), LOGISTICS (KIERUNKI), AND PERSONNEL (OBSŁUGA, KLIENCI) THROUGH THE CENTRAL **WYPRAWY** ENTITY.
* **ELIMINATION OF REDUNDANCY:** BY APPLYING THE THIRD NORMAL FORM (3NF), INFORMATION IS STORED WITHOUT UNNECESSARY REPETITION, ELIMINATING THE RISK OF DATA ANOMALIES.
* **FUNCTIONAL DEPENDENCIES:** EVERY NON-KEY ATTRIBUTE IS FULLY FUNCTIONALLY DEPENDENT ON THE PRIMARY KEY (E.G., **ID_MIEJSCA → GRAWITACJA**).
* **REFERENTIAL INTEGRITY:** THE SYSTEM ENFORCES FOREIGN KEYS TO ENSURE DATA CONSISTENCY ACROSS ALL TABLES.

---
*University Project - Database Systems Course.*
