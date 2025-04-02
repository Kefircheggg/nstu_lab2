def check_legality(address):
    # Разбиваем email на имя пользователя и проверяем длину
    user, domN = address.split('@')
    if not '.' in domN: return False
    if not (6 <= len(user) <= 30): return False
    # Проверяем, нет ли запрещенных символов
    if any(symb in "&=+<>,_'-" for symb in user): return False
    #Проверяем точки в начале/конце и двойные точки
    if user.startswith('.') or user.endswith('.') or ".." in user:
        return False
    return True  # Если все ок

def sanitize_name(address):
    # Разбиваем email на имя и домен
    user, domain = address.split('@', 1)
    # Убираем все после звездочки и точки в имени
    user = user.split('*', 1)[0].replace('.', '')
    return f"{user}@{domain}"  # Собираем обратно

adrs = set()
# Запрашиваем количество адресов
for _ in range(int(input("Введите количество адресов: "))):
    # Читаем и чистим ввод
    raw_adr = input("Введите адрес: ").strip().lower()
    if check_legality(raw_adr):  # Если email валидный
        adr = sanitize_name(raw_adr)  # Чистим его
        adrs.add(adr)  # Добавляем в set 
print(len(adrs))