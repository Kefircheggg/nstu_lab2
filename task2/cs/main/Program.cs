using System;
using System.Collections.Generic;
public class Program {
    public static bool checkLegality(string address) {
        // Адрес должен содержать символ '@'
        if (!address.Contains("@")) return false;
        string[] parts = address.Split(new char[] { '@' }, 2);
        string user = parts[0];
        if(!parts[1].Contains(".")) return false;
        // Длина имени пользователя от 6 до 30 символов
        if (user.Length < 6 || user.Length > 30)  return false;
        // Запрещённые символы
        for (int i = 0; i < user.Length; i++) {
            char c = user[i];
            if ("&=+<>,_'-".IndexOf(c) != -1) return false;
            }
        // Имя пользователя не должно начинаться или заканчиваться точкой,
        // а также содержать две точки подряд
        if (user.StartsWith(".") || user.EndsWith(".")) return false;
        if (user.Contains("..")) return false;
        return true;
    }

    // Функция очистки адреса: обрезается всё после символа '*'
    // и удаляются все точки в имени пользователя
    public static string sanitizeName(string address) {
        string[] parts = address.Split(new char[] { '@' }, 2);
        string user = parts[0].Split(new char[] { '*' }, 2)[0].Replace(".", "");
        return user + "@" + parts[1];
    }
    public static void Main(string[] args) {
        Console.Write("Введите количество адресов: ");
        int n = int.Parse(Console.ReadLine());
        List<string> adrs = new List<string>();
        for (int i = 0; i < n; i++) {
            Console.Write("Введите адрес: ");
            string rawAdr = Console.ReadLine();
            // Сначала проверяем исходный адрес
            if (checkLegality(rawAdr)) {
                // Если адрес корректен, выполняем очистку
                string adr = sanitizeName(rawAdr);
                adrs.Add(adr);
            }
        }
        Console.WriteLine(adrs.Count);
    }
}

