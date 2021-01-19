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


Function.prototype.myBind = function(context) {

    let cntxt = context

    return function(arguments) {
        return this.apply(context, )
    }
}

