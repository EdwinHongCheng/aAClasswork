// 1. sum

// Write a sum function that takes any number of arguments:
// sum(1, 2, 3, 4) === 10;
// sum(1, 2, 3, 4, 5) === 15;

// Arguments Keyword Version
// function sum() {
//     let numSum = 0;
//     for (let i = 0; i < arguments.length; i++ ) {
//         numSum += arguments[i];
//     }
//     return numSum;
// }

// ... rest operator Version
// function sum(...args) {
//     let numSum = 0;
//     for (let i = 0; i < args.length; i++ ) {
//         numSum += args[i];
//     }
//     return numSum;
// }

// Tests
// console.log(sum(1, 2, 3))



// 2. bind with args

// Rewrite your myBind method so that it can take both bind-time arguments and call-time arguments.


class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// Markov says meow to Ned!
// true



// 1. Arguments Version

// Function.prototype.myBind = function(context) {

//     let that = this;

//     argsArr = [];

//     for (let i = 1; i < arguments.length; i++) {
//         argsArr.push(arguments[i])
//     }

//     return function() {
//         if (arguments.length > 0) {
//             for (let i = 0; i < arguments.length; i++) {
//                 argsArr.push(arguments[i])
//             }
//         }

//         that.apply(context, argsArr)
//     }
// }


// 2. ... Rest Operator Version

Function.prototype.myBind = function (context, ...args) {

    let that = this;

    return function () {
        if (arguments.length > 0) {
            for (let i = 0; i < arguments.length; i++) {
                args.push(arguments[i])
            }
        }

        that.apply(context, args)
    }
}


// Tests

// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!

// no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!

// bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!



// 3. curriedSum

function curriedSum(numArgs) {
    let numbers = [];
    
    function _curriedSum(num) {
        numbers.push(num);
        
        if (numbers.length === numArgs) {
            return numbers.reduce((a, b) => a + b, 0)
        } else {
            return _curriedSum;
        }
    }

    return _curriedSum;
}


// Tests
// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56



// 4. Function.prototype.curry


// 4.1. apply Version

Function.prototype.curry = function(numArgs) {
    let args = [];
    let that = this;

    function _curry(arg){
        args.push(arg);

        if (args.length === numArgs){
            return that.apply(that, args);
        }else{
            return _curry;
        }

    }
    return _curry;
}


//4.2 spread operator version

Function.prototype.curry = function (numArgs) {
    let args = [];
    let that = this;

    function _curry(...arg) {
        for(let i = 0; i < arg.length; i++){
            args.push(arg[i])
        }

        if (args.length === numArgs) {
            return that(...args);
        } else {
            return _curry;
        }

    }
    return _curry;
}


function tripleAdd(num1, num2, num3){
    return num1 + num2 + num3;
}

let func = tripleAdd.curry(3);
console.log(func(1,2));
// console.log(func(2));
console.log(func(3));
