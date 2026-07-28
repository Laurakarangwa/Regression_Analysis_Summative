# Medical Insurance Charges Prediction System

## Description of Mission and Problem

This project aims to predict medical insurance charges using machine learning based on demographic and health-related information. It addresses the problem of estimating insurance costs accurately to support informed decision-making. Three regression models were evaluated, and the best-performing model was deployed through a FastAPI API and integrated into a Flutter mobile application.

---

## Dataset Description

The project uses the **Medical Cost Personal Dataset (insurance.csv)**, which contains **1,338 records** and **7 variables** describing individuals and their medical insurance charges. The dataset includes demographic, lifestyle, and regional information used to train machine learning models to predict insurance costs.

**Dataset Features**
- Age
- Sex
- BMI
- Number of Children
- Smoker Status
- Region
- Insurance Charges (Target Variable)

**Dataset Source**

Kaggle – Medical Cost Personal Dataset

https://www.kaggle.com/datasets/mirichoi0218/insurance

---

## Dataset Visualizations

### Figure 1: Correlation Heatmap


<img width="625" height="528" alt="image" src="https://github.com/user-attachments/assets/24f47784-2b36-4837-8785-58da93814ce0" />


**Description**

The correlation heatmap illustrates the relationships between numerical variables in the dataset. It shows that **age** and **BMI** have positive relationships with insurance charges, while **children** has a relatively weaker relationship. This visualization helped identify the most influential numerical features used during model training.

---

### Figure 2: BMI vs Insurance Charges Scatter Plot

<img width="713" height="470" alt="image" src="https://github.com/user-attachments/assets/169d99e1-d224-41bc-a21b-d0402dc6e3ed" />


**Description**

The scatter plot shows the relationship between BMI and medical insurance charges. It demonstrates that insurance charges generally increase with BMI, especially for certain individuals, making BMI an important predictor in the regression models.

---

## Public API Endpoint

**Swagger UI:**

https://insurance-prediction-api-eqjo.onrender.com/docs

**Prediction Endpoint:**

POST https://insurance-prediction-api-eqjo.onrender.com/predict

Use the Swagger UI to test the API by providing the required input values.

---

## YouTube Demo

**YouTube Link:**

https://www.youtube.com/watch?v=5cEtdYxK9js

---

## How to Run the Mobile App

### Prerequisites

- Flutter SDK installed
- Android Studio or Visual Studio Code
- Android Emulator or a physical Android device with internet access

### Steps

1. Clone the repository:

```bash
git clone https://github.com/Laurakarangwa/Regression_Analysis_Summative.git
```

2. Navigate to the Flutter project:

```bash
cd Summative/FlutterApp
```

3. Install the project dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

5. Enter the required input values:
   - Age
   - BMI
   - Number of Children
   - Sex (0 = Female, 1 = Male)
   - Smoker (0 = No, 1 = Yes)
   - Region Northwest (0/1)
   - Region Southeast (0/1)
   - Region Southwest (0/1)

6. Press the **Predict** button to receive the predicted medical insurance charge from the deployed FastAPI API.

---

## Technologies Used

- Python
- FastAPI
- Scikit-learn
- Pandas
- Pydantic
- Flutter
- HTTP Package
- Render (Deployment)

---

## Repository Structure

```text
Summative/
├── API/
│   ├── prediction.py
│   ├── best_insurance_model.pkl
│   ├── scaler.pkl
│   └── requirements.txt
│
├── FlutterApp/
│   └── Flutter Project
│
└── linear_regression/
    ├── multivariate.ipynb
    └── insurance.csv
```

---

## Author

**Laura Karangwa Kwizera**

African Leadership University
