# Medical Insurance Charges Prediction System

## Description

This project predicts medical insurance charges using machine learning based on user information such as age, BMI, number of children, smoking status, sex, and region. Three regression models were evaluated—Linear Regression, Decision Tree Regression, and Random Forest Regression. The Random Forest model achieved the best performance and was deployed as a FastAPI service, then integrated into a Flutter mobile application for real-time predictions.

---

## Public API Endpoint

**Swagger UI:**

https://insurance-prediction-api-eqjo.onrender.com/docs

**Prediction Endpoint:**

POST https://insurance-prediction-api-eqjo.onrender.com/predict

Use the Swagger UI to test the API by providing the required input values.

---

## YouTube Demo

Video Demo (Maximum 7 minutes):

**YouTube Link:**

https://YOUR_YOUTUBE_VIDEO_LINK

---

## How to Run the Mobile App

### Prerequisites

- Flutter SDK installed
- Android Studio or Visual Studio Code
- Android Emulator or a physical Android device

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

```
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

Bachelor of Software Engineering  
African Leadership University
