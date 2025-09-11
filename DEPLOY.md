# LeapCell 部署指南

## 部署前准备

### 1. 域名准备
- 准备一个域名（如: `proxy.yourdomain.com`）
- 等待 LeapCell 分配 IP 后，添加 A 记录指向该 IP

### 2. Git 仓库准备
```bash
# 初始化仓库
git init
git add .
git commit -m "Initial 3x-ui setup for LeapCell"
git remote add origin https://github.com/yourusername/leapcell-proxy.git
git push -u origin main
```

## LeapCell 部署步骤

### 1. 创建新服务
1. 登录 LeapCell 控制台
2. 点击 "Create App" 或 "新建应用"
3. 选择 "From Git Repository"

### 2. 连接 Git 仓库
1. 输入你的 Git 仓库 URL
2. 选择分支: `main`
3. 设置构建目录: `/` (根目录)

### 3. 配置部署设置
- **Build Command**: 留空
- **Install Command**: 留空  
- **Start Command**: `docker-compose up -d`
- **Port**: `2053` (管理界面端口)

### 4. 环境变量设置（可选）
在 LeapCell 控制台添加环境变量：
```
TZ=Asia/Shanghai
DOMAIN=proxy.yourdomain.com
```

### 5. 域名配置
1. 在 LeapCell 控制台的 "Settings" > "Domains"
2. 添加自定义域名: `proxy.yourdomain.com`
3. 配置端口映射：
   - `2053` → Web 管理界面
   - `443` → HTTPS 代理
   - `80` → HTTP 代理

## 部署后验证

### 1. 检查服务状态
- 在 LeapCell 控制台查看部署日志
- 确认容器运行状态为 "Running"

### 2. 访问管理界面
- 访问: `https://proxy.yourdomain.com:2053`
- 如果无法访问，尝试: `http://proxy.yourdomain.com:2053`

### 3. 初始登录
- 用户名: `admin`
- 密码: `admin`
- ⚠️ **立即修改默认密码**

## 常见部署问题

### 问题 1: 容器启动失败
**症状**: LeapCell 显示部署失败
**解决方案**:
1. 检查 `docker-compose.yml` 语法
2. 查看 LeapCell 构建日志
3. 确认使用的镜像可访问

### 问题 2: 端口无法访问
**症状**: 管理界面无法打开
**解决方案**:
1. 确认 LeapCell 端口配置正确
2. 检查域名解析是否生效
3. 尝试使用 IP 直接访问

### 问题 3: SSL 证书问题
**症状**: HTTPS 访问提示证书错误
**解决方案**:
1. 等待域名解析完全生效（最多24小时）
2. 在 3x-ui 中重新申请证书
3. 或者暂时使用 HTTP 访问

## 性能优化

### 1. LeapCell 资源配置
- 推荐配置: 1 CPU, 1GB RAM
- 根据用户数量调整资源

### 2. 代理协议选择
- **高性能**: VLESS
- **兼容性**: VMess  
- **伪装性**: Trojan

### 3. 端口策略
- 使用 443/80 端口提高连通性
- 备用端口应对封锁

## 监控和维护

### 1. 日志监控
- LeapCell 控制台查看应用日志
- 3x-ui 管理界面查看代理日志

### 2. 流量统计
- 3x-ui 内置流量统计功能
- 可设置用户流量限制

### 3. 定期备份
```bash
# 备份配置（在有访问权限时）
docker cp 3x-ui:/etc/x-ui/ ./backup/
```

## 扩展功能

### 1. CDN 加速
- 推荐使用 Cloudflare CDN
- 配置 WebSocket 协议支持

### 2. 多节点部署  
- 在不同地区部署多个 LeapCell 服务
- 使用负载均衡分发流量

### 3. 自动化运维
- 设置监控告警
- 配置自动重启策略

---

🎉 **部署完成！** 现在你可以开始配置代理协议和用户了。详细配置步骤请参考 `SETUP.md`。