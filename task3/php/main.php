<?php
$a = (int)readline("Введите количество чисел: ");  // Получаем количество чисел для обработки

for($n = 0; $n < $a; $n++) {
   $num = (int)readline("Введите число: ");  // Читаем очередное число
   $digSum = 0;  // Инициализация суммы цифр (исправлено с 1 на 0)
   $digWork = 1;  // Инициализация произведения цифр
    
    while ($num > 0) {
        $dig = $num % 10;  // Получаем последнюю цифру
        $num = (int)($num / 10);  // Удаляем последнюю цифру
        $digSum += $dig;  // Добавляем цифру к сумме
        $digWork *= $dig;  // Умножаем на произведение
    }
    
    if ($digSum < $digWork) {  // Проверяем условие
        echo $n . "\n";  // Выводим индекс числа (не само число!)
    }
}
?>