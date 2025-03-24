- MySQL Dockerfile

```

# 1) MySQL 공식 이미지 기반
FROM mysql:8

# 2) 환경 변수 설정
#    (Dockerfile 빌드시 tzdata 설치 시 대화형 입력을 피하기 위해 DEBIAN_FRONTEND=noninteractive 설정)
ENV TZ=Asia/Seoul \
    DEBIAN_FRONTEND=noninteractive

# 3) tzdata 설치 후, /etc/localtime 및 /etc/timezone 설정
RUN apt-get update && \
    apt-get install -y tzdata && \
    # 타임존 심볼릭 링크 및 /etc/timezone 기록
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# (선택) 내부에서 인터넷 시간 동기화를 자동으로 수행하려면 chrony/ntpdate 추가
# RUN apt-get install -y chrony && \
#     # chrony 설정파일 편집 등 필요한 설정
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# 4) MySQL 서버 실행 시 파라미터로 시간대 및 문자셋 설정
#    - --default-time-zone=+09:00  => MySQL이 KST 사용
#    - --character-set-server, --collation-server => UTF8MB4 설정
CMD ["mysqld",
     "--character-set-server=utf8mb4",
     "--collation-server=utf8mb4_unicode_ci",
     "--default-time-zone=+09:00"
]

```