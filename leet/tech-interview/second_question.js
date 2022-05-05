// A vending machine has the following denominations: 1c, 5c, 10c, 25c, 50c, and $1. Your task is to write a program that will be used in a vending machine to return change. Assume that the vending machine will always want to return the least number of coins or notes. Devise a function getChange(M, P) where M is how much money was inserted into the machine and P the price of the item selected, that returns an array of integers representing the number of each denomination to return.

// getChange(5, 0.99) // should return [1,0,0,0,0,4]
// getChange(3.14, 1.99) // should return [0,1,1,0,0,1]
// getChange(3, 0.01) // should return [4,0,2,1,1,2]
// getChange(4, 3.14) // should return [1,0,1,1,1,0]
// getChange(0.45, 0.34) // should return [1,0,1,0,0,0]

const getChange = (money, price) => {
  var changeArray = [0, 0, 0, 0, 0, 0];

  change = money*100 - price*100;

  for (var i = 5; 0 <= i; i--) {
    if (0 === i) {
      
      tmp = change % 1;

      sub = change - tmp

      
      final = sub/1

      change -= final*1;

      
      changeArray[i] = final;
    } else if (1 === i) {
      
      tmp = change % 5;

      sub = change - tmp

      
      final = sub/5

      change -= final*5;

      
      changeArray[i] = final;
    } else if (2 === i) {
      
      tmp = change % 10;

      sub = change - tmp

      
      final = sub/10

      change -= final*10;

      
      changeArray[i] = final;
    } else if (3 === i) {
      
      tmp = change % 25;

      sub = change - tmp

      
      final = sub/25

      change -= final*25;

      
      changeArray[i] = final;
    } else if (4 === i) {
      
      tmp = change % 50;

      sub = change - tmp

      
      final = sub/50

      change -= final*50;

      
      changeArray[i] = final;
    } else if (5 === i) {
      
      tmp = change % 100;

      sub = change - tmp

      
      final = sub/100

      change -= final*100;

      
      changeArray[i] = final;
    }
  }

  // TO DOs
  // react
  // javascript + typescript
  // redux (cleanest code possible, learn from advanced courses)

  return changeArray;
};

console.log(getChange(5, 0.99)); // should return [1,0,0,0,0,4]
console.log(getChange(3.14, 1.99)) // should return [0,1,1,0,0,1]
console.log(getChange(3, 0.01)) // should return [4,0,2,1,1,2]
console.log(getChange(4, 3.14)) // should return [1,0,1,1,1,0]
console.log(getChange(0.45, 0.34)) // should return [1,0,1,0,0,0]
