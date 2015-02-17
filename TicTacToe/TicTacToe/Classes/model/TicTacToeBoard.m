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
    board_ = [NSMutableArray arrayWithArray:@[[vs mutableCopy], [vs mutableCopy], [vs mutableCopy]]];
  }
  return self;
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
  [board_[x] setObject:[NSNumber numberWithInteger:state] atIndex:y];
  return YES;
}

@end
