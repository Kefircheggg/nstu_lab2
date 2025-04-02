use std::collections::HashSet;
use std::io;

fn check_legality(address: &str) -> bool {
    let user = address.split('@').next().unwrap_or("");
    if(!address.split('@').next().contains('.')) {return false}
    if user.len() < 6 || user.len() > 30 {
        return false;
    }
    let forbidden_chars = "&=+<>,_'-";
    if user.chars().any(|c| forbidden_chars.contains(c)) {
        return false;
    }
    if user.starts_with('.') || user.ends_with('.') || user.contains("..") {
        return false;
    }
    true
}

fn sanitize_name(address: &str) -> String {
    if let Some((user, domain)) = address.split_once('@') {
        let user = user.split('*').next().unwrap_or("").replace('.', "");
        return format!("{}@{}", user, domain);
    }
    address.to_string()
}
fn main() {
    let mut input = String::new();
    println!("Введите количество адресов: ");
    io::stdin().read_line(&mut input).expect("Ошибка ввода");
    let n: usize = input.trim().parse().expect("Введите корректное число");
    let mut adrs: HashSet<String> = HashSet::new();
    for _ in 0..n {
        let mut raw_adr = String::new();
        println!("Введите адрес: ");
        io::stdin().read_line(&mut raw_adr).expect("Ошибка ввода");
        let raw_adr = raw_adr.trim().to_lowercase();
        
        if check_legality(&raw_adr) {
            let adr = sanitize_name(&raw_adr);
            adrs.insert(adr);
        }
    }
    println!("{}", adrs.len());
}