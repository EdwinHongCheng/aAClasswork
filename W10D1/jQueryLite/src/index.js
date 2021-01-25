const DOMNodeCollection = require("./dom_node_collection.js");

window.$l = function(arg){

    if (arg instanceof HTMLElement) {

        let dNC = new DOMNodeCollection( [arg] );

        return dNC;

    } else if (typeof arg === "string") {

        let nodeList = document.querySelectorAll(arg);
        let array = Array.from(nodeList);

        let dNC = new DOMNodeCollection(array);

        return dNC;

    }

};