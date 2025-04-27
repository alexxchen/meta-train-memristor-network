# FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-devel AS memoristor-env 
FROM crpi-0iga3x1q4si035cn.cn-shanghai.personal.cr.aliyuncs.com/alecchen/memtorch:base AS memoristor-env 

ENV SKLEARN_ALLOW_DEPRECATED_SKLEARN_PACKAGE_INSTALL True

# RUN rm /etc/apt/sources.list.d/cuda.list
# RUN rm /etc/apt/sources.list.d/nvidia-ml.list

# RUN apt-get update && \
#     apt-get install -y openssh-server libopenmpi-dev openmpi-bin openmpi-common openmpi-doc git
# #     apt-get upgrade -y && \
# #     apt-get install -y git

# RUN --mount=type=cache,target=/root/.cache/pip \
#      python3 -m pip install mpi4py wandb gymnasium numpy==1.21.0

RUN git clone --recursive https://github.com/coreylammie/MemTorch && \
    cd MemTorch && \
    python3 -m pip install .
    
