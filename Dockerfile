# Перший етап: побудова додатку
FROM node:14 as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Другий етап: налаштування Nginx
FROM nginx:alpine

# Встановлюємо утиліту envsubst для заміни змінних
RUN apk --no-cache add gettext

# Копіюємо конфігураційні файли
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Виконуємо заміну змінних у конфігураційному файлі перед запуском Nginx
CMD ["sh", "-c", "envsubst < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]

EXPOSE 8080
