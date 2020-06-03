# 后端实际负载均衡组
upstream travel {
  ${servers}
}

server {
     listen 80;
     # 域名
     server_name ${server_name};
     # 访问日志
     access_log  ${access_log_file};
     # 接口访问规则
     location ~.*^ {
         proxy_pass http://travel;
         proxy_set_header Host $host;
         proxy_redirect off;
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
         proxy_set_header Cookie $http_cookie;
     }
     # 静态文件规则
     location ~.*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico|mp3)$ {
          expires 10d;
          access_log off;
     }
     # 文件缓存
     location ~.*\.(js|css)?$ {
        expires 7d;
        access_log off;
     }
     # 禁止访问的文件
     location ~/(\.user|\.ini|\.ht|\.git|\.svn|\.project|composer\.json|LICENSE|README\.md){
        deny all;
     }
}
