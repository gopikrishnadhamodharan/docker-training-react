FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build  /usr/share/nginx/html
#Default command will start nginx, no need to have explicit CMD to start nginx