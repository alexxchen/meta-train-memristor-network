FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-devel AS memoristor-env 

RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update && \
    apt-get install -y openssh-server libopenmpi-dev openmpi-bin openmpi-common openmpi-doc
#     apt-get upgrade -y && \
#     apt-get install -y git

RUN --mount=type=cache,target=/root/.cache/pip \
    SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL=True python3 -m pip install memtorch-cpu mpi4py wandb gymnasium numpy==1.20.0
    
