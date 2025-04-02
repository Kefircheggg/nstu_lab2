fun minOperations(s: String): Int {
    val n = s.length
    var maxI = -1
    
    // Перебираем возможные длины подстроки, начиная с наибольшей
    for (i in (n / 2 - 1) downTo 0) {
        val substrLen = i + 1
        if (2 * substrLen > n) continue
        // Проверяем, совпадает ли первая подстрока с последующей
        if (s.substring(0, substrLen) == s.substring(substrLen, 2 * substrLen)) {
            maxI = i
            break
        }
    }
    // Возвращаем минимальное количество операций
    return if (maxI != -1) n - maxI else n
}

fun main() {
    //тут получаем строку от пользователя, обрабатываем, выводим
    print("Введите строку: ")
    val input = readLine()? ?: ""
    println("Результат: ${minOperations(input)}")
}
