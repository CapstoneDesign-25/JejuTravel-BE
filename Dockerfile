FROM eclipse-temurin:21-jdk-jammy

# Python 설치
# RUN apk update && apk add --no-cache python3 py3-pip
RUN apt-get update && apt-get install -y python3 python3-pip

# googletrans 모듈 설치
RUN pip3 install googletrans==4.0.0-rc1

# 환경 변수 설정
ENV PATH="/usr/local/bin:${PATH}"

ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} back.jar
COPY src/main/resources/translator.py /app/src/main/resources/translator.py


ENTRYPOINT ["java", "-jar", "/back.jar"]
