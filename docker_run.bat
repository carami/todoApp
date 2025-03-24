docker run -d ^
    --name springapp ^
    --network spring-net ^
    -e "SPRING_DATASOURCE_URL=jdbc:mysql://mymysql:3307/testdb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Seoul&characterEncoding=UTF-8" ^
    -e "SPRING_DATASOURCE_USERNAME=testuser" ^
    -e "SPRING_DATASOURCE_PASSWORD=testpass" ^
    -p 8080:8080 ^
    urstory/my-spring-app:1.0
