#!/bin/bash

REPO_CONFIG_DIR="./config/zed"
REPO_LOCAL_DIR="./local/zed"

echo <<< "$REPO_CONFIG_DIR"

echo <<< "$REPO_LOCAL_DIR"

ZED_CONFIG_DIR="$HOME/.config/zed"
ZED_LOCAL_DIR="$HOME/.local/share/zed/extensions"


rsync -av "$ZED_CONFIG_DIR"/ "$REPO_CONFIG_DIR"

rsync -av  "$ZED_LOCAL_DIR"/ "$REPO_LOCAL_DIR"

