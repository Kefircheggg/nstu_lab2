import java.util.HashSet;
import java.util.Scanner;

class Main {
    public static boolean checkLegality(String address) {
        // Адрес должен содержать символ '@'
        if (!address.contains("@")) {return false;}
        String user = address.split("@", 2)[0];
        String domN = address.split("@", 2)[1];
        if(!domN.contains(".")) {return false;}
        // Длина имени пользователя от 6 до 30 символов
        if (user.length() < 6 || user.length() > 30) {return false;}
        // Запрещённые символы
        for (int i = 0; i < user.length(); i++) {
            char c = user.charAt(i);
            if ("&=+<>,_'-".indexOf(c) != -1) {return false;}
        }
        // Имя пользователя не должно начинаться или заканчиваться точкой,
        // а также содержать две точки подряд
        if (user.startsWith(".") || user.endsWith(".")) {return false;}
        if (user.contains("..")) {return false;}
        return true;
    }
    // Функция очистки адреса: обрезается всё после символа '*'
    // и удаляются все точки в имени пользователя
    public static String sanitizeName(String address) {
        String[] parts = address.split("@", 2);
        String user = parts[0].split("\\*", 2)[0].replace(".", "");
        return user + "@" + parts[1];
    }
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите количество адресов: ");
        int n = Integer.parseInt(scanner.nextLine().trim());
        HashSet<String> adrs = new HashSet<>();
        for (int i = 0; i < n; i++) {
            System.out.print("Введите адрес: ");
            String rawAdr = scanner.nextLine().trim().toLowerCase();
            // Сначала проверяем исходный адрес
            if (checkLegality(rawAdr)) {
                // Если адрес корректен, выполняем очистку
                String adr = sanitizeName(rawAdr);
                adrs.add(adr);
            }
        } 
        System.out.println(adrs.size());
    }
}