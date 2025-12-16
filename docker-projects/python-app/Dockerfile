# Use a small official Python image
FROM python:3.12-slim

# Set working directory inside the container
WORKDIR /app

# Copy the app code into the image
COPY app.py .

# Expose the port the app listens on
EXPOSE 8000

# Set default environment variables
ENV APP_PORT=8000

# Run the app
CMD ["python", "app.py"]
