import React from 'react';


class Clock extends React.Component {

    constructor(props) {

        super(props);

        let currentDate = new Date();

        this.state = {
            date: currentDate
        }

        this.tick = this.tick.bind(this);
    }

    tick(){
        this.setState( { date: new Date() } )
    }

    componentDidMount(){
        setInterval(this.tick, 1000)
    }

    
    render() {
        return (
            <h1>
                <div>Cool Clock B)</div>
                <div>Current Date: {this.state.date.toString()}</div>
            </h1>
        )
    }
}


export default Clock;