print("Введите количество чисел: ", terminator: "")
let n: Int = Int(readLine() ?? "") ?? 0  // Чтение количества чисел с обработкой nil

for i in 0..<n {  // Цикл по всем числам (исправлен диапазон)
    print("Введите число: ", terminator: "")
    var number: Int = Int(readLine() ?? "") ?? 0  // Чтение числа с обработкой nil
    var digSum = 0  // Сумма цифр (исправлено с 1 на 0)
    var digWork = 1  // Произведение цифр
    while number > 0 {  // Разбор числа на цифры
        let dig = number % 10  // Получение последней цифры
        number /= 10  // Удаление обработанной цифры
        digSum += dig  // Накопление суммы
        digWork *= dig  // Накопление произведения
    }
    if digSum < digWork {  // Проверка условия
        print(i)  // Вывод индекса числа
    }
}