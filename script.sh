#!/usr/bin/bash

# 1. Список вебсайтів
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    "https://bebebe.com"
)

# 3. Запис результатів у файл
LOG_FILE="website_status.log"

# Очищаємо файл логів перед кожним запуском
> "$LOG_FILE"

echo "Початок перевірки доступності вебсайтів..."
echo "Результати будуть записані у файл: $LOG_FILE"
echo ""

# 2. Перевірка доступності та 4. Форматування виходу
for site in "${websites[@]}";
do
    # Використовуємо curl для отримання HTTP статус-коду
    # -o /dev/null приховує вивід тіла відповіді
    # -s приховує прогрес
    # -w "%{http_code}" виводить лише HTTP статус-код
    http_code=$(curl -o /dev/null -s -w "%{http_code}" "$site")

    if [ "$http_code" -eq 200 ];
    then
        status="$site is UP"
    else
        status="$site is DOWN (HTTP Code: $http_code)"
    fi

    echo "$status" | tee -a "$LOG_FILE"
done

# 5. Вивід інформації
echo ""
echo "Перевірку доступності вебсайтів завершено."
echo "Всі результати записано у файл логів: $LOG_FILE"