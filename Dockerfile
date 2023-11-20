# build command - docker build -f .\Dockerfile -t tenrfl .
# Run command - docker run -it -p 8888:8888 tenrfl

# Use an official TensorFlow GPU base image
FROM tensorflow/tensorflow:latest-gpu

# Set the working directory
WORKDIR /home

# Copy the local code into the container
COPY requirements.txt .

# Install any additional dependencies
# For example, if you have a requirements.txt file:
RUN python -m pip install pip --upgrade
RUN python -m pip install -r requirements.txt

COPY notebooks .

# Expose any necessary ports
EXPOSE 8888

# Command to run your application
# For example, if you're running a Python script:
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
