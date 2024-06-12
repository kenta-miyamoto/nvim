// 閏年を計算する
function isLeapYear(year: number): boolean {
  return year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0);
}

isLeapYear(2020); // true
isLeapYear(2021); // false

console.log('');
console.log('--------------------------------------------------');
console.log('');

