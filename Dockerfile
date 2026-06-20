# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /hotel-assistant

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose Streamlit port
EXPOSE 8501

# Start both FastAPI backend and Streamlit frontend
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port 8000 & streamlit run streamlit_app.py --server.port 8501 --server.address 0.0.0.0"]
