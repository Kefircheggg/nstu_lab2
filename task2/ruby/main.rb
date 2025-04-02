require 'set' # модуль для множеств
# Проверяем валидность email адреса
def check_legality(address)
  user = address.split('@').first# Выделяем часть до @ (имя пользователя)
  domN = address.split('@').second
  return false if not domN.include?(".")
  return false if user.length < 6 || user.length > 30# Проверяем длину имени (6-30 символов)
  return false if user.chars.any? { |c| "&=+<>,_'-".include?(c) }# Проверяем на наличие запрещенных символов
  # Проверяем точки в начале/конце и двойные точки
  return false if user.start_with?('.') || user.end_with?('.')
  return false if user.include?('..')
  
  true # Если все проверки пройдены
end
# Нормализуем email (удаляем лишнее)
def sanitize_name(address)
  user, domain = address.split('@', 2)# Разбиваем на имя и домен
  user = user.split('*').first.gsub('.', '')# Удаляем все после звездочки и все точки
  "#{user}@#{domain}"# Собираем emil обратно
end
# Основная программа
print "Введите количество адресов: "
n = gets.to_i # Читаем количество адресов
adrs = Set.new # Создаем множество для хранения уникальных адресов
n.times do
  # Читаем и чистим ввод
  raw_adr = gets.chomp.strip
  # Если адрес валидный
  if check_legality(raw_adr)
    # Нормализуем его
    adr = sanitize_name(raw_adr)
    # Добавляем в множество (автоматическая уникальность)
    adrs.add(adr)
  end
end
puts adrs.size