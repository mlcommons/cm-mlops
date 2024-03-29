#!/bin/bash

CM_TMP_CURRENT_SCRIPT_PATH=${CM_TMP_CURRENT_SCRIPT_PATH:-$PWD}

# connect CM intelligent components with CK env
export ML_MODEL_IMAGE_HEIGHT=224
export ML_MODEL_IMAGE_WIDTH=224
export CK_BATCH_SIZE=1
export CK_BATCH_COUNT=1
export CK_ENV_ONNX_MODEL_ONNX_FILEPATH=""
export CK_ENV_DATASET_IMAGENET_PREPROCESSED_DIR=${CM_DATASET_PREPROCESSED_PATH}
export CK_ENV_DATASET_IMAGENET_PREPROCESSED_SUBSET_FOF=${CM_DATASET_PREPROCESSED_PATH}/names.txt
export CK_CAFFE_IMAGENET_SYNSET_WORDS_TXT=${CM_DATASET_AUX_PATH}/synsets.txt
export CK_ENV_DATASET_IMAGENET_PREPROCESSED_DATA_TYPE=float32
export CK_RESULTS_DIR=${CM_TMP_CURRENT_SCRIPT_PATH}/results
export ML_MODEL_DATA_TYPE=float32
export USE_LLVM=no


export CK_BATCH_SIZE=${CM_BATCH_SIZE}
export CK_BATCH_COUNT=${CM_BATCH_COUNT}

${CM_PYTHON_BIN} -m pip install -r ${CM_TMP_CURRENT_SCRIPT_PATH}/requirements.txt
test $? -eq 0 || exit 1

${CM_PYTHON_BIN} ${CM_TMP_CURRENT_SCRIPT_PATH}/src/pytorch_classify_preprocessed.py
test $? -eq 0 || exit 1
