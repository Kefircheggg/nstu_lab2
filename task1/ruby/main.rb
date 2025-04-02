def min_operations(s)
  n = s.length
  max_i = -1
  # Перебираем возможные длины подстроки, начиная с наибольшей
  (n / 2 - 1).downto(0) do |i|
    substr_len = i + 1
    next if 2 * substr_len > n
    # Проверяем, совпадает ли первая подстрока с последующей
    if s[0...substr_len] == s[substr_len...(2 * substr_len)]
      max_i = i
      break
    end
  end
  # Возвращаем минимальное количество операций
  max_i != -1 ? n - max_i : n
end

#тут получаем строку от пользователя, обрабатываем, выводим
puts "Введите строку:"
s = gets.chomp
puts "Результат: #{min_operations(s)}"
