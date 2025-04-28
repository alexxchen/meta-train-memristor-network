# FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-devel AS memoristor-env 
# FROM crpi-0iga3x1q4si035cn.cn-shanghai.personal.cr.aliyuncs.com/alecchen/memtorch:base-1.7 AS memoristor-env 
FROM python:3.9.22 AS python-env

ENV SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL True

# RUN rm /etc/apt/sources.list.d/cuda.list
# RUN rm /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update && \
    apt-get install -y openssh-server libopenmpi-dev openmpi-bin openmpi-common openmpi-doc git

RUN --mount=type=cache,target=/root/.cache/pip \
     python3 -m pip install mpi4py wandb gymnasium numpy==1.21.0 scikit-learn

RUN --mount=type=cache,target=/root/.cache/pip \
     python3 -m pip install torch==1.7.1+cpu torchvision==0.8.2+cpu torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html

RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip install git+https://github.com/coreylammie/MemTorch.git

