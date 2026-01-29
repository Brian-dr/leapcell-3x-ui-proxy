#!/bin/bash
echo "========================================"
echo "       3x-ui Build Process"
echo "========================================"

# 首先确保我们在正确的目录
pwd
ls -la

# 如果build.sh不存在，创建它（防止循环）
if [ ! -f "build.sh" ]; then
    echo "创建build.sh..."
    echo '#!/bin/bash' > build.sh
    echo 'echo "Build script"' >> build.sh
    chmod +x build.sh
fi

# 确保start.sh存在
if [ ! -f "start.sh" ]; then
    echo "创建start.sh..."
    echo '#!/bin/bash' > start.sh
    echo 'echo "Starting 3x-ui..."' >> start.sh
    echo 'sleep infinity' >> start.sh
    chmod +x start.sh
fi

# 确保Dockerfile存在
if [ ! -f "Dockerfile" ]; then
    echo "创建Dockerfile..."
    echo 'FROM ghcr.io/mhsanaei/3x-ui:latest' > Dockerfile
    echo 'EXPOSE 2053 443 80' >> Dockerfile
fi

echo "✅ 所有文件检查完成"
echo "当前目录内容:"
ls -la
echo "========================================"
