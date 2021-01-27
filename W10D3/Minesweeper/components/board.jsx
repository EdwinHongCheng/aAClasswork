import React from 'react';

const Board = (props) => {
    const gridArr = props.board.grid
    return (
        <div>
            {gridArr}
        </div>
    )
}
    
export default Board;