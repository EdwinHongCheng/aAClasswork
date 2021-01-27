import React from 'react';

class Tile extends React.Component{

    render() {
        if (this.props.tile.explored && this.props.tile.bombed){
            return (
                <div>
                    <h1>B</h1>
                </div>

            )
        } else if (this.props.tile.explored && !this.props.tile.bombed){
            return (
                <div>
                    <h1>{this.props.tile.adjacentBombCount()}</h1>
                </div>

            )
        } else if (!this.props.tile.explored && this.props.tile.flagged){
            return (
                <div>
                    <h1>F</h1>
                </div>

            )
        }else{
            return (
                <div>
                    <h1>*</h1>
                </div>

            )
        }
        
    }
}

export default Tile;