func minOperations(_ s: String) -> Int {
    let n = s.count
    var maxI = -1
    let chars = Array(s)
    // Перебираем возможные длины подстроки, начиная с наибольшей
    for i in stride(from: n / 2 - 1, through: 0, by: -1) {
        let substrLen = i + 1
        if 2 * substrLen > n { continue }
        // Проверяем, совпадает ли первая подстрока с последующей
        if chars[0..<substrLen] == chars[substrLen..<(2 * substrLen)] {
            maxI = i
            break
        }
    }
    // Возвращаем минимальное количество операций
    return maxI != -1 ? n - maxI : n
}
//тут получаем строку от пользователя, обрабатываем, выводим
print("Введите строку: ", terminator: "")
let s = readLine() ?? ""
print(minOperations(s)) 