#!/bin/bash
# 啟用 shell 以便使用 conda activate
set -e

source "${CONDA_DIR}/etc/profile.d/conda.sh"
conda activate ocr_env

echo "Starting OCR Server in ocr_env..."
export PYTHONPATH=$PYTHONPATH:/app/moda_agent

# 2. 直接執行 python3，避開 conda run 的參數解析問題
python3 /app/moda_agent/poc_easyocr/ocr_api_server.py \
    --host 0.0.0.0 \
    --port 5000 \
    --vlm-api-url http://model-gemma-3-4b-it:8000/v1 \
    --vlm-api-key sk-test \
    --vlm-model-name /model/gemma-3-4b-it &
	
exec java -jar /app/app.jar