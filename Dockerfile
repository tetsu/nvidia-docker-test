# FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
FROM nvidia/cuda:10.2-devel-ubuntu18.04

RUN apt-get update
RUN apt-get install -y python3 python3-pip git
# RUN apt-get install libqt4-dev
# RUN pip3 install torch torchvision torchaudio
RUN pip3 install torch==1.7.1+cu101 torchvision==0.8.2+cu101 torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install scikit-build cmake
RUN pip3 install cdflib opencv-python matplotlib tensorboardX
# RUN pip3 install cdflib opencv-contrib-python matplotlib tensorboardX
RUN python3 -m pip install 'git+https://github.com/facebookresearch/detectron2.git'

WORKDIR /work

COPY train.py /work/

ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs