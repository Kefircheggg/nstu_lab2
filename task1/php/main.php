<?php
function minOperations($s) {
    $n = strlen($s);
    $max_i = -1;
    // Перебираем возможные длины подстроки, начиная с наибольшей
    for ($i = intdiv($n, 2) - 1; $i >= 0; $i--) {
        $substr_len = $i + 1;
        if (2 * $substr_len > $n) {
            continue;
        }
        // Проверяем, совпадает ли первая подстрока с последующей
        if (substr($s, 0, $substr_len) === substr($s, $substr_len, $substr_len)) {
            $max_i = $i;
            break;
        }
    }
    // Возвращаем минимальное количество операций
    return $max_i !== -1 ? $n - $max_i : $n;
}

//тут получаем строку от пользователя, обрабатываем, выводим
echo "Введите строку: ";
$s = trim(fgets(STDIN));
echo "Результат: " . minOperations($s) . "\n";
?>