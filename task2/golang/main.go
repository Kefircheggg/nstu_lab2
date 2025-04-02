package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func checkLegality(address string) bool {
	// Разделяем адрес на части
	parts := strings.Split(address, "@")
	if len(parts) != 2 {
		return false
	}
	user := parts[0]
	if !strings.Contains(parts[1], ".") {
		return false
	}
	// Проверка длины имени пользователя
	if len(user) < 6 || len(user) > 30 {
		return false
	}
	// Проверка наличия запрещённых символов
	for _, char := range user {
		if strings.ContainsRune("&=+<>,_'-", char) {
			return false
		}
	}
	// Проверка точек в имени пользователя
	if strings.HasPrefix(user, ".") || strings.HasSuffix(user, ".") {
		return false
	}
	if strings.Contains(user, "..") {
		return false
	}
	return true
}

// Очистка имени пользователя
func sanitizeName(address string) string {
	parts := strings.Split(address, "@")
	user := strings.Split(parts[0], "*")[0]  // Отрезаем часть после '*'
	user = strings.ReplaceAll(user, ".", "") // Удаляем все точки
	return user + "@" + parts[1]
}
func main() {
	reader := bufio.NewReader(os.Stdin)
	var n int
	fmt.Print("Введите количество адресов: ")
	fmt.Scan(&n)
	adrs := make(map[string]bool)

	for i := 0; i < n; i++ {
		fmt.Print("Введите адрес: ")
		adr, _ := reader.ReadString('\n')
		adr = strings.TrimSpace(strings.ToLower(adr)) // Убираем пробелы и переводим в нижний регистр
		// Сначала проверяем на корректность, потом чистим
		if checkLegality(adr) {
			adr = sanitizeName(adr)
			adrs[adr] = true
		}
	}
	fmt.Println(len(adrs))
}
