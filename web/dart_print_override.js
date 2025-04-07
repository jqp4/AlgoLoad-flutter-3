// Скрипт для перенаправления print() из Dart в консоль браузера в production-режиме

// Глобальная переменная для включения/отключения логирования
window.dartPrintEnabled = true;

// Функция для перехвата print() из Dart
window.dartPrint = function (message) {
    if (window.dartPrintEnabled && console.log) {
        console.log("[DART]", message);
    }
};

// Функция для перехвата ошибок из Dart
window.dartPrintError = function (message) {
    if (window.dartPrintEnabled && console.error) {
        console.error("[DART ERROR]", message);
    }
};

// Сохраняем оригинальную функцию console.log
var originalConsoleLog = console.log;

// Перехватываем console.log для обработки сообщений из Dart
console.log = function () {
    originalConsoleLog.apply(console, arguments);
};

// Сохраняем оригинальную функцию console.error
var originalConsoleError = console.error;

// Перехватываем console.error для обработки ошибок из Dart
console.error = function () {
    originalConsoleError.apply(console, arguments);
};

// Уведомление о загрузке скрипта
console.log("[DART PRINT OVERRIDE] Initialized");
