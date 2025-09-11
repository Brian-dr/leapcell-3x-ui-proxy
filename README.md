# 3X-UI 代理服务 LeapCell 部署指南

## 项目概述

这是一个基于 3X-UI 的多协议代理服务，专门为 LeapCell 平台优化部署。支持 VMess、VLESS、Trojan、Shadowsocks 等多种协议。

## 功能特性

- 🌐 **多协议支持**: VMess, VLESS, Trojan, Shadowsocks, Wireguard
- 📊 **Web 管理界面**: 友好的用户管理和流量统计
- 🔒 **TLS 加密**: 支持自动 SSL 证书配置
- 📱 **移动端支持**: 兼容各种客户端应用
- ⚡ **高性能**: 基于 Xray 核心引擎

## 支持的协议

✅ VMess (WebSocket + TLS)  
✅ VLESS (WebSocket + TLS)  
✅ Trojan (TLS)  
✅ Shadowsocks  
✅ HTTP/SOCKS5 代理  
❌ Hysteria2 (需要特权容器，LeapCell 不支持)

## 端口说明

- **2053**: Web 管理界面
- **443**: HTTPS 代理端口
- **80**: HTTP 代理端口  
- **8080**: 备用端口 1
- **8443**: 备用端口 2

## 部署到 LeapCell

### 1. 准备工作
- 确保有一个域名指向你的 LeapCell 服务
- 准备 SSL 证书（可选，支持自动获取）

### 2. 部署步骤

1. 将此项目推送到 Git 仓库
2. 在 LeapCell 控制台创建新服务
3. 连接到你的 Git 仓库
4. 选择 Docker Compose 部署方式
5. 等待部署完成

### 3. 初始访问

部署完成后：
- 访问 `https://你的域名:2053` 进入管理界面
- 默认用户名: `admin`
- 默认密码: `admin`

⚠️ **重要**: 首次登录后立即修改默认密码！

## 目录结构

```
├── docker-compose.yml    # Docker 编排文件
├── README.md            # 本文档
├── db/                  # 数据库文件 (自动创建)
├── cert/                # SSL 证书目录 (自动创建)
└── logs/                # 日志目录 (自动创建)
```