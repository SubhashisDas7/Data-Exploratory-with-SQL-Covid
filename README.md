# Data-Exploratory-with-SQL-Covid
### **Project Objective:**
The objective of this **COVID-19 Data Analysis** project is to examine **COVID-19 cases, deaths, and vaccinations** globally. The analysis helps in understanding infection rates, death percentages, vaccination progress, and the impact on different countries and continents. The insights derived from this study can help policymakers, researchers, and health professionals make data-driven decisions to combat the pandemic effectively.

---

### **Key Insights:**
#### **1. COVID-19 Cases and Deaths Analysis**
- Extracted **total cases, new cases, total deaths, and population** for different locations.
- **Death Percentage Calculation:**  
  - For countries containing "states" in their name (e.g., the United States), **death percentage** was calculated as:  
    \[
    \frac{\text{Total Deaths}}{\text{Total Cases}} \times 100
    \]
  - This helps in understanding the severity of COVID-19 across different regions.

- **Population Infection Rate Calculation:**  
  - Measured the percentage of the **population infected** using:  
    \[
    \frac{\text{Total Cases}}{\text{Population}} \times 100
    \]

- **Top Affected Countries:**  
  - The highest number of **total infections** and the **percentage of the population infected** were identified.

- **Total Deaths Per Country & Continent:**  
  - Countries and continents with the **highest death toll** were identified, helping in determining regions with the most severe impact.

- **Global Death Rate:**  
  - The overall **death percentage** worldwide was calculated using:
    \[
    \frac{\sum \text{New Deaths}}{\sum \text{New Cases}} \times 100
    \]
  - This provides an overall measure of the pandemic’s lethality.

---

#### **2. COVID-19 Vaccination Analysis**
- **Rolling Sum of Vaccinations:**
  - Used a **window function** to calculate the cumulative number of people vaccinated in each country.

- **Percentage of Population Vaccinated:**
  - Used a **Common Table Expression (CTE)** and **Temporary Table** to compute:
    \[
    \frac{\text{Rolling People Vaccinated}}{\text{Population}} \times 100
    \]
  - This metric helps in evaluating **vaccination coverage** across different locations.

- **View Creation for Future Analysis:**
  - Created a **view** named `PercentPopulationVaccinated` to store vaccination progress, allowing for further **visualization** and **reporting**.

---

### **Conclusion:**
- The **COVID-19 pandemic has significantly impacted** different regions, with varying infection and mortality rates.
- Countries with **higher infection rates** may have **lower vaccination coverage**, indicating a need for stronger public health interventions.
- **Vaccination progress analysis** provides insights into which countries have effectively controlled the virus through immunization.
- The **global death rate** varies significantly, showing the impact of **healthcare infrastructure, early response measures, and vaccination campaigns**.
- Policymakers should focus on **boosting vaccinations, reducing mortality rates, and improving pandemic response strategies**.

Would you like additional visualizations or insights on a specific area? 📊📈
