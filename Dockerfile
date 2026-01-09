# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown registry node CheckpointLoaderSimple — no aux_id provided
# Could not resolve unknown registry node CLIPSetLastLayer — no aux_id provided
# Could not resolve unknown registry node MultiLoRAStack — no aux_id provided
# Could not resolve unknown registry node FaceDetailer — no aux_id provided
# Could not resolve unknown registry node UltralyticsDetectorProvider — no aux_id provided
# Could not resolve unknown registry node SAMLoader — no aux_id provided
# Could not resolve unknown registry node UltralyticsDetectorProvider — no aux_id provided
# Could not resolve unknown registry node mxSeed — no aux_id provided
# Could not resolve unknown registry node ConditioningMultiCombine — no aux_id provided

# download models into comfyui
RUN comfy model download --url https://huggingface.co/dhead/animagineXL40_v4Opt/resolve/main/animagineXL40_v4Opt.safetensors --relative-path models/checkpoints --filename animagineXL40_v4Opt.safetensors
RUN comfy model download --url https://huggingface.co/ashllay/YOLO_Models/resolve/main/bbox/nipples_yolov8s.pt --relative-path models/ultralytics/bbox --filename nipples_yolov8s.pt
RUN comfy model download --url https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth --relative-path models/sams --filename sam_vit_b_01ec64.pth
RUN comfy model download --url https://huggingface.co/uooogh/nipples_yolov8s-seg/resolve/main/nipples_yolov8s-seg.pt --relative-path models/ultralytics/segm --filename nipples_yolov8s-seg.pt

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
