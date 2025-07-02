#!/bin/bash

# 支持通过 POCKETFLOW_HOME 环境变量指定主目录，否则用脚本自身目录
POCKETFLOW_HOME="${POCKETFLOW_HOME:-$(dirname "$0")}"
# 支持通过 POCKETFLOW_OUTPUT 环境变量指定输出目录，默认值为当前目录
POCKETFLOW_OUTPUT="${POCKETFLOW_OUTPUT:-$(pwd)}"

echo "POCKETFLOW_HOME: $POCKETFLOW_HOME"
echo "POCKETFLOW_OUTPUT: $POCKETFLOW_OUTPUT"

source "$POCKETFLOW_HOME/.venv/bin/activate"

# 在任意项目根目录下执行，自动以当前目录为项目目录，输出到 ./output/
python "$POCKETFLOW_HOME/main.py" --dir "$(pwd)" --language Chinese --output "$POCKETFLOW_OUTPUT"