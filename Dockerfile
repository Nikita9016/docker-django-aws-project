# Use official Python 3.11 image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Expose port 8000 for Django
EXPOSE 8000

# Run gunicorn as default command
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]