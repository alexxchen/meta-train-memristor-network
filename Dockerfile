FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-devel AS memoristor-env 

# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y git

RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip install memtorch-cpu
    
