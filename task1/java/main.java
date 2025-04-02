import java.util.Scanner;

public class main {
    public static int minOperations(String s) {
        int n = s.length();
        int maxI = -1;
        // Перебираем возможные длины подстроки, начиная с наибольшей
        for (int i = n / 2 - 1; i >= 0; i--) {
            int substrLen = i + 1;
            if (2 * substrLen > n) {
                continue;
            }
            // Проверяем, совпадает ли первая подстрока с последующей
            if (s.substring(0, substrLen).equals(s.substring(substrLen, 2 * substrLen))) {
                maxI = i;
                break;
            }
        }
        // Возвращаем минимальное количество операций
        return maxI != -1 ? n - maxI : n;
    }

    public static void main(String[] args) {
        //тут получаем строку от пользователя, обрабатываем, выводим
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите строку: ");
        String s = scanner.nextLine().trim();
        System.out.println("Результат: " + minOperations(s));
        scanner.close();
    }
}
