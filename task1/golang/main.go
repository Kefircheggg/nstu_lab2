package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func minOperations(s string) int {
	n := len(s)
	maxI := -1
	// Перебираем возможные длины подстроки, начиная с наибольшей
	for i := n/2 - 1; i >= 0; i-- {
		substrLen := i + 1
		if 2*substrLen > n {
			continue
		}
		// Проверяем, совпадает ли первая подстрока с последующей
		if s[:substrLen] == s[substrLen:2*substrLen] {
			maxI = i
			break
		}
	}
	// Возвращаем минимальное количество операций
	if maxI != -1 {
		return n - maxI
	}
	return n
}
func main() {
	//тут получаем строку от пользователя, обрабатываем, выводим
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Введите строку: ")
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)
	fmt.Printf("Результат: %d\n", minOperations(input))
}
