FROM nginx:alpine

# 复制静态文件到Nginx默认目录
COPY . /usr/share/nginx/html/

# 修改默认首页为wanxing.html
RUN sed -i 's/index.html/wanxing.html/g' /etc/nginx/conf.d/default.conf

# 暴露80端口
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] 