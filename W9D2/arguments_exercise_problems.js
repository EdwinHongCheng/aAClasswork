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
function sum(...args) {
    let numSum = 0;
    for (let i = 0; i < args.length; i++ ) {
        numSum += args[i];
    }
    return numSum;
}

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



Function.prototype.myBind = function(context) {
    let argsArr = [];
    
    for(let i = 0; i < arguments.length; i++){
        argsArr.push(arguments[i]);
    }
    
    let that = this;
    let argsArrExceptContext = argsArr.slice(1)

    
    return function() {
        return that.apply(argsArr[0], argsArrExceptContext)
    }


}


// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true