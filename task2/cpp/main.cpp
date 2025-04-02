#include <iostream>
#include <string>
#include <set>
using namespace std;

// Проверяем, соответствует ли email требованиям
bool checkLegality(const string& address) {
    int atPos = address.find('@');
    if (atPos == string::npos) return false; // Если нет '@' — не email
    string user = address.substr(0, atPos); // Часть до '@'
    string domN = address.substr(atPos, address.length());
    if(domN.find('.') == string::npos) return false;
    // Длина имени пользователя должна быть 6-30 символов
    if (user.length() < 6 || user.length() > 30) return false;
    // Запрещенные символы в имени
    string bannedChars = "&=+<>,_'-";
    for (char c : user) {
        if (bannedChars.find(c) != string::npos) return false;
    }
    // Проверка на точки в начале/конце и двойные точки
    if (user.front() == '.' || user.back() == '.') return false;
    if (user.find("..") != string::npos) return false;
    return true; // если все ок
}
// Убираем звездочки и точки из имени
string sanitizeName(string address) {
    size_t atPos = address.find('@');
    string user = address.substr(0, atPos);
    string domain = address.substr(atPos + 1);
    // Обрезаем все после звездочки
    size_t starPos = user.find('*');
    if (starPos != string::npos) {
        user = user.substr(0, starPos);
    }
    // Удаляем все точки
    user.erase(remove(user.begin(), user.end(), '.'), user.end());
    return user + "@" + domain; // Собираем email обратно
}
int main() {
    int n;
    cout << "Введите количество адресов: ";
    cin >> n;
    cin.ignore(); // Чистим буфер
    set<string> adrs; // Храним уникальные адреса
    for (int i = 0; i < n; i++) {
        cout << "Введите адрес: ";
        string adr;
        getline(cin, adr);
        if (checkLegality(adr)) { // Если email валидный
            adr = sanitizeName(adr); // Чистим его
            adrs.insert(adr); // Добавляем в set (автоматическая уникальность)
        }
    }
    cout << adrs.size() << endl; // Выводим количество уникальных адресов
}