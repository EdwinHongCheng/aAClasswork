const View = require("./ttt-view.js");
const Game = require("../../TicTacToeNodeSolution/game");

  

  $(() => {
    const newGrid = $('.ttt');
    let g = new Game();
    new View(g, newGrid);
  });
