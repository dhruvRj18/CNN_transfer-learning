# build command - docker build -f .\Dockerfile -t tenrfl .
# Run command - docker run -it --gpus=all -p 8888:8888 tenrfl

# Use an official TensorFlow GPU base image
FROM tensorflow/tensorflow:latest-gpu

# Set the working directory
WORKDIR /home

COPY requirements.txt .
RUN python -m pip install pip --upgrade
RUN python -m pip install -r requirements.txt

COPY notebooks .

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
