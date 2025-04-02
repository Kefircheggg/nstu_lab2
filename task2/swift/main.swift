import Foundation
func checkLegality(address: String) -> Bool {
    if !address.contains("@") { return false }// Проверяем, что адрес содержит символ '@'
    // вычленяем юзер
    let parts = address.split(separator: "@", maxSplits: 1, omittingEmptySubsequences: false)
    let user = String(parts[0])
    if !String(parts[1]).contains(".") {return false}
    // Длина от 6 до 30 символов
    if user.count < 6 || user.count > 30 { return false }
    // Проверяем, что в локальной части нет запрещённых символов
    for ch in user {
        if "&=+<>,_'-".contains(ch) {return false}
    }
    if user.hasPrefix(".") || user.hasSuffix(".") { return false }
    if user.contains("..") { return false }
    return true
}
// Отбрасываем всё, что идёт после символа '*', и удаляем точки из локальной части.
func sanitizeName(address: String) -> String {
    let parts = address.split(separator: "@", maxSplits: 1, omittingEmptySubsequences: false)
    let userPart = String(parts[0])
    let domainPart = String(parts[1])
    // Отбрасываем часть локальной части после символа '*'
    let userPt1 = userPart.split(separator: "*", maxSplits: 1, omittingEmptySubsequences: false).first ?? ""
    let finalUser = userPt1.replacingOccurrences(of: ".", with: "") // Убираем все точки
    return "\(finalUser)@\(domainPart)"
}

print("Введите количество адресов: ", terminator: "")
var adrs = Set<String>()
let n = Int(readLine() ?? "") ?? 0
// Считываем адреса, проверяем их легальность, затем санитайзим и сохраняем уникальные адреса
for _ in 0..<n {
    print("Введите адрес: ", terminator: "")
    if let input = readLine() {
        if checkLegality(address: input) {
            let sanitized = sanitizeName(address: input)
            adrs.insert(sanitized)
        }
    }
}
print(adrs.count)// Выводим количество уникальных корректных адресов