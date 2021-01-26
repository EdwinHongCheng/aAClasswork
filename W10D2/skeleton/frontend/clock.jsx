import React from 'react';


class Clock extends React.Component {

    constructor(props) {

        super(props);

        let currentDate = new Date();

        this.state = {
            date: currentDate
        }

        this.tick = this.tick.bind(this);

        this.interval = 0;
    }

    tick(){
        this.setState( { date: new Date() } )
    }

    componentDidMount() {
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
            <h1>
                <div>Cool Clock B)</div>
                <div>Current Time: {hours}:{minutes}:{seconds} PDT</div>

                <button onClick={() => this.componentWillUnmount()}>Stop Time</button>
                <br/>
                <button onClick={() => this.componentDidMount()}>Restart Time</button>
            </h1>
        )
    }
}


export default Clock;