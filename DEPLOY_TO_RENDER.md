# 部署到Render平台

本文档介绍如何将英语完形填空互动练习部署到Render平台。

## 准备工作

1. 注册Render账号：[https://render.com/](https://render.com/)
2. 创建一个Git仓库（例如GitHub、GitLab）并上传您的项目

## 部署步骤

### 1. 连接您的Git仓库

1. 登录Render控制台
2. 点击"New +"按钮，选择"Web Service"
3. 选择您的Git提供商（如GitHub）
4. 授权Render访问您的仓库
5. 选择包含此项目的仓库

### 2. 配置Web服务

在Render配置页面中：

1. 名称：输入您想要的服务名称，如"english-words-exercise"
2. 环境：选择"Docker"
3. 分支：选择您的主分支（通常是"main"或"master"）
4. 计划：选择"Free"

其余配置项已在`render.yaml`文件中指定，Render将自动识别这些配置。

### 3. 点击"创建Web服务"

Render将开始构建和部署您的应用。首次部署可能需要几分钟时间。

### 4. 访问您的网站

部署成功后，Render会提供一个URL，格式通常为：
`https://[your-service-name].onrender.com`

您可以通过此URL访问您的英语完形填空互动练习。

## JavaScript支持

本项目已配置了特殊的Nginx设置，确保在Render上可以正常执行JavaScript代码：

1. 使用自定义`nginx.conf`配置文件，其中包含正确的MIME类型和安全头
2. 添加了必要的内容安全策略(CSP)，允许内联脚本执行
3. 配置了适当的缓存控制和跨域访问策略

这些配置在Dockerfile中通过以下方式应用：
```dockerfile
# 创建自定义Nginx配置，允许JavaScript执行
RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
```

## 本地数据存储

应用使用浏览器的localStorage API来保存和加载数据。这使得用户可以：

1. 保存自定义题目到浏览器本地存储
2. 在下次访问时加载之前保存的题目
3. 不依赖服务器端存储便可使用所有功能

## 故障排除

如果部署过程中遇到问题，请检查以下几点：

1. **Docker构建失败**：检查Dockerfile和nginx.conf是否正确
2. **无法访问网站**：检查应用是否成功启动，可以查看Render提供的日志
3. **JavaScript不执行**：检查浏览器控制台是否有错误，可能是内容安全策略问题
4. **本地存储不工作**：确保浏览器允许localStorage，或者检查是否处于隐私模式

## 后续维护

每当您推送更改到Git仓库时，Render将自动重新部署您的应用（如果您启用了自动部署）。

如需手动重新部署：
1. 登录Render控制台
2. 找到您的Web服务
3. 点击"Manual Deploy"按钮，然后选择"Deploy latest commit" 