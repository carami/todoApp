# (1) 기본 베이스 이미지로 OpenJDK 21 사용
FROM eclipse-temurin:21

# (2) 작업 디렉토리 생성
WORKDIR /app

# (3) 빌드 산출물(프로젝트 JAR)을 복사
#     실제로는 CI/CD에서 'mvn package' 등으로 만든 jar파일을 복사한다고 가정
COPY build/libs/todoApp-0.0.1-SNAPSHOT.jar /app/todoApp.jar

# (4) 컨테이너가 사용하는 포트 (문서적 의미)
EXPOSE 8080

# (5) 실행 명령
ENTRYPOINT ["java", "-jar", "/app/todoApp.jar", "--spring.profiles.active=prod"]
