# 定义要检查的目录路径
directory_path="/home/smk/workspace/scene_graph_benchmark/output/"
if [ -d "$directory_path" ]; then
    # 如果目录存在，则使用rm -rf命令删除
    echo "Directory $directory_path exists. Deleting it..."
    rm -rf "$directory_path"
    if [ $? -eq 0 ]; then
        echo "Directory deleted successfully."
    else
        echo "Failed to delete directory."
    fi
else
    echo "Directory $directory_path does not exist."
fi

python tools/test_sg_net.py --config-file sgg_configs/vgattr/vinvl_x152c4.yaml \
        TEST.IMS_PER_BATCH  8\
        MODEL.WEIGHT models/vinvl/vinvl_vg_x152c4.pth \
        MODEL.ROI_HEADS.NMS_FILTER 1 \
        MODEL.ROI_HEADS.SCORE_THRESH 0.45 \
        DATA_DIR "/home/smk/workspace/scene_graph_benchmark/data/datasets2" \
        TEST.IGNORE_BOX_REGRESSION True \
        MODEL.ATTRIBUTE_ON True \
        # TEST.OUTPUT_FEATURE True