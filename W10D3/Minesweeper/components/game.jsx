import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

class Game extends React.Component {
    constructor(props) {
        super(props)

        let newBoard = new Minesweeper.Board(3, 2);
        

        this.state = {
            board: newBoard
        }

        this.updateGame = this.updateGame.bind(this)
    }

    updateGame() {

    }

    render() {
        return (
            <div>
                <h1>Today is cold.</h1>
                <Board board={this.state.board} updateGame={this.updateGame}/>
            </div>

        )
    }
}


export default Game;