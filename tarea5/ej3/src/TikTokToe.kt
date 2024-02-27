class TikTokToeMovesIterator(private val state: TikTokToe): Iterator<TikTokToe> {
    private var nextMove = 0;

    override fun hasNext(): Boolean {
        // Get the next cell that is different from the last move and is not
        // occupied
        while (nextMove < 9) {
            if (nextMove != state.lastMove &&
                state.board[nextMove] != state.currentPlayer &&
                state.board[nextMove] != 3
            ) break;

            nextMove++;
        }

        return nextMove < 9;
    }

    override fun next(): TikTokToe {
        return state.makeMove(nextMove++);
    }
}

/**
 * TikTokToe instance
 *
 * @param board: IntArray - 3x3 board
 * @param currentPlayer: Int - 1 or 2, player that makes the next move
 * @param lastMove: Int - index of the last move
 */
class TikTokToe(val board: IntArray, val currentPlayer: Int, val lastMove: Int) {
    companion object {
        val WINNING_COMBINATIONS = listOf(
            intArrayOf(0, 1, 2), intArrayOf(3, 4, 5), intArrayOf(6, 7, 8),
            intArrayOf(0, 3, 6), intArrayOf(1, 4, 7), intArrayOf(2, 5, 8),
            intArrayOf(0, 4, 8), intArrayOf(2, 4, 6)
        );
    }

    public fun makeMove(index: Int): TikTokToe {
        val newBoard = board.copyOf();
        newBoard[index] += currentPlayer;
        val newPlayer = if (currentPlayer == 1) 2 else 1;

        return TikTokToe(newBoard, newPlayer, index);
    }

    // If exists a winning combination that sums 9
    public fun isWinning(): Boolean = WINNING_COMBINATIONS.any {
        it.sumOf { index -> board[index] } == 9
    }

    public fun successors(): TikTokToeMovesIterator {
        return TikTokToeMovesIterator(this);
    }
}

/**
 * TikTokToe minimax agent with alpha-beta pruning
 */
class TikTokToeMinimaxAgent {
    public fun minimax(state: TikTokToe, alpha: Int, beta: Int): Int {
        val horizontalTurn = state.currentPlayer == 1;
        if (state.isWinning()) {
            return if (horizontalTurn) -1 else 1;
        }

        if (horizontalTurn) {
            var best = Int.MIN_VALUE;
            for (successor in state.successors()) {
                best = minimax(successor, alpha, beta);
                best = maxOf(best, alpha);
                val newAlpha = maxOf(alpha, best);
                if (beta <= newAlpha) break;
            }

            return best;
        }

        var best = Int.MAX_VALUE;
        for (successor in state.successors()) {
            best = minimax(successor, alpha, beta);
            best = minOf(best, beta);
            val newBeta = minOf(beta, best);
            if (newBeta <= alpha) break;
        }

        return best;
    }
}

fun main() {
    val board = TikTokToe(IntArray(9), 1, -1);
    val agent = TikTokToeMinimaxAgent();

    for (successor in board.successors()) {
        println(agent.minimax(successor, Int.MIN_VALUE, Int.MAX_VALUE));
    }

    println(agent.minimax(board, Int.MIN_VALUE, Int.MAX_VALUE));
}
