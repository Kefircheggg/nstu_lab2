import java.util.Scanner;  // Импорт класса для ввода данных

class Main {
  public static void main(String[] args) {
    Scanner myObj = new Scanner(System.in);  // Создание объекта Scanner для чтения ввода
    System.out.print("Введите количество чисел: ");
    int n = Integer.parseInt(myObj.nextLine()); 
    for(int i = 0; i < n; i++) {  // Цикл обработки n чисел
        System.out.print("Введите число: ");
        int num = Integer.parseInt(myObj.nextLine());  // Чтение числ
        int digSum = 0;  // Сумма цифр числа
        int digWork = 1;  // Произведение цифр числа
        
        while (num > 0) {  // Разбор числа на цифры
            int dig = num % 10;  // Получение последней цифры
            num /= 10;  // Удаление обработанной цифры 
            digSum += dig;  // Накопление суммы
            digWork *= dig;  // Накопление произведения
        }

        if(digSum < digWork) {  // Проверка условия
            System.out.println(i);  // Вывод индекса числа (не самого числа)
        }
    }
  }
}