import React from 'react';


class Clock extends React.Component {

    constructor(props) {
        super(props);

        this.state = {
            date: "Hello There"
        }
    }

    
    render() {
        return (
            <h1>
                <div>Cool Clock B)</div>
                {/* <div>`${this.state}`</div> */}
            </h1>
        )
    }
}


export default Clock;