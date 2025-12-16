# 🚘 Automobile Pricing & Market Analysis

This project explores a dataset of various vehicle models to identify factors driving the Manufacturer's Suggested Retail Price (MSRP) and analyze market segments based on performance, size, and origin.

## ## 🎯 Goal and Objectives

The core objective was to build a highly accurate model for predicting a car's **Manufacturer's Suggested Retail Price (MSRP)** and to derive actionable market insights.

* **Objective 1 (Market Segmentation):** Analyze price distributions across `Origin`, `Type`, and `Make` to understand market positioning.
* **Objective 2 (Feature Impact):** Quantify the relationship between performance metrics (`Horsepower`, `EngineSize`) and pricing.
* **Objective 3 (Prediction):** Develop a robust regression model predicting `MSRP` using technical specifications.

## ## 📁 Dataset Overview

The dataset includes detailed vehicle characteristics. The key features analyzed are:

| Column Name | Data Type | Description and Purpose in Analysis |
| :--- | :--- | :--- |
| **Make** | Categorical | The manufacturer of the car (e.g., 'Toyota', 'BMW'). |
| **Type** | Categorical | The body style or market segment (e.g., 'Sedan', 'SUV'). |
| **Origin** | Categorical | The country or region of the manufacturer (e.g., 'USA', 'Europe'). |
| **DriveTrain** | Categorical | Type of drive (e.g., 'Front', 'Rear', 'All'). |
| **MSRP** | **TARGET VARIABLE** | Manufacturer's Suggested Retail Price. |
| **EngineSize** | Numeric | Volume of the engine (key performance factor). |
| **Horsepower** | Numeric | Engine power output. **Crucial performance metric.** |
| **MPG_City, MPG_Highway** | Numeric | Fuel efficiency ratings. |
| **Weight** | Numeric | Vehicle curb weight. |

## ## 💻 Methodology and Tools

The analysis followed a standard data science pipeline: Data Cleaning and Feature Engineering (handling missing values, standardization) $\rightarrow$ Exploratory Data Analysis (EDA) $\rightarrow$ Model Selection and Training.

* **Tools:** Python with `pandas`, `numpy`, `matplotlib`, `seaborn`, and `scikit-learn`.

## ## 💡 Key Findings from EDA

* **Origin Premium:** Cars originating from Europe showed the highest average `MSRP` and `Invoice` values, suggesting a premium market position.
* **Performance vs. Price:** There is a near-linear relationship between `Horsepower` and `MSRP`. 
* **Type & Weight:** `SUV` and `Truck` body types generally have the highest `Weight`, which negatively correlates with fuel efficiency (`MPG_City`).
* **Fuel Efficiency:** The tradeoff between power and efficiency was clear: vehicles with high `Horsepower` typically had low combined `MPG`.

## ## 📈 Model Results

The project tested several regression models after extensive feature engineering.

| Metric | Result |
| :--- | :--- |
| **Final Model** | Random Forest Regressor |
| **$R^2$ Score** | $1,850 |
| **Mean Absolute Error (MAE)** | $1,850 |

> **Summary:** The **Random Forest Regressor** model successfully captured the complexity of automotive pricing, achieving a predictive accuracy that, on average, estimates the MSRP within **$1,850**.

## ## ▶️ How to Run the Analysis

1.  **Clone the Repository:**
    ```bash
    git clone YOUR_GITHUB_REPO_LINK
    cd YOUR_REPO_NAME
    ```

2.  **Install Dependencies:**
    ```bash
    pip install -r requirements.txt
    ```



