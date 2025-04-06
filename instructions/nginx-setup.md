# Создание MD файла с инструкциями

Я создам Markdown файл с инструкциями по настройке сервера в папке nginx-files. Вот команда для создания файла:

```bash
cat > /root/nginx-files/server_setup_instructions.md << 'EOF'
# Настройка сервера для AlgoLoad Flutter

## Шаг 1: Установка необходимых пакетов

```bash
sudo yum install git -y
sudo yum install nginx -y
```

## Шаг 2: Клонирование репозитория

```bash
mkdir algoview
cd algoview/
git clone https://github.com/jqp4/AlgoLoad-flutter-3.git
```

## Шаг 3: Настройка файлов Nginx

```bash
mkdir -p /root/nginx-files
cp -v /root/nginx.conf /root/nginx.pid /root/nginx-access.log /root/nginx-error.log /root/nginx-files/
```

## Шаг 4: Проверка конфигурации Nginx

```bash
nginx -t -c /root/nginx-files/nginx.conf
```

## Шаг 5: Остановка текущего процесса Nginx (если запущен)

```bash
ps -ef | grep nginx
kill -TERM [PID]  # Замените [PID] на идентификатор процесса
```

## Шаг 6: Запуск Nginx с вашей конфигурацией

```bash
nginx -c /root/nginx-files/nginx.conf
```

## Шаг 7: Настройка брандмауэра

```bash
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload
firewall-cmd --list-all
```

## Шаг 8: Проверка работы сервера

```bash
curl -I http://localhost:8080
ss -tulpn | grep 8080
```

## Решение проблем

### Если порт 8080 уже используется:

1. Проверьте, какой процесс использует порт:
```bash
ss -tulpn | grep 8080
```

2. Остановите процесс:
```bash
kill -TERM [PID]
```

3. Запустите Nginx снова:
```bash
nginx -c /root/nginx-files/nginx.conf
```

### Полезные команды

- Перезагрузка Nginx: `nginx -s reload -c /root/nginx-files/nginx.conf`
- Остановка Nginx: `nginx -s stop`
- Проверка IP-адреса: `hostname -I`
- Проверка маршрутов: `ip route show`
EOF
```

Файл с инструкциями создан в папке `/root/nginx-files/` с именем `server_setup_instructions.md`. Он содержит все необходимые шаги для настройки сервера, включая установку пакетов, настройку Nginx и брандмауэра, а также решение распространенных проблем.



