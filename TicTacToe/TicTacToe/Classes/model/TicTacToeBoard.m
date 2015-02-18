#import "TicTacToeBoard.h"

/*
  The board is:
  0,0 | 0,1 | 0,2
  1,0 | 1,1 | 1,2
  2,0 | 2,1 | 2,2
*/
@interface TicTacToeBoard () {
  NSMutableArray *board_;
}
@end

@implementation TicTacToeBoard

- (id)init {
  self = [super init];
  if (self) {
    NSNumber *v = [NSNumber numberWithInteger:TicTacToeStateEmpty];
    NSMutableArray *vs = [NSMutableArray arrayWithArray:@[v, v, v]];
    board_ =
        [NSMutableArray arrayWithArray:@[[vs mutableCopy], [vs mutableCopy], [vs mutableCopy]]];
  }
  return self;
}

- (TicTacToeGameStateType)gameState {
  for (int i = 0; i < 3; i++) {
    if (board_[i][0] == board_[i][1] && board_[i][1] == board_[i][2]) {
      if ([board_[i][0] integerValue] == TicTacToeStateO) {
        return TicTacToeGameStateOWin;
      } else if ([board_[i][0] integerValue] == TicTacToeStateX) {
        return TicTacToeGameStateXWin;
      }
    }
    if (board_[0][i] == board_[1][i] && board_[1][i] == board_[2][i]) {
      if ([board_[0][i] integerValue] == TicTacToeStateO) {
        return TicTacToeGameStateOWin;
      } else if ([board_[0][i] integerValue] == TicTacToeStateX) {
        return TicTacToeGameStateXWin;
      }
    }
  }
  if (board_[0][0] == board_[1][1] && board_[1][1] == board_[2][2]) {
    if ([board_[0][0] integerValue] == TicTacToeStateO) {
      return TicTacToeGameStateOWin;
    } else if ([board_[0][0] integerValue] == TicTacToeStateX) {
      return TicTacToeGameStateXWin;
    }
  }
  if (board_[0][2] == board_[1][1] && board_[1][1] == board_[0][2]) {
    if ([board_[0][2] integerValue] == TicTacToeStateO) {
      return TicTacToeGameStateOWin;
    } else if ([board_[0][2] integerValue] == TicTacToeStateX) {
      return TicTacToeGameStateXWin;
    }
  }
  // TODO(cate): Check not full.
  return TicTacToeGameStateNotEnded;
}

- (TicTacToeStateType)stateForXPos:(int)x yPos:(int)y {
  if (x < 0 || x > 2 || y < 0 || y > 2) {
    return TicTacToeStateInvalid;
  } else {
    return [board_[x][y] integerValue];
  }
}

- (BOOL)playXPos:(int)x yPos:(int)y toState:(TicTacToeStateType)state {
  if (x < 0 || x > 2 || y < 0 || y > 2 ||
      state == TicTacToeStateEmpty || state == TicTacToeStateInvalid ||
      [board_[x][y] integerValue] != TicTacToeStateEmpty) {
    return NO;
  }
  board_[x][y] = [NSNumber numberWithInteger:state];
  return YES;
}

@end
