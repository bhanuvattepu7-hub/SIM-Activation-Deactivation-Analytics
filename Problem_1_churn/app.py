
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
import numpy as np

app = FastAPI(
    title="Telecom Customer Churn Prediction API",
    description="API for predicting telecom customer churn",
    version="1.0.0"
)

MODEL_PATH = "telecom_churn_model.pkl"

try:
    model = joblib.load(MODEL_PATH)
    print("Model loaded successfully")
except Exception as e:
    print("Error loading model:", e)
    model = None


class ChurnInput(BaseModel):

    call_failure: float
    complains: float
    subscription_length: float
    charge_amount: float
    seconds_of_use: float
    frequency_of_use: float
    frequency_of_sms: float
    distinct_called_numbers: float
    age_group: float
    tariff_plan: float
    status: float
    age: float
    customer_value: float


@app.get("/")
def home():

    return {
        "message": "Telecom Customer Churn API is running",
        "status": "success"
    }


@app.get("/health")
def health():

    if model is None:

        return {
            "status": "unhealthy",
            "model_loaded": False
        }

    return {
        "status": "healthy",
        "model_loaded": True
    }


@app.post("/predict-churn")
def predict_churn(data: ChurnInput):

    if model is None:

        raise HTTPException(
            status_code=500,
            detail="Model is not loaded"
        )

    input_data = np.array([[
        data.call_failure,
        data.complains,
        data.subscription_length,
        data.charge_amount,
        data.seconds_of_use,
        data.frequency_of_use,
        data.frequency_of_sms,
        data.distinct_called_numbers,
        data.age_group,
        data.tariff_plan,
        data.status,
        data.age,
        data.customer_value
    ]])

    prediction = model.predict(input_data)[0]

    probabilities = model.predict_proba(input_data)[0]

    churn_probability = probabilities[1]

    if churn_probability < 0.30:
        risk_category = "Low Risk"

    elif churn_probability < 0.60:
        risk_category = "Medium Risk"

    else:
        risk_category = "High Risk"

    return {
        "prediction": int(prediction),
        "churn_status": "Churn" if prediction == 1 else "Not Churn",
        "churn_probability": round(float(churn_probability), 4),
        "churn_percentage": round(float(churn_probability * 100), 2),
        "risk_category": risk_category
    }
