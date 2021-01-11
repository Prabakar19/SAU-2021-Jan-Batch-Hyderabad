let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

//custome map
function customMap(arr, fn) {
  let ar = [];
  for (let i of arr) {
    ar.push(fn(i));
  }
  return ar;
}

//square each element in an array
let result1 = customMap(array, (a) => a * a);
console.log(result1);

//custom reduce
function customReduce(arr, fn) {
  let sum = 0;
  for (let i of arr) {
    sum = fn(sum, i);
  }
  return sum;
}

//sum of the array
let result = customReduce(array, (a, b) => a + b);
console.log(result);
