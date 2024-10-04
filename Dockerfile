# Вказуємо базовий образ
FROM python:3.9-slim

# Встановлюємо робочий каталог
WORKDIR /app

# Копіюємо файли проєкту в контейнер
COPY . /app

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Вказуємо команду для запуску програми
CMD ["python", "main.py"]
