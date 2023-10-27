# Use an official Python runtime as the base image.
FROM python:3.9

# Set the working directory inside the container.
WORKDIR /app

# Copy the requirements file into the container at /app.
COPY requirements.txt /app

# Install any needed packages specified in requirements.txt.
RUN pip install -r requirements.txt

# Update and upgrade the package lists within the container.
RUN apt-get update && apt-get upgrade -y

# Your application's source code should be copied here if it's not included in the requirements file.
# For example:

COPY . /app

# Define the command to run when the container starts.
CMD ["python", "manage.py","runserver","0.0.0.0:5000"]
