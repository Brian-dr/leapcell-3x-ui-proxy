#!/bin/bash
echo "========================================"
echo "        3x-ui Proxy Service"
echo "========================================"
echo "Starting on port: 2053"
echo "Time: $(date)"
echo "Directory: $(pwd)"
echo "Files:"
ls -la
echo ""
echo "✅ Service is running"
echo "Press Ctrl+C to stop"
echo "========================================"

# 保持运行
while true; do
    sleep 3600
done
