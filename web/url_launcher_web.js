// JavaScript для поддержки url_launcher в веб-версии
window.openExternalUrl = function (url) {
    // Открываем URL в новой вкладке
    window.open(url, "_blank");
    return true;
};
