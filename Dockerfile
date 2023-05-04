# layer 1
# add layers on the top of this base image
FROM ubuntu:22.04

# layer 2
# run commands to install app dependencies (python3)
RUN apt-get update \
    && apt-get install -y python3 \
    && rm -rf /var/lib/apt/lists/*

# layer 3
# docker copy PATH/app1 folder from host to /app in container
COPY app1/ /app
# set the default command when the container starts
CMD ["python3", "/app/run.py"]
