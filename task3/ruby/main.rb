print "Введите количество чисел: "
input = gets.to_i  # Чтение количества чисел 

(0...input).each do |n|  # Цикл по диапазону
  print "Введите число: "
  num = gets.to_i  # Чтение числа
  
  dig_sum = 0  # Сумма цифр
  dig_work = 1  # Произведение цифр
  
  while num > 0  # Разбор числа на цифры
    dig = num % 10  # Получение последней цифры
    num /= 10  # Удаление обработанной цифры
    dig_sum += dig  # Накопление суммы
    dig_work *= dig  # Накопление произведения
  end

  puts n if dig_sum < dig_work  # Условный вывод в одну строку
end