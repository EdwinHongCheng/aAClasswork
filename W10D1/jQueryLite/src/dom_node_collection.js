class DOMNodeCollection {

    constructor(array) {
        this.array = array;
    }

    html(str) {

        if (!str) {
            // getter
            return this.array[0].innerHTML;
        } else {
            // setter
            this.array.forEach(ele => {
                ele.innerHTML = str;
            })
        }
    }

    empty() {
        this.array.forEach(ele => {
            ele.innerHTML = "";
        })
    }

    append(arg) {
        this.array.forEach((el1) => {
            arg.array.forEach(el2=>{
                el1.insertAdjacentHTML("beforeend",el2.outerHTML);
            })
        });
    };



}

module.exports = DOMNodeCollection;