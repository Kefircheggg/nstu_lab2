<?php
function checkLegality($address) {
    // Проверяем, что адрес содержит '@'
    if (!str_contains($address, '@')) {
        return false;
    }
    // Извлекаем имя пользователя
    list($user, $domain) = explode('@', $address, 2);
    if(!str_contains($domain,'.')) {return false;}
    // Длина имени пользователя должна быть от 6 до 30 символов
    if (strlen($user) < 6 || strlen($user) > 30) {
        return false;
    }
    // Проверяем наличие недопустимых символов в имени пользователя
    $invalidChars = "&=+<>,_'-";
    for ($i = 0; $i < strlen($user); $i++) {
        if (str_contains($invalidChars, $user[$i])) {
            return false;
        }
    }
    // Имя пользователя не должно начинаться или заканчиваться точкой, а также содержать две точки подряд
    if (str_starts_with($user, '.') || str_ends_with($user, '.')) { return false; }
    if (str_contains($user, '..')) { return false; }
    return true;
}
function sanitizeName($address) {
    // Разбиваем адрес на имя пользователя и домен
    list($user, $domain) = explode('@', $address, 2);
    // Обрезаем часть после символа '*', затем удаляем все точки
    $user = explode('*', $user, 2)[0];
    $user = str_replace('.', '', $user);  
    return $user . '@' . $domain;
}

$a = (int) readline("Введите количество адресов: ");
$adrs = array();
for ($n = 0; $n < $a; $n++) {
    $rawAdr = trim(readline("Введите адрес: "));
    // Сначала проверяем исходный адрес на корректность
    if (checkLegality($rawAdr)) {
        // Если адрес корректен, выполняем санитайзинг
        $adr = sanitizeName($rawAdr);
        // Добавляем адрес, если он ещё не содержится в массиве
        if (!in_array($adr, $adrs)) {
            $adrs[] = $adr;
        }
    }
}
print(count($adrs) . "\n");?>