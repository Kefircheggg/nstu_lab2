import java.util.Scanner  // Для ввода данных

fun main() {
    val myObj = Scanner(System.`in`)  // Создаем сканер для чтения ввода
    print("Введите количество чисел: ")

    val n = myObj.nextLine().toInt()  // Читаем количество чисел

    for (i in 0 until n) {
        print("Введите число: ")
        var num = myObj.nextLine().toInt()  // Читаем очередное число
        
        var digSum = 0  // Будем хранить сумму цифр
        var digWork = 1  // Будем хранить произведение цифр
        while (num > 0) {
            val dig = num % 10  // Получаем последнюю цифру
            num /= 10  // Убираем обработанную цифру
            digSum += dig  // Добавляем к сумме
            digWork *= dig  // Умножаем произведение
        }

        if (digSum < digWork) {  // Если сумма меньше произведения
            println(i)  // Выводим индекс числа (не само число!)
        }
    }
}