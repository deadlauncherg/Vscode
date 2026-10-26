FROM quay.io/jupyter/base-notebook:latest

# Install system packages as root during image build
USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        wget \
        unzip \
        nano \
        ca-certificates \
        zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Return to the normal Jupyter user
USER ${NB_UID}

# Set working directory
WORKDIR /home/jovyan

# Render web service port
EXPOSE 10000

# Start Jupyter Notebook
CMD ["start-notebook.py", \
     "--ServerApp.ip=0.0.0.0", \
     "--ServerApp.port=10000", \
     "--ServerApp.allow_remote_access=True", \
     "--ServerApp.root_dir=/home/jovyan/work"]
