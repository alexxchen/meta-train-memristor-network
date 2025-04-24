FROM pytorch/pytorch:1.5-cuda10.1-cudnn7-devel AS memoristor-env 

# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y git

RUN --mount=type=cache,target=/root/.cache/pip \
    python3 -m pip install memtorch-cpu
    
