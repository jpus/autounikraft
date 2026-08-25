FROM node:20-alpine

# 安装必要的系统工具
RUN apk update && \
    apk add --no-cache \
        curl \
        openssl \
        ca-certificates && \
    rm -rf /var/cache/apk/*

WORKDIR /app

# 复制并安装依赖
COPY package.json .
RUN npm install --omit=dev

# 复制应用代码
COPY index.js index.html .

EXPOSE 3000

CMD ["node", "index.js"]