import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board';

class Game extends React.Component {
    constructor(props) {
        super(props)

        const newBoard = new Minesweeper.Board(3, 2);
        
        this.state = { board: newBoard };

        this.restartGame = this.restartGame.bind(this);
        this.updateGame = this.updateGame.bind(this)
    }

    restartGame() {
        const board = new Minesweeper.Board(9, 10);
        this.setState({ board: newBoard });
    }


    updateGame(tile, flagged) {
        if (flagged) {
            tile.toggleFlag();
        } else {
            tile.explore();
        }

        this.setState({ board: this.state.board });
    }
    

    render() {

        let modal;
        if (this.state.board.lost() || this.state.board.won()) {
            const text = this.state.board.won() ? "You won!" : "You lost!";

            modal =
                <div className='modal-screen'>
                    <div className='modal-content'>
                        <p>{text}</p>
                        <button onClick={this.restartGame}>Play Again</button>
                    </div>
                </div>;
        }


        return (
            <div>
                {/* <h1>Minesweeper</h1> */}
                {modal}
                <Board board={this.state.board} updateGame={this.updateGame}/>
            </div>

        )
    }
}


export default Game;