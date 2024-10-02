# Вихідний образ
FROM node:14

# Створення робочої директорії в контейнері
WORKDIR /app

# Копіюємо package.json і package-lock.json
COPY package*.json ./

# Встановлюємо залежності
RUN npm install

# Копіюємо всі файли проекту
COPY . .

# Відкриваємо порт для доступу
EXPOSE 3000

# Команда для запуску додатку
CMD ["npm", "start"]
