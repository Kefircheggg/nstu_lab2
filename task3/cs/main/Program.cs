using System;
class Program {
    static void Main(string[] args) {
        Console.Write("Введите количество чисел: ");
        int n = int.Parse(Console.ReadLine());  // Чтение количества чисел
        for (int i = 0; i < n; i++) {
            Console.Write("Введите число: ");
            int num = int.Parse(Console.ReadLine());  // Чтение очередного числа
            int digSum = 0;  // Сумма цифр числа
            int digWork = 1;  // Произведение цифр числа
            while (num > 0) {
                int dig = num % 10;  // Получение последней цифры
                num = num / 10;  // Удаление обработанной цифры
                digSum += dig;  // Накопление суммы
                digWork *= dig;  // Накопление произведения
            } 
            if (digSum < digWork) {  // Проверка условия
                Console.WriteLine(i);  // Вывод индекса числа
            }
        }
    }
}