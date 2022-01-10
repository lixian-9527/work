 #将jenkins加入docker组
 sudo gpasswd -a jenkins docker
 #重启jenkins服务
 sudo service jenkins restart
#拉取代码
git pull
echo "拉取代码成功"

#安装依赖和打包
npm install && npm run build
echo "安装依赖和打包成功"

# 删除原有容器
docker rm -f demo &> /dev/null
echo "删除原有容器成功"

#启动容器
docker run -d --restart=on-failure:5\
    -p 8080:80 \
    -v $PWD/dist:/usr/share/nginx/html \
    --name demo nginx
echo "构建容器成功"
