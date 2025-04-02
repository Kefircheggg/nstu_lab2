.global _main
.align 2

_main:
    // Вывод приглашения
    mov x0, #1          // stdout
    adr x1, prompt      // адрес строки
    mov x2, #prompt_len // длина строки
    mov x16, #4         // syscall write
    svc #0

    // Чтение числа
    mov x0, #0          // stdin
    sub sp, sp, #16     // выделяем 16 байт на стеке
    mov x1, sp          // буфер для ввода
    mov x2, #16         // размер буфера
    mov x16, #3         // syscall read
    svc #0

    // Преобразование ASCII в число и вычисление суммы и произведения цифр
    mov x19, #0         // sum = 0
    mov x20, #1         // product = 1
    mov x21, sp         // указатель на буфер
convert_loop:
    ldrb w22, [x21], #1 // загружаем символ
    cmp w22, #10        // проверка на перенос строки (Enter)
    beq convert_done
    sub w22, w22, #'0'  // ASCII в число
    add x19, x19, x22   // sum += digit
    mul x20, x20, x22   // product *= digit
    b convert_loop
convert_done:

    // Сравнение суммы и произведения
    cmp x19, x20
    bge print_zero

print_one:
    mov x0, #1          // stdout
    adr x1, one_msg     // строка "1"
    mov x2, #2          // длина строки
    mov x16, #4         // syscall write
    svc #0
    b exit

print_zero:
    mov x0, #1          // stdout
    adr x1, zero_msg    // строка "0"
    mov x2, #2          // длина строки
    mov x16, #4         // syscall write
    svc #0

exit:
    // Завершение программы
    mov x0, #0
    mov x16, #1
    svc #0

prompt:
    .ascii "Введите число: "
prompt_len = . - prompt

one_msg:
    .ascii "1\n"
zero_msg:
    .ascii "0\n"
