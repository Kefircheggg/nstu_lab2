const prompter = require('prompt-sync')();

const checkLegality = (address) => {
    if (!address.includes('@')) return false;
    const user = address.split('@')[0];
    // Длина юзнейма части должна быть от 6 до 30 символов
    if (user.length < 6 || user.length > 30) return false;
    // Проверяем, что в юзнейм нет запрещённых символов
    for (let i = 0; i < user.length; i++) {
        if ("&=+<>,_'-".includes(user[i])) return false;
    }
    if (user.startsWith('.') || user.endsWith('.')) return false; //юз нейм не начинается и не заканчивается точкой,
    if (user.includes('..')) return false; // и не содержит двух точек подряд
    return true;
};

// отбрасываем всё, что идёт после символа '*', и удаляем точки из локальной части
const sanitizeName = (address) => {
    const [user, domain] = address.split('@');
    // Отбрасываем часть после символа '*'
    const sanitizedUser = user.split('*', 1)[0].replace(/\./g, '');
    return `${sanitizedUser}@${domain}`;
};

const adrs = new Set();
const n = +prompter('Введите количество адресов: ');
for (let i = 0; i < n; i++) {
    const input = prompter('Введите адрес: '); 
    // Сначала проверяем, соответствует ли адрес правилам
    if (checkLegality(input)) {
        // Если адрес корректен, то санитайзим его и добавляем в множество
        const adr = sanitizeName(input);
        adrs.add(adr);
    }
}
console.log(adrs.size);