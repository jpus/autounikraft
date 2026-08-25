FROM node:20-alpine

WORKDIR /app

# 安装必要的系统工具并立即清理 apk 缓存
RUN apk add --no-cache curl openssl ca-certificates

# 复制依赖配置并只安装生产依赖，安装后清除 npm 缓存
COPY package.json .
RUN npm install --omit=dev && npm cache clean --force

# 复制应用代码
COPY index.js index.html .

EXPOSE 3000

CMD ["node", "index.js"]
