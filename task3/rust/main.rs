fn main() {
    use std::io::{stdin, stdout, Write};  // Импорт необходимых модулей ввода-вывода
    print!("Введите количество чисел: ");
    let _ = stdout().flush();  // Принудительный вывод буфера (чтобы print! работал сразу)
    let mut input_line = String::new();  // Буфер для ввода
    stdin().read_line(&mut input_line).expect("Failed to read line");  // Чтение строки
    let x: u16 = input_line.trim().parse().expect("Input not an integer");  // Парсинг числа
    for n in 0..x {  // Цикл по всем числам
        print!("Введите число: ");
        let _ = stdout().flush();  // Снова сброс буфера
        let mut number = String::new();  // Буфер для числа
        stdin().read_line(&mut number).expect("Failed to read line");  // Чтение числа
        let mut num: u16 = number.trim().parse().expect("Input not an integer");  // Парсинг числа   
        let mut digSum = 0;  // Сумма цифр
        let mut digWork = 1;  // Произведение цифр
        while num > 0 {  // Разбираем число на цифры
            let dig = num % 10;  // Последняя цифра
            num = num / 10;  // Убираем последнюю цифру
            digSum += dig;  // Накопление суммы
            digWork *= dig;  // Накопление произведения
        }
        if digSum < digWork {  // Проверка условия
            print!("{}\n", n);  // Вывод индекса числа
            let _ = stdout().flush();  // Сброс буфера вывода
        }
    }
}