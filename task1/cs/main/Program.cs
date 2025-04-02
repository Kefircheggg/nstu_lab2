using System;
class Program {
    static int MinOperations(string s) {
        int n = s.Length;
        int maxI = -1;
        // Перебираем возможные длины подстроки, начиная с наибольшей
        for (int i = n / 2 - 1; i >= 0; i--)  {
            int substrLen = i + 1;
            if (2 * substrLen > n) {
                continue;
            }
            // Проверяем, совпадает ли первая подстрока с последующей
            if (s.Substring(0, substrLen) == s.Substring(substrLen, substrLen)) {
                maxI = i;
                break;
            }
        }
        // Возвращаем минимальное количество операций
        return maxI != -1 ? n - maxI : n;
    }

    static void Main() {
        //тут получаем строку от пользователя, обрабатываем, выводим
        Console.Write("Введите строку: ");
        string s = Console.ReadLine();
        Console.WriteLine("Результат: " + MinOperations(s));
    }
}
