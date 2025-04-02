import java.util.HashSet
import java.util.Scanner

fun checkLegality(address: String): Boolean {
    // Адрес должен содержать символ '@'
    if (!address.contains("@")) {return false}
    val user = address.split("@", limit = 2)[0]
    if(!address.split("@", limit = 2)[1].contains('.')) return false
    // Длина имени пользователя от 6 до 30 символов
    if (user.length < 6 || user.length > 30) {
        return false
    }
    // Запрещённые символы
    for (i in 0 until user.length) {
        val c = user[i]
        if ("&=+<>,_'-".indexOf(c) != -1) {
            return false
        }
    }
    // Имя пользователя не должно начинаться или заканчиваться точкой,
    // а также содержать две точки подряд
    if (user.startsWith(".") || user.endsWith(".")) { return false }
    if (user.contains("..")) { return false }
    return true
}

        // Функция очистки адреса: обрезается всё после символа '*'
        // и удаляются все точки в имени пользователя
        fun sanitizeName(address: String): String {
            val parts = address.split("@", limit = 2)
            val user = parts[0].split("*", limit = 2)[0].replace(".", "")
            return user + "@" + parts[1]
        }
        fun main() {
            val scanner = Scanner(System.`in`)
            print("Введите количество адресов: ")
            val n = scanner.nextLine().trim().toInt()
            val adrs: HashSet<String> = HashSet()
            for (i in 0 until n) {
                print("Введите адрес: ")
                val rawAdr = scanner.nextLine().trim()
                // Сначала проверяем исходный адрес
                if (checkLegality(rawAdr)) {
                    // Если адрес корректен, выполняем очистку
                    val adr = sanitizeName(rawAdr)
                    adrs.add(adr)
                }
            }
            println(adrs.size)
        }