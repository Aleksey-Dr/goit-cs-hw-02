# Полегшена (slim) версія Python 3.9, заснована на Debian 10 (buster)
FROM python:3.11-bookworm

# Встановлення робочого каталогу
WORKDIR /app

# Копіювання файлу вимог і встановлення залежності
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіювання решти коду застосунку
COPY . .

# Відкриття порту, на якому працюватиме застосунок FastAPI
EXPOSE 8000

# Команда для запуску застосунку Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
