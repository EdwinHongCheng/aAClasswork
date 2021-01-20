class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (event => {
      const $square = $(event.currentTarget);
      this.makeMove($square);
    }));
  }

  makeMove($square) {
    const pos = $square.data("pos");
    const currentPlayer = this.game.currentPlayer;

    // gives us an error message alert if we try
    // to click an already-occupied square on the grid
    try {
      this.game.playMove(pos);
    } catch (e) {
      alert("This " + e.msg.toLowerCase());
      return;
    }

    // changes the class so the square (one of the 9)
    // shows up as the current player's color + mark (purely visual)
    $square.addClass(currentPlayer);


    if (this.game.isOver()) {

      // cleanup click handlers.
      // we cannot click anymore (once the game is over)
      // .off() - Remove an event handler.
      this.$el.off("click");
      this.$el.addClass("game-over");

      // displays the "You win" message, etc.
      const winner = this.game.winner();
      const $figcaption = $("<figcaption>");

      if (winner) {
        this.$el.addClass(`winner-${winner}`);
        $figcaption.html(`You win, ${winner}!`);
      } else {
        $figcaption.html("It's a draw!");
      }

      this.$el.append($figcaption);
    }
  }

  setupBoard() {
    const $ul = $("<ul>");

    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        let $li = $("<li>");
        $li.data("pos", [rowIdx, colIdx]);

        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
