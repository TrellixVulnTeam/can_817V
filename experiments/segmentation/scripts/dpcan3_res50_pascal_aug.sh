# !/usr/bin/env bash
# train
# python -m experiments.segmentation.train_can --dataset pascal_aug \
#     --model dpcan3 --aux --dilated --multi-grid --stride 16 --atrous-rates 6 12 18 --base-size 520 --crop-size 520 \
#     --backbone resnet50 --checkname dpcan3_res50_pascal_aug

#test [single-scale]
python -m experiments.segmentation.test --dataset pascal_aug \
    --model dpcan3 --aux --dilated --multi-grid --stride 16 --atrous-rates 6 12 18 --base-size 608 --crop-size 520 \
    --backbone resnet50 --resume experiments/segmentation/runs/pascal_aug/dpcan3/dpcan3_res50_pascal_aug/checkpoint.pth.tar --split val --mode testval

#test [multi-scale]
python -m experiments.segmentation.test_whole --dataset pascal_aug \
    --model dpcan3 --aux --dilated --multi-grid --stride 16 --atrous-rates 6 12 18 --base-size 608 --crop-size 520 \
    --backbone resnet50 --resume experiments/segmentation/runs/pascal_aug/dpcan3/dpcan3_res50_pascal_aug/checkpoint.pth.tar --split val --mode testval --ms