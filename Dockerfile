FROM node:14 as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

RUN apk --no-cache add gettext

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

CMD ["sh", "-c", "envsubst < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]

EXPOSE 8080
