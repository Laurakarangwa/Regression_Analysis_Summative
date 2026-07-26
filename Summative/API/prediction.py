from fastapi import FastAPI, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
import joblib
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
from sklearn.preprocessing import StandardScaler

# Create FastAPI application
app = FastAPI(
    title="Medical Insurance Charges Prediction API",
    description="Predicts medical insurance charges using a trained Random Forest Regression model.",
    version="1.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Load the saved model and scaler
model = joblib.load("best_insurance_model.pkl")
scaler = joblib.load("scaler.pkl")


class InsuranceInput(BaseModel):
    age: int = Field(..., ge=18, le=100)
    bmi: float = Field(..., ge=10, le=60)
    children: int = Field(..., ge=0, le=10)

    sex_male: int = Field(..., ge=0, le=1)
    smoker_yes: int = Field(..., ge=0, le=1)

    region_northwest: int = Field(..., ge=0, le=1)
    region_southeast: int = Field(..., ge=0, le=1)
    region_southwest: int = Field(..., ge=0, le=1)


@app.get("/")
def home():
    return {
        "message": "Medical Insurance Charges Prediction API is running."
    }


@app.post("/predict")
def predict(data: InsuranceInput):

    input_data = pd.DataFrame([{
        "age": data.age,
        "bmi": data.bmi,
        "children": data.children,
        "sex_male": data.sex_male,
        "smoker_yes": data.smoker_yes,
        "region_northwest": data.region_northwest,
        "region_southeast": data.region_southeast,
        "region_southwest": data.region_southwest
    }])

    # Scale the input
    scaled_input = scaler.transform(input_data)

    # Make prediction
    prediction = model.predict(scaled_input)

    return {
        "Predicted Insurance Charge": round(float(prediction[0]), 2)
    }

@app.post("/retrain")
async def retrain(file: UploadFile = File(...)):

    global model, scaler

    # Read uploaded CSV file
    df = pd.read_csv(file.file)

    # Separate features and target
    X = df.drop("charges", axis=1)
    y = df["charges"]

    # Apply the same encoding used during training
    X = pd.get_dummies(X, drop_first=True)

    # Create and fit a new scaler
    new_scaler = StandardScaler()

    X_scaled = new_scaler.fit_transform(X)

    # Train a new Random Forest model
    new_model = RandomForestRegressor(
        random_state=42,
        n_estimators=100
    )

    new_model.fit(X_scaled, y)

    # Save updated model and scaler
    joblib.dump(new_model, "best_insurance_model.pkl")
    joblib.dump(new_scaler, "scaler.pkl")

    # Update currently running API model
    model = new_model
    scaler = new_scaler

    return {
        "message": "Model retrained successfully",
        "training_samples": len(df)
    }