#!/usr/bin/env bash
#train
python -m experiments.segmentation.train --dataset pcontext \
    --model deeplabv3plus --aux --dilated --multi-grid --stride 16 --atrous-rates 6 12 18 --base-size 520 --crop-size 520 --batch-size 8 \
    --backbone resnet50 --checkname  deeplabv3plus_res50_pcontext
#test [single-scale]
python -m experiments.segmentation.test --dataset pcontext \
    --model deeplabv3plus --aux --dilated --multi-grid --stride 16 --atrous-rates 6 12 18 --base-size 520 --crop-size 520 \
    --backbone resnet50 --resume experiments/segmentation/runs/pcontext/deeplabv3plus/deeplabv3plus_res50_pcontext/model_best.pth.tar --split val --mode testval

#test [multi-scale]
python -m experiments.segmentation.test --dataset pcontext \
    --model deeplabv3plus --aux --dilated --multi-grid --stride 16 --atrous-rates 6 12 18 --base-size 520 --crop-size 520 \
    --backbone resnet50 --resume experiments/segmentation/runs/pcontext/deeplabv3plus/deeplabv3plus_res50_pcontext/model_best.pth.tar --split val --mode testval --ms