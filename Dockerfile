FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

RUN apt-get update
RUN apt-get install -y python3 python3-pip git
RUN pip3 install torch torchvision torchaudio
RUN pip3 install scikit-build cmake
RUN pip3 install cdflib opencv-python matplotlib tensorboardX
RUN python3 -m pip install 'git+https://github.com/facebookresearch/detectron2.git'

WORKDIR /work

COPY train.py /work/

ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs