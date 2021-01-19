// Version 1

// Function.prototype.inherits = function(parentClass) {
//     function Surrogate() {};

//     Surrogate.prototype = parentClass.prototype;

//     this.prototype = new Surrogate();

//     this.prototype.constructor = this;
// }



// Version 2 - use Object.create

Function.prototype.inherits = function (parentClass) {

    this.prototype = Object.create(parentClass.prototype);

    this.prototype.constructor = this;
}



// Tests

function MovingObject() { }

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

MovingObject.prototype.move = function() {
    console.log("Look Ma, no hands!");
}

Asteroid.prototype.burns = function() {
    console.log("IT BURNSSSSSS")
}

let mo = new MovingObject();
let s = new Ship();
let a = new Asteroid();

mo.move(); // Look Ma, no hands!
s.move(); // Look Ma, no hands!
a.move(); // Look Ma, no hands!

a.burns(); // IT BURNSSSSSS


// console.log(mo.__proto__); // { move: [Function (anonymous)] }

// console.log(s.__proto__); // MovingObject { constructor: [Function: Ship] }

// console.log(a.__proto__); 
// MovingObject {
// constructor: [Function: Asteroid],
//     burns: [Function(anonymous)]
// }