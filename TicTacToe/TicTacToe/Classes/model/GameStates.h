#ifndef TicTacToe_GameStates_h
#define TicTacToe_GameStates_h
#endif

typedef NS_ENUM(NSInteger, TicTacToeStateType) {
  TicTacToeStateX,
  TicTacToeStateO,
  TicTacToeStateEmpty,
  TicTacToeStateInvalid
};

typedef NS_ENUM(NSInteger, TicTacToeGameStateType) {
  TicTacToeGameStateNotEnded,
  TicTacToeGameStateBoardFull,
  TicTacToeGameStateXWin,
  TicTacToeGameStateOWin,
};

typedef NS_ENUM(NSInteger, TicTacToeGameType) {
  TicTacToeGameUserX,
  TicTacToeGameUserO,
  TicTacToeGameUserXO
};
