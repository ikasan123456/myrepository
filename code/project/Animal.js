


export class Main {
  constructor() {
  }






}




export class Animal {
  constructor(name) {
    this.name = name;
  }

  speak() {
    console.log(`${this.name} が鳴いている`);
  }
}



//コンソールログのラッパー
export function log(message) {
  console.log(message);
}

export function lol() {
  console.log("lol");
}
//y = ax^2 + bx + c
export function quadratic(a , b, c ,x){
  return a * x * x + b * x + c;
}