FROM python:3.9-slim

# Upgrade pip and install requirements
COPY requirements.txt requirements.txt
RUN pip install -U pip
RUN pip install -r requirements.txt

# Copy app code and set working directory
WORKDIR /app
COPY . .

ENV OPENAI_API_KEY=$OPENAI_API_KEY
ENV OPENAI_API_BASE=$OPENAI_API_BASE

EXPOSE 8501

# Run
ENTRYPOINT streamlit run app.py --server.port=8501 --server.address=0.0.0.0