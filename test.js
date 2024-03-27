// 閏年を計算する
function isLeapYear(year) {
	return year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0);
}

console.log(isLeapYear(2000)); // true

function testFunction(word) {
  let result
	result = word.toLowerCase();
	result = result.split;
	console.log(result);
}

