# Use official Python image
FROM python:3.9

# Set a non-root user (10001 as an example)
RUN useradd -m -u 10001 choreo-user

# Set working directory
WORKDIR /app

# Change ownership of the working directory
RUN chown -R choreo-user /app

# Copy the project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Switch to the non-root user
USER 10001

# Expose the application port
EXPOSE 5000

# Start the application using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
