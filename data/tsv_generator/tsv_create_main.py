# Copyright (c) 2021 Microsoft Corporation. Licensed under the MIT license.
import os
import os.path as op
import json
import cv2
import base64

from tsv_create_gt import generate_tsv_file_use_path, generate_tsv_file_use_imgslist


img_data_path = "/data/smk/shm/albef/cc3m/val/"


def EveryStrandIsN(listTemp, n):
    for i in range(0, len(listTemp), n):
        yield listTemp[i:i + n]


if __name__ == '__main__':
    save_path = "/data/smk/Tmp/cc/val"
    img_list = os.listdir(img_data_path)
    img_list = sorted(img_list)
    n = 500000
    print("len(img_list): ", len(img_list))

    for i, listTemp in enumerate(EveryStrandIsN(img_list, n)):
        print(f"Processing {i} th batch")
        print("len(listTemp): ", len(listTemp))
        print("listTemp: ", listTemp[0])
        # break
        generate_tsv_file_use_imgslist(img_data_path, listTemp, save_path, i)
