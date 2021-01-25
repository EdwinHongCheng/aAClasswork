/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/***/ ((module) => {

eval("class DOMNodeCollection {\n\n    constructor(array) {\n        this.array = array;\n    }\n\n    html(str) {\n\n        if (!str) {\n            // getter\n            return this.array[0].innerHTML;\n        } else {\n            // setter\n            this.array.forEach(ele => {\n                ele.innerHTML = str;\n            })\n        }\n    }\n\n    empty() {\n        this.array.forEach(ele => {\n            ele.innerHTML = \"\";\n        })\n    }\n\n    append(arg) {\n        this.array.forEach((el1) => {\n            arg.array.forEach(el2=>{\n                el1.insertAdjacentHTML(\"beforeend\",el2.outerHTML);\n            })\n        });\n    };\n\n\n\n}\n\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nwindow.$l = function(arg){\n\n    if (arg instanceof HTMLElement) {\n\n        let dNC = new DOMNodeCollection( [arg] );\n\n        return dNC;\n\n    } else if (typeof arg === \"string\") {\n\n        let nodeList = document.querySelectorAll(arg);\n        let array = Array.from(nodeList);\n\n        let dNC = new DOMNodeCollection(array);\n\n        return dNC;\n\n    }\n\n};\n\n//# sourceURL=webpack:///./src/index.js?");
})();

/******/ })()
;