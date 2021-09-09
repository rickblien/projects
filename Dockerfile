# 'https://www.youtube.com/watch?v=bi0cKgmRuiA'
# Dcokerfile, Image, Container 

# Base Image
FROM python:3-onbuild

# Create a working directory for a starting point inside docker container
WORKDIR /projects

# Copy dependencies requirement
COPY ./requirements.txt ./requirements.txt

# Install dependecies requirement
RUN pip install -r requirements.txt

# Copy app directory and create app directory in Docker Container
COPY ./pe/pe.py ./pe/pe.py

# Debugging - Verify copied file to Docker
RUN ls -l

# Set port
EXPOSE 443

# Run "streamlit run" command 
ENTRYPOINT [ "streamlit","run" ]

# Run "pe.py" command
CMD ["./pe/pe.py"]

# build docker container "docker build -ti --tag pro:0.1 ."

# start docker container "docker run -p 8080:8080 -ti pro:0.1"