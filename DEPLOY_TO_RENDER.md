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

## 故障排除

如果部署过程中遇到问题，请检查以下几点：

1. **Docker构建失败**：检查Dockerfile是否正确
2. **无法访问网站**：检查应用是否成功启动，可以查看Render提供的日志
3. **网页显示不正确**：确保所有静态资源都正确包含在项目中

## 后续维护

每当您推送更改到Git仓库时，Render将自动重新部署您的应用（如果您启用了自动部署）。

如需手动重新部署：
1. 登录Render控制台
2. 找到您的Web服务
3. 点击"Manual Deploy"按钮，然后选择"Deploy latest commit" 