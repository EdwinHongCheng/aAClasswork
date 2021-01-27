import React from 'react';

// ORDER OF OPERATIONS:

// 1. constructor
// 2. render
// 3. componentDidMount

// 4. componentWillUnmount (when the clock disappears from the page)
// - Reason: don't want memory leak 
//   - or else a ton of intervals will be running in the backgroud


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

    componentDidMount() {
        // instance variables can be created anywhere, not just in the constructor
        this.interval = setInterval(this.tick, 1000)
    }

    componentWillUnmount() {
        clearInterval(this.interval);
        this.interval = 0;
    }

    
    render() {

        let hours = this.state.date.getHours(); // .getHours - returns an integer (???)
        let minutes = this.state.date.getMinutes();
        let seconds = this.state.date.getSeconds();

        return (
            <h1 id="clock-header">
                <div id="coolClock">Cool Clock B)</div>
                <div id="time">
                    <div>Current Time: </div>
                    <div>{hours}:{minutes}:{seconds} PDT</div>
                </div>

                <div id="date">
                    <div>Current Date: </div>
                    <div>{this.state.date.toDateString()}</div>
                </div>

                <button onClick={() => this.componentWillUnmount()}>Stop Time</button>
                <br/>
                <button onClick={() => this.componentDidMount()}>Restart Time</button>
            </h1>
        )
    }
}


export default Clock;