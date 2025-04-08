#!/bin/bash

# Скрипт для перезапуска Nginx сервера для Flutter веб-приложения

# Определяем пути
NGINX_DIR="/root/nginx-files"
NGINX_CONF="$NGINX_DIR/nginx.conf"
NGINX_PID="/root/nginx.pid"
NGINX_ACCESS_LOG="/root/nginx-access.log"
NGINX_ERROR_LOG="/root/nginx-error.log"

# Выводим информацию о запуске скрипта
echo "Запуск скрипта перезапуска Nginx..."
echo "Используется конфигурация: $NGINX_CONF"

# Проверяем конфигурацию Nginx перед запуском
echo "Проверка конфигурации Nginx..."
nginx -t -c "$NGINX_CONF"
if [ $? -ne 0 ]; then
    echo "Ошибка: Неверная конфигурация Nginx"
    exit 1
fi

# Проверяем, запущен ли Nginx
if [ -f "$NGINX_PID" ]; then
    echo "Останавливаем текущий процесс Nginx..."
    PID=$(cat "$NGINX_PID")
    if ps -p $PID > /dev/null; then
        nginx -s stop -c "$NGINX_CONF"
        if [ $? -ne 0 ]; then
            echo "Принудительное завершение процесса Nginx (PID: $PID)..."
            kill -9 $PID 2>/dev/null
            rm -f "$NGINX_PID"
        else
            echo "Nginx успешно остановлен"
        fi
    else
        echo "PID файл существует, но процесс не найден. Удаляем PID файл."
        rm -f "$NGINX_PID"
    fi
else
    echo "Nginx не запущен (PID файл не найден)"
fi

# Небольшая пауза перед запуском
sleep 1

# Запускаем Nginx с указанной конфигурацией
echo "Запуск Nginx..."

# Не пытаемся изменять права доступа к директории логов
# так как у нас может не быть соответствующих прав

# Запускаем Nginx с указанной конфигурацией
nginx -c "$NGINX_CONF"

# Проверяем результат запуска
if [ $? -eq 0 ]; then
    echo "Nginx успешно запущен!"
    echo "Веб-приложение доступно по адресу: http://localhost:8080"
    exit 0
else
    echo "Ошибка: Не удалось запустить Nginx"
    echo "Проверьте конфигурацию и права доступа"
    exit 1
fi