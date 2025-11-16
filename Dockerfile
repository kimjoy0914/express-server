# 1. Node.js 22 버전 이미지 사용
FROM node:22

# 2. 컨테이너 안에서 작업할 디렉터리 지정
WORKDIR /usr/src/app

# 3. 의존성 설치를 위한 package 파일들 먼저 복사
COPY package*.json ./

# 4. 의존성 설치 (배포 환경이라면 --omit=dev 또는 --production 옵션도 가능)
RUN npm install

# 5. 나머지 소스 코드 전체 복사
COPY . .

# 6. 환경 변수 설정 (선택)
#    bin/www에서 process.env.PORT || 3000 으로 되어 있다면,
#    기본값 3000을 쓰되 필요하면 docker run 할 때 -e PORT=xxxx 로 바꿀 수 있음
ENV NODE_ENV=production
ENV PORT=3000

# 7. 컨테이너가 외부에 노출할 포트 (실제 포트 번호와 맞춰야 함)
EXPOSE 3000

# 8. 서버 실행 명령어: package.json의 "start": "node ./bin/www" 를 사용
CMD ["npm", "start"]
