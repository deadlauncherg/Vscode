FROM quay.io/jupyter/base-notebook:latest

ENV JUPYTER_PORT=10000

EXPOSE 10000

CMD ["start-notebook.py", "--ServerApp.ip=0.0.0.0", "--ServerApp.port=10000", "--ServerApp.allow_remote_access=True", "--ServerApp.root_dir=/home/jovyan/work"]
