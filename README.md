# nvidia-docker-test


### make docker instance

```
docker build -t nv .
```


### Show commandline within docker instance & execute training & exit from commandlilne

```
docker run -it --gpus all nv /bin/bash

python3 train.py

exit
```

### Reference local files

#### Run Detectron2 Demo

```
docker run -v ${PWD}/../detectron2:/work/detectron2 -e NVIDIA_VISIBLE_DEVICES=all -it --gpus all nv /bin/bash 

cd detectron2/demo

python3 demo.py --config-file ../configs/COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml \
  --input input1.jpg input2.jpg \
  --opts MODEL.WEIGHTS detectron2://COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x/137849600/model_final_f10217.pkl
```

#### Run 3d-motion-x Demo

```
docker run -v ${PWD}/../3d-motion-x:/work/3d-motion-x -e NVIDIA_VISIBLE_DEVICES=all -it --gpus all nv /bin/bash

cd detectron2/demo

python3 demo.py --config-file ../configs/COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml \
  --input input1.jpg input2.jpg \
  --opts MODEL.WEIGHTS detectron2://COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x/137849600/model_final_f10217.pkl
```

# References

[UbuntuにAnacondaで構築するTensorFlow-GPU環境構築 〜CUDA、cuDNNインストール編〜](https://qiita.com/captain-sadami/items/c9be816856c57ef0ae52)

[nvidia-dockerをdocker-composeで動かす(ver3系)](https://qiita.com/routerman/items/c5f9d7b6d03e44de6be2)

[PyTorch+GPUをDockerで実装](https://qiita.com/conankonnako/items/787b69cd8cbfe7d7cb88)

[Docker(19.03)でgpu有効化してpytorchで訓練するまでやる(Ubuntu18.04)](https://qiita.com/tomp/items/50081b99df7963462488)

[pytorchのtorch.cuda.is_available()がFalseを出す問題](https://qiita.com/nabenabe0928/items/7962dcf3030889667de4)

[Detectron2 Installation](https://detectron2.readthedocs.io/en/latest/tutorials/install.html)

[INSTALLING PREVIOUS VERSIONS OF PYTORCH](https://pytorch.org/get-started/previous-versions/)


## Local Env Example

### Anaconda

```
conda create -n detectron2 python=3.8

conda activate detectron2

conda install pytorch==1.8.0 torchvision==0.9.0 torchaudio==0.8.0 cudatoolkit=11.1 -c pytorch -c conda-forge

conda install -y -c conda-forge numpy=1.20.1

pip install scikit-build cmake cdflib opencv-python matplotlib tensorboardX tqdm

python -m pip install 'git+https://github.com/facebookresearch/detectron2.git'
```