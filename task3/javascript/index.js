const prompt = require('prompt-sync')();

const n = +prompt('Введите количество чисел: ')
for(let i = 0; i < n; i++) {
    let num = +prompt('Введите число: ')
    let digSum = 0;
    let digWork = 1;
    while(num>0) {
        const dig = num % 10
        num = Math.floor(num / 10)
        digSum+=dig
        digWork*=dig
    }
    digSum < digWork && console.log(i)
}