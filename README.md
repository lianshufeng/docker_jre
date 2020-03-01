# docker_springboot
centos8+jdk11



#### docker-compose.yml 
- springboot
````shell
version: "3"

services:
  springboot:
    image: registry.cn-chengdu.aliyuncs.com/1s/springboot
    ports:
      - "8080:8080"
    volumes:
      - "./:/opt/jar"
    working_dir: /opt/jar
    container_name: app
    restart: always
    environment:
#      - CacheResources=http://192.168.0.28:8080/BuildAppliaction.json,http://192.168.0.28:8080/application-prod.yml
#      - UpdateResources=http://192.168.0.28:8080/BuildHelper-0.0.1-SNAPSHOT.jar
      - ENTRYPOINT=nohup java -Dfile.encoding=UTF-8 -Xmx1000m -Xms600m -Duser.timezone=GMT+8 -Dspring.profiles.active=dev -jar app.jar
````