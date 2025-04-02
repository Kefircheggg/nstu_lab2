const prompt = require('prompt-sync')();


function minOperations(s) {
    let n = s.length;
    let max_i = -1;
    // Перебираем возможные длины подстроки, начиная с наибольшей
    for (let i = Math.floor(n / 2) - 1; i >= 0; i--) {
        let substr_len = i + 1;
        if (2 * substr_len > n) continue;
        // Проверяем, совпадает ли первая подстрока с последующей
        if (s.slice(0, substr_len) === s.slice(substr_len, 2 * substr_len)) {
            max_i = i;
            break;
        }
    }
    // Возвращаем минимальное количество операций
    return max_i !== -1 ? n - max_i : n;
}

//тут получаем строку от пользователя, обрабатываем, выводим
let s = prompt("Введите строку: ");
console.log(minOperations(s)); 