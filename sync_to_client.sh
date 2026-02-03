#!/bin/bash

REPO_CONFIG_DIR="./config/zed"
REPO_LOCAL_DIR="./local/zed"

echo <<< "$REPO_CONFIG_DIR"

echo <<< "$REPO_LOCAL_DIR"

ZED_CONFIG_DIR="$HOME/.config/zed"
ZED_LOCAL_DIR="$HOME/.local/share/zed"


rsync -av "$REPO_CONFIG_DIR"/ "$ZED_CONFIG_DIR"

rsync -av "$REPO_LOCAL_DIR"/ "$ZED_LOCAL_DIR"

