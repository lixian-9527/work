#拉取代码
git pull

#安装依赖和打包
npm install && npm run build

# 删除原有容器
docker rm -f demo &> /dev/null

#启动容器
docker run -d --restart=on-failure:5\
    -p 8080:80 \
    -v $PWD/dist:/usr/share/nginx/html \
    --name demo nginx
