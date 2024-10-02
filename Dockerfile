# Використовуємо образ Node.js для збирання
FROM node:16 as build

# Встановлюємо робочий каталог
WORKDIR /app

# Копіюємо файл package.json і package-lock.json
COPY package*.json ./

# Встановлюємо залежності
RUN npm install

# Копіюємо решту коду
COPY . .

# Збираємо проект
RUN npm run build

# Використовуємо образ Nginx для сервінгу статичних файлів
FROM nginx:alpine

# Копіюємо зібрані файли в Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Копіюємо конфігурацію Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf 


# Команда для запуску Nginx
CMD ["nginx", "-g", "daemon off;"]
