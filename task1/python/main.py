def min_operations(s):
    n = len(s)
    max_i = -1
    # Проверяем возможные позиции i, начиная с наибольшей
    for i in range((n // 2 - 1), -1, -1):
        substr_len = i + 1
        if 2 * substr_len > n:
            continue
        if s[:substr_len] == s[substr_len : 2 * substr_len]:
            max_i = i
            break  # Нашли максимальный подходящий i
    return n - max_i if max_i != -1 else n

#тут получаем строку от пользователя, обрабатываем, выводим
s = input("Введите строку: ")
print(min_operations(s))  