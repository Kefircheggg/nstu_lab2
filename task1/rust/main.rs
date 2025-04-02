use std::io;
fn min_operations(s: &str) -> usize {
    let n = s.len();
    let mut max_i = None;
    // Перебираем возможные длины подстроки, начиная с наибольшей
    for i in (0..n / 2).rev() {
        let substr_len = i + 1;
        if 2 * substr_len > n {
            continue;
        }
        // Проверяем, совпадает ли первая подстрока с последующей
        if &s[0..substr_len] == &s[substr_len..2 * substr_len] {
            max_i = Some(i);
            break;
        }
    }
    // Возвращаем минимальное количество операций
    match max_i {
        Some(i) => n - i,
        None => n,
    }
}

fn main() {
    //тут получаем строку от пользователя, обрабатываем, выводим
    let mut input = String::new();
    println!("Введите строку: ");
    io::stdin().read_line(&mut input).expect("Ошибка чтения ввода");
    let input = input.trim();
    let result = min_operations(input);
    println!("Результат: {}", result);
}